package Board;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import javax.activation.DataSource;
import javax.naming.Context;
import javax.naming.InitialContext;



public class BoardDAO {
	// 1,2 디비연결 메서드
	public Connection getConnection() throws Exception{
		// 예외처리를 함수 호출하는 곳에서 처리하도록 설정
		Connection con=null;
		// JDBC 프로그램 설치
		// 1단계 - JDBC프로그램안에 Driver 프로그램 가져오기
		Class.forName("com.mysql.jdbc.Driver");
		// 2단계 - DriverManager 자바프로그램이 Driver 프로그램을 가지고 디비서버 접속
		//        => 접속정보 저장
		String dbUrl="jdbc:mysql://localhost:3306/jspDB1?serverTimezone=UTC";
		String dbUser="jspid";
		String dbPass="jsppass";
		con=DriverManager.getConnection(dbUrl, dbUser, dbPass);
		
		//커넥션 풀(Connection pool)
		//데이터베이스와 연결된 Connection객체를 미리 생성하여 Pool(풀, 기억장소)wjwkd
		//필요할 때마다 풀에 접근하여 Connection객체 사용, 작업 끝나면 반환
		//프로그램은 서버에 미리 설치
		//1. WebContent META-INK  - context.xml 만들어 미리 자원 준비
		//2. DAO 자원이름을 호출해 사용
		//장점 : 속도 증가, 수정 시 xml 하나만 수정하면 됨
//		Context init=new InitialContext();
//		DataSource ds = (DataSource)init.lookup("java:comp/env/jdbc/MysqlDB");
//		con=ds.get
		return con;
	}
	
	public BoardBean getBoard(int num) {
		BoardBean bb=null;
		Connection con=null;
		ResultSet rs=null;
		PreparedStatement pstmt2=null;
		PreparedStatement pstmt=null;
		try {
			// 1,2 단계 디비연결 메서드 호출
			con=getConnection();
			// 3단계 - 접속정보를 이용해서 select sql 구문 만들고 실행할수 있는 자바프로그램 생성
//			        num에 해당하는 게시판 글 가져오기
			String sql="select * from board where num=?";
			pstmt=con.prepareStatement(sql);
			pstmt.setInt(1, num);
			// 4단계 - sql구문 실행(select) => 결과 저장
			rs=pstmt.executeQuery();
			// 5단계 - 결과 저장 => 출력    
			// if 첫행으로 이동 데이터 있으면  열을 찾아서 출력
			if(rs.next()){
				bb=new BoardBean();
				bb.setNum(rs.getInt("num"));
				bb.setName(rs.getString("name"));
				bb.setPass(rs.getString("pass"));
				bb.setSubject(rs.getString("subject"));
				bb.setContent(rs.getString("content"));
				bb.setReadcount(rs.getInt("readcount"));
				bb.setDate(rs.getTimestamp("date"));
				bb.setFile(rs.getString("file"));
			}
		} catch (Exception e) {
			e.printStackTrace();
		}finally {
			//마무리
			if(rs!=null)try {rs.close();}catch(SQLException ex) {}
			if(pstmt!=null)try {pstmt.close();}catch(SQLException ex) {}
			if(pstmt2!=null)try {pstmt2.close();}catch(SQLException ex) {}
			if(con!=null)try {con.close();}catch(SQLException ex) {}
		}
		return bb;
	}
	public void insertboard(BoardBean bb) {
		Connection con=null;
		ResultSet rs=null;
		PreparedStatement pstmt2=null;
		PreparedStatement pstmt=null;
		System.out.println("BeanDB insert()");
		System.out.println("받은 주소:" + bb );
		System.out.println("주소를 찾아서 Num값 가져옴" + bb.getNum());
		System.out.println("주소를 찾아서 Name값 가져옴" + bb.getName());
		System.out.println("주소를 찾아서 pass값 가져옴" + bb.getPass());
		System.out.println("주소를 찾아서 Subject값 가져옴" + bb.getSubject());
		System.out.println("주소를 찾아서 Content값 가져옴" + bb.getContent());
		System.out.println("주소를 찾아서 Readcount값 가져옴" + bb.getReadcount());
		System.out.println("주소를 찾아서 Date값 가져옴" + bb.getDate());
		System.out.println("주소를 찾아서 File값 가져옴" + bb.getFile());
		
		try {
			 con=getConnection();
			 String sql2="select max(num) from board";
			 pstmt2=con.prepareStatement(sql2);
			 rs=pstmt2.executeQuery();
			 int num =0;
			 if(rs.next()) {
				 num=rs.getInt("max(num)")+1;
			 }
			 String sql="insert into board(num,name, pass, subject, content, readcount, date, file) values(?,?,?,?,?,?,?,?)";
			 pstmt=con.prepareStatement(sql);
			 pstmt.setInt(1, num);
			 pstmt.setString(2, bb.getName());
			 pstmt.setString(3, bb.getPass());
			 pstmt.setString(4, bb.getSubject());
			 pstmt.setNString(5, bb.getContent());
			 pstmt.setInt(6, bb.getReadcount());
			 pstmt.setTimestamp(7, bb.getDate());
			 //file추가
			 pstmt.setNString(8, bb.getFile());
			 pstmt.executeUpdate();
		}catch(Exception e) {
			//예외처리
			e.printStackTrace();
		}finally {
			//예외상관없이 처리됨
			//마무리, 기억장소 해제
			if(rs!=null)try {rs.close();}catch(SQLException ex) {}
			if(pstmt!=null)try {pstmt.close();}catch(SQLException ex) {}
			if(pstmt2!=null)try {pstmt2.close();}catch(SQLException ex) {}
			if(con!=null)try {con.close();}catch(SQLException ex) {}
				
		}
		
	}
	public List getBoardList(int startRow, int pageSize) {
		Connection con=null;
		ResultSet rs=null;
		PreparedStatement pstmt2=null;
		PreparedStatement pstmt=null;
		List boardList = new ArrayList();
		try{
			con =getConnection();
			String sql="select *from board order by num desc limit ?, ?";
			 pstmt=con.prepareStatement(sql);
			 pstmt.setInt(1, startRow-1);
			 pstmt.setInt(2, pageSize);
			 rs = pstmt.executeQuery();
			 while(rs.next()){
				 BoardBean bb = new BoardBean();
				 bb.setNum(rs.getInt("num"));
				 bb.setName(rs.getString("name"));
				 bb.setPass(rs.getString("pass"));
				 bb.setSubject(rs.getString("subject"));
				 bb.setContent(rs.getString("content"));
				 bb.setReadcount(rs.getInt("readcount"));
				 bb.setDate(rs.getTimestamp("date"));
				 bb.setFile(rs.getString("file"));
				 //배열에 첫번째 칸에 저장
				 boardList.add(bb);
			 }
		}catch(Exception e){
			e.printStackTrace();
		}finally{
			if(rs!=null)try {rs.close();}catch(SQLException ex) {}
			if(pstmt!=null)try {pstmt.close();}catch(SQLException ex) {}
			if(pstmt2!=null)try {pstmt2.close();}catch(SQLException ex) {}
			if(con!=null)try {con.close();}catch(SQLException ex) {}
			}
		return boardList;
		}//마지막
	
