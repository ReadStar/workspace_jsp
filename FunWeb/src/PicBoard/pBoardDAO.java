package PicBoard;

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



public class pBoardDAO {
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
	
	public pBoardBean getfBoard(int num) {
		pBoardBean pbb=null;
		Connection con=null;
		ResultSet rs=null;
		PreparedStatement pstmt2=null;
		PreparedStatement pstmt=null;
		try {
			// 1,2 단계 디비연결 메서드 호출
			con=getConnection();
			// 3단계 - 접속정보를 이용해서 select sql 구문 만들고 실행할수 있는 자바프로그램 생성
//			        num에 해당하는 게시판 글 가져오기
			String sql="select * from picboard where num=?";
			pstmt=con.prepareStatement(sql);
			pstmt.setInt(1, num);
			// 4단계 - sql구문 실행(select) => 결과 저장
			rs=pstmt.executeQuery();
			// 5단계 - 결과 저장 => 출력    
			// if 첫행으로 이동 데이터 있으면  열을 찾아서 출력
			if(rs.next()){
				pbb=new pBoardBean();
				pbb.setNum(rs.getInt("num"));
				pbb.setName(rs.getString("name"));
				pbb.setPass(rs.getString("pass"));
				pbb.setSubject(rs.getString("subject"));
				pbb.setContent(rs.getString("content"));
				pbb.setReadcount(rs.getInt("readcount"));
				pbb.setDate(rs.getTimestamp("date"));
				pbb.setFile(rs.getString("file"));
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
		return pbb;
	}
	public void insertpicboard(pBoardBean pbb) {
		Connection con=null;
		ResultSet rs=null;
		PreparedStatement pstmt2=null;
		PreparedStatement pstmt=null;
		System.out.println("BeanDB insert()");
		System.out.println("받은 주소:" + pbb );
		System.out.println("주소를 찾아서 Num값 가져옴" + pbb.getNum());
		System.out.println("주소를 찾아서 Name값 가져옴" + pbb.getName());
		System.out.println("주소를 찾아서 pass값 가져옴" + pbb.getPass());
		System.out.println("주소를 찾아서 Subject값 가져옴" + pbb.getSubject());
		System.out.println("주소를 찾아서 Content값 가져옴" + pbb.getContent());
		System.out.println("주소를 찾아서 Readcount값 가져옴" + pbb.getReadcount());
		System.out.println("주소를 찾아서 Date값 가져옴" + pbb.getDate());
		System.out.println("주소를 찾아서 File값 가져옴" + pbb.getFile());
		
		try {
			 con=getConnection();
			 String sql2="select max(num) from picboard";
			 pstmt2=con.prepareStatement(sql2);
			 rs=pstmt2.executeQuery();
			 int num =0;
			 if(rs.next()) {
				 num=rs.getInt("max(num)")+1;
			 }
			 String sql="insert into picboard(num,name, pass, subject, content, readcount, date, file) values(?,?,?,?,?,?,?,?)";
			 pstmt=con.prepareStatement(sql);
			 pstmt.setInt(1, num);
			 pstmt.setString(2, pbb.getName());
			 pstmt.setString(3, pbb.getPass());
			 pstmt.setString(4, pbb.getSubject());
			 pstmt.setNString(5, pbb.getContent());
			 pstmt.setInt(6, pbb.getReadcount());
			 pstmt.setTimestamp(7, pbb.getDate());
			 //file추가
			 pstmt.setNString(8, pbb.getFile());
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
	public List getpicBoardList(int startRow, int pageSize) {
		Connection con=null;
		ResultSet rs=null;
		PreparedStatement pstmt2=null;
		PreparedStatement pstmt=null;
		List boardList = new ArrayList();
		try{
			con =getConnection();
			String sql="select *from picboard order by num desc limit ?, ?";
			 pstmt=con.prepareStatement(sql);
			 pstmt.setInt(1, startRow-1);
			 pstmt.setInt(2, pageSize);
			 rs = pstmt.executeQuery();
			 while(rs.next()){
				 pBoardBean pbb = new pBoardBean();
				 pbb.setNum(rs.getInt("num"));
				 pbb.setName(rs.getString("name"));
				 pbb.setPass(rs.getString("pass"));
				 pbb.setSubject(rs.getString("subject"));
				 pbb.setContent(rs.getString("content"));
				 pbb.setReadcount(rs.getInt("readcount"));
				 pbb.setDate(rs.getTimestamp("date"));
				 pbb.setFile(rs.getString("file"));
				 //배열에 첫번째 칸에 저장
				 boardList.add(pbb);
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
			String sql="update picboard set readcount=readcount+1 where num=?";
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
	public int numCheck(pBoardBean pbb) {
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
			String sql="select * from picboard where num=?";
			pstmt=con.prepareStatement(sql);
			pstmt.setInt(1, pbb.getNum());
			// 4단계 - sql구문 실행(select) => 결과 저장
			rs=pstmt.executeQuery();
			// 5단계 - 결과 저장 => 
			// rs.next() 다음행이동 했을때 데이터가 있으면  true / 데이터가 없으면 false
			if(rs.next()){
				// "폼에서 가져온 비밀번호".equals("디비에서 가져온 비밀번호")
				if(pbb.getPass().equals(rs.getString("pass"))){
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
	public void updateBoard(pBoardBean pbb) {
		Connection con=null;
		ResultSet rs=null;
		PreparedStatement pstmt2=null;
		PreparedStatement pstmt=null;
		try {
			con =getConnection();
			String sql="update picboard set name=?, subject=?, content=?, file=? where num=?";
			pstmt=con.prepareStatement(sql);
			pstmt.setString(1, pbb.getName());
			pstmt.setString(2, pbb.getSubject());
			pstmt.setString(3, pbb.getContent());
			pstmt.setString(4, pbb.getFile());
			pstmt.setInt(5, pbb.getNum());
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
	public void deletepicBoard(pBoardBean pbb) {
		Connection con=null;
		ResultSet rs=null;
		PreparedStatement pstmt2=null;
		PreparedStatement pstmt=null;
		try {
			con =getConnection();
			String sql="delete from picboard where num=?";
			pstmt=con.prepareStatement(sql);
			pstmt.setInt(1, pbb.getNum());
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
			String sql="select count(*) from picboard";
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
			String sql="select count(*) from picboard where subject like ?";
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
	public List getPicBoardList(int startRow, int pageSize, String search) {
		Connection con=null;
		ResultSet rs=null;
		PreparedStatement pstmt2=null;
		PreparedStatement pstmt=null;
		List boardList = new ArrayList();
		try{
			con =getConnection();
			String sql="select *from picboard  where subject like ? order by num desc limit ?, ?";
			 pstmt=con.prepareStatement(sql);
			 pstmt.setString(1,  "%"+search+"%");
			 pstmt.setInt(2, startRow-1);
			 pstmt.setInt(3, pageSize);
			 rs = pstmt.executeQuery();
			 while(rs.next()){
				 pBoardBean pbb = new pBoardBean();
				 pbb.setNum(rs.getInt("num"));
				 pbb.setName(rs.getString("name"));
				 pbb.setPass(rs.getString("pass"));
				 pbb.setSubject(rs.getString("subject"));
				 pbb.setContent(rs.getString("content"));
				 pbb.setReadcount(rs.getInt("readcount"));
				 pbb.setDate(rs.getTimestamp("date"));
				 pbb.setFile(rs.getString("file"));
				 //배열에 첫번째 칸에 저장
				 boardList.add(pbb);
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
