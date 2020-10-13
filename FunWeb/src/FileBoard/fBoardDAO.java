package FileBoard;

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



public class fBoardDAO {
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
	
	public fBoardBean getfBoard(int num) {
		fBoardBean fbb=null;
		Connection con=null;
		ResultSet rs=null;
		PreparedStatement pstmt2=null;
		PreparedStatement pstmt=null;
		try {
			// 1,2 단계 디비연결 메서드 호출
			con=getConnection();
			// 3단계 - 접속정보를 이용해서 select sql 구문 만들고 실행할수 있는 자바프로그램 생성
//			        num에 해당하는 게시판 글 가져오기
			String sql="select * from fileboard where num=?";
			pstmt=con.prepareStatement(sql);
			pstmt.setInt(1, num);
			// 4단계 - sql구문 실행(select) => 결과 저장
			rs=pstmt.executeQuery();
			// 5단계 - 결과 저장 => 출력    
			// if 첫행으로 이동 데이터 있으면  열을 찾아서 출력
			if(rs.next()){
				fbb=new fBoardBean();
				fbb.setNum(rs.getInt("num"));
				fbb.setName(rs.getString("name"));
				fbb.setPass(rs.getString("pass"));
				fbb.setSubject(rs.getString("subject"));
				fbb.setContent(rs.getString("content"));
				fbb.setReadcount(rs.getInt("readcount"));
				fbb.setDate(rs.getTimestamp("date"));
				fbb.setFile(rs.getString("file"));
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
		return fbb;
	}
	public void insertfileboard(fBoardBean fbb) {
		Connection con=null;
		ResultSet rs=null;
		PreparedStatement pstmt2=null;
		PreparedStatement pstmt=null;
		System.out.println("BeanDB insert()");
		System.out.println("받은 주소:" + fbb );
		System.out.println("주소를 찾아서 Num값 가져옴" + fbb.getNum());
		System.out.println("주소를 찾아서 Name값 가져옴" + fbb.getName());
		System.out.println("주소를 찾아서 pass값 가져옴" + fbb.getPass());
		System.out.println("주소를 찾아서 Subject값 가져옴" + fbb.getSubject());
		System.out.println("주소를 찾아서 Content값 가져옴" + fbb.getContent());
		System.out.println("주소를 찾아서 Readcount값 가져옴" + fbb.getReadcount());
		System.out.println("주소를 찾아서 Date값 가져옴" + fbb.getDate());
		System.out.println("주소를 찾아서 File값 가져옴" + fbb.getFile());
		
		try {
			 con=getConnection();
			 String sql2="select max(num) from fileboard";
			 pstmt2=con.prepareStatement(sql2);
			 rs=pstmt2.executeQuery();
			 int num =0;
			 if(rs.next()) {
				 num=rs.getInt("max(num)")+1;
			 }
			 String sql="insert into fileboard(num,name, pass, subject, content, readcount, date, file) values(?,?,?,?,?,?,?,?)";
			 pstmt=con.prepareStatement(sql);
			 pstmt.setInt(1, num);
			 pstmt.setString(2, fbb.getName());
			 pstmt.setString(3, fbb.getPass());
			 pstmt.setString(4, fbb.getSubject());
			 pstmt.setNString(5, fbb.getContent());
			 pstmt.setInt(6, fbb.getReadcount());
			 pstmt.setTimestamp(7, fbb.getDate());
			 //file추가
			 pstmt.setNString(8, fbb.getFile());
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
	public List getfileBoardList(int startRow, int pageSize) {
		Connection con=null;
		ResultSet rs=null;
		PreparedStatement pstmt2=null;
		PreparedStatement pstmt=null;
		List boardList = new ArrayList();
		try{
			con =getConnection();
			String sql="select *from fileboard order by num desc limit ?, ?";
			 pstmt=con.prepareStatement(sql);
			 pstmt.setInt(1, startRow-1);
			 pstmt.setInt(2, pageSize);
			 rs = pstmt.executeQuery();
			 while(rs.next()){
				 fBoardBean fbb = new fBoardBean();
				 fbb.setNum(rs.getInt("num"));
				 fbb.setName(rs.getString("name"));
				 fbb.setPass(rs.getString("pass"));
				 fbb.setSubject(rs.getString("subject"));
				 fbb.setContent(rs.getString("content"));
				 fbb.setReadcount(rs.getInt("readcount"));
				 fbb.setDate(rs.getTimestamp("date"));
				 fbb.setFile(rs.getString("file"));
				 //배열에 첫번째 칸에 저장
				 boardList.add(fbb);
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
			String sql="update fileboard set readcount=readcount+1 where num=?";
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
	public int numCheck(fBoardBean fbb) {
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
			String sql="select * from fileboard where num=?";
			pstmt=con.prepareStatement(sql);
			pstmt.setInt(1, fbb.getNum());
			// 4단계 - sql구문 실행(select) => 결과 저장
			rs=pstmt.executeQuery();
			// 5단계 - 결과 저장 => 
			// rs.next() 다음행이동 했을때 데이터가 있으면  true / 데이터가 없으면 false
			if(rs.next()){
				// "폼에서 가져온 비밀번호".equals("디비에서 가져온 비밀번호")
				if(fbb.getPass().equals(rs.getString("pass"))){
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
	public void updateBoard(fBoardBean fbb) {
		Connection con=null;
		ResultSet rs=null;
		PreparedStatement pstmt2=null;
		PreparedStatement pstmt=null;
		try {
			con =getConnection();
			String sql="update fileboard set name=?, subject=?, content=?, file=? where num=?";
			pstmt=con.prepareStatement(sql);
			pstmt.setString(1, fbb.getName());
			pstmt.setString(2, fbb.getSubject());
			pstmt.setString(3, fbb.getContent());
			pstmt.setString(4, fbb.getFile());
			pstmt.setInt(5, fbb.getNum());
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
	public void deletefileBoard(fBoardBean fbb) {
		Connection con=null;
		ResultSet rs=null;
		PreparedStatement pstmt2=null;
		PreparedStatement pstmt=null;
		try {
			con =getConnection();
			String sql="delete from fileboard where num=?";
			pstmt=con.prepareStatement(sql);
			pstmt.setInt(1, fbb.getNum());
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
			String sql="select count(*) from fileboard";
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
			String sql="select count(*) from fileboard where subject like ?";
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
	public List getfileBoardList(int startRow, int pageSize, String search) {
		Connection con=null;
		ResultSet rs=null;
		PreparedStatement pstmt2=null;
		PreparedStatement pstmt=null;
		List boardList = new ArrayList();
		try{
			con =getConnection();
			String sql="select *from fileboard  where subject like ? order by num desc limit ?, ?";
			 pstmt=con.prepareStatement(sql);
			 pstmt.setString(1,  "%"+search+"%");
			 pstmt.setInt(2, startRow-1);
			 pstmt.setInt(3, pageSize);
			 rs = pstmt.executeQuery();
			 while(rs.next()){
				 fBoardBean fbb = new fBoardBean();
				 fbb.setNum(rs.getInt("num"));
				 fbb.setName(rs.getString("name"));
				 fbb.setPass(rs.getString("pass"));
				 fbb.setSubject(rs.getString("subject"));
				 fbb.setContent(rs.getString("content"));
				 fbb.setReadcount(rs.getInt("readcount"));
				 fbb.setDate(rs.getTimestamp("date"));
				 fbb.setFile(rs.getString("file"));
				 //배열에 첫번째 칸에 저장
				 boardList.add(fbb);
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