	public void updateReadcount(int num){
		Connection con=null;
		ResultSet rs=null;
		PreparedStatement pstmt2=null;
		PreparedStatement pstmt=null;
		try {
			 con =getConnection();
			String sql="update board set readcount=readcount+1 where num=?";
			 pstmt=con.prepareStatement(sql);
			 pstmt.setInt(1, num);
			 pstmt.executeUpdate();
		}catch (Exception e) {
		e.printStackTrace();
		}finally {
			if(rs!=null)try {rs.close();}catch(SQLException ex) {}
			if(pstmt!=null)try {pstmt.close();}catch(SQLException ex) {}
			if(pstmt2!=null)try {pstmt2.close();}catch(SQLException ex) {}
			if(con!=null)try {con.close();}catch(SQLException ex) {}
		}
	}
	public int numCheck(BoardBean bb) {
		Connection con=null;
		ResultSet rs=null;
		PreparedStatement pstmt2=null;
		PreparedStatement pstmt=null;
		int check=-1;
		try {
			// JDBC 프로그램 설치
			// 1,2 단계 디비연결 메서드 호출
			con=getConnection();
			// 3단계 - 접속정보를 이용해서 select sql 구문 만들고 실행할수 있는 자바프로그램 생성
			String sql="select * from board where num=?";
			pstmt=con.prepareStatement(sql);
			pstmt.setInt(1, bb.getNum());
			// 4단계 - sql구문 실행(select) => 결과 저장
			rs=pstmt.executeQuery();
			// 5단계 - 결과 저장 => 
			// rs.next() 다음행이동 했을때 데이터가 있으면  true / 데이터가 없으면 false
			if(rs.next()){
				// "폼에서 가져온 비밀번호".equals("디비에서 가져온 비밀번호")
				if(bb.getPass().equals(rs.getString("pass"))){
					check=1; //num 비밀번호 일치
				}else{
					check=0;//비밀번호틀림
				}
			}else {
				check=-1;	//num 틀림
			}
		} catch (Exception e) {
			e.printStackTrace();
		}finally {
			//마무리
			if(rs!=null)try {rs.close();}catch(SQLException ex) {}
			if(pstmt!=null)try {pstmt.close();}catch(SQLException ex) {}
			if(pstmt2!=null)try {pstmt2.close();}catch(SQLException ex) {}
			if(con!=null)try {con.close();}catch(SQLException ex) {}
		}
		return check;
	}
	public void updateBoard(BoardBean bb) {
		Connection con=null;
		ResultSet rs=null;
		PreparedStatement pstmt2=null;
		PreparedStatement pstmt=null;
		try {
			con =getConnection();
			String sql="update board set name=?, subject=?, content=?, file=? where num=?";
			pstmt=con.prepareStatement(sql);
			pstmt.setString(1, bb.getName());
			pstmt.setString(2, bb.getSubject());
			pstmt.setString(3, bb.getContent());
			pstmt.setString(4, bb.getFile());
			pstmt.setInt(5, bb.getNum());
			pstmt.executeUpdate();
		}catch (Exception e) {
			e.printStackTrace();
		}finally {
			if(rs!=null)try {rs.close();}catch(SQLException ex) {}
			if(pstmt!=null)try {pstmt.close();}catch(SQLException ex) {}
			if(pstmt2!=null)try {pstmt2.close();}catch(SQLException ex) {}
			if(con!=null)try {con.close();}catch(SQLException ex) {}
		}
	}
	public void deleteBoard(BoardBean bb) {
		Connection con=null;
		ResultSet rs=null;
		PreparedStatement pstmt2=null;
		PreparedStatement pstmt=null;
		try {
			con =getConnection();
			String sql="delete from board where num=?";
			pstmt=con.prepareStatement(sql);
			pstmt.setInt(1, bb.getNum());
			pstmt.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
		}finally {
			if(rs!=null)try {rs.close();}catch(SQLException ex) {}
			if(pstmt!=null)try {pstmt.close();}catch(SQLException ex) {}
			if(pstmt2!=null)try {pstmt2.close();}catch(SQLException ex) {}
			if(con!=null)try {con.close();}catch(SQLException ex) {}
		}
	}
	public int getBoardCount() {
		Connection con=null;
		ResultSet rs=null;
		PreparedStatement pstmt2=null;
		PreparedStatement pstmt=null;
		int count = 0;
		try {
			con = getConnection();
			//게시판 글 전체 갯수
			String sql="select count(*) from board";
			pstmt = con.prepareStatement(sql);
			rs = pstmt.executeQuery();
			if(rs.next()) {
				count=rs.getInt("count(*)");
				
			}
		} catch (Exception e) {
			e.printStackTrace();
		}finally {
			if(rs!=null)try {rs.close();}catch(SQLException ex) {}
			if(pstmt!=null)try {pstmt.close();}catch(SQLException ex) {}
			if(pstmt2!=null)try {pstmt2.close();}catch(SQLException ex) {}
			if(con!=null)try {con.close();}catch(SQLException ex) {}
		}
		return count;
	}
	public int getBoardCount(String search) {
		Connection con=null;
		ResultSet rs=null;
		PreparedStatement pstmt2=null;
		PreparedStatement pstmt=null;
		int count = 0;
		try {
			con = getConnection();
			//게시판 글 전체 갯수
//			String sql="select count(*) from board where subject like '%검색어%'";
			String sql="select count(*) from board where subject like ?";
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1,  "%"+search+"%");
			rs = pstmt.executeQuery();
			if(rs.next()) {
				count=rs.getInt("count(*)");
				
			}
		} catch (Exception e) {
			e.printStackTrace();
		}finally {
			if(rs!=null)try {rs.close();}catch(SQLException ex) {}
			if(pstmt!=null)try {pstmt.close();}catch(SQLException ex) {}
			if(pstmt2!=null)try {pstmt2.close();}catch(SQLException ex) {}
			if(con!=null)try {con.close();}catch(SQLException ex) {}
		}
		return count;
	}
	public List getBoardList(int startRow, int pageSize, String search) {
		Connection con=null;
		ResultSet rs=null;
		PreparedStatement pstmt2=null;
		PreparedStatement pstmt=null;
		List boardList = new ArrayList();
		try{
			con =getConnection();
			String sql="select *from board  where subject like ? order by num desc limit ?, ?";
			 pstmt=con.prepareStatement(sql);
			 pstmt.setString(1,  "%"+search+"%");
			 pstmt.setInt(2, startRow-1);
			 pstmt.setInt(3, pageSize);
			 rs = pstmt.executeQuery();
			 while(rs.next()){
				 BoardBean bb = new BoardBean();
				 bb.setNum(rs.getInt("num"));
				 bb.setName(rs.getString("name"));
				 bb.setPass(rs.getString("pass"));
				 bb.setSubject(rs.getString("subject"));
				 bb.setContent(rs.getString("content"));
				 bb.setReadcount(rs.getInt("readcount"));
				 bb.setDate(rs.getTimestamp("date"));
				 bb.setFile(rs.getString("file"));
				 //배열에 첫번째 칸에 저장
				 boardList.add(bb);
			 }
		}catch(Exception e){
			e.printStackTrace();
		}finally{
			if(rs!=null)try {rs.close();}catch(SQLException ex) {}
			if(pstmt!=null)try {pstmt.close();}catch(SQLException ex) {}
			if(pstmt2!=null)try {pstmt2.close();}catch(SQLException ex) {}
			if(con!=null)try {con.close();}catch(SQLException ex) {}
			}
		return boardList;
		}//마지막
	}//메인 
