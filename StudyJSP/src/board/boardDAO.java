package board;
 
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.jsp.tagext.TryCatchFinally;
 
public class boardDAO {
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
			return con;
		}
 
	// 리턴값없음 insertBoard(bb바구니주소값)
	public void insertBoard(BoardBean bb) {
		try {
			// 1,2 단계 디비연결 메서드 호출
			 Connection con=getConnection();
			//3단계 num구하기 기존글에서 최대 num 값을 구해서 +1 
			String sql2="select max(num) from board";
			PreparedStatement pstmt2=con.prepareStatement(sql2);
			//4단계 실행 => rs 저장
			ResultSet rs=pstmt2.executeQuery();
			//5단계 rs 첫행이동 max(num) 가져오기 +1
			int num=0;
			if(rs.next()){
				num=rs.getInt("max(num)")+1;
			}
 
			// 3단계 - 접속정보를 이용해서 insert sql 구문 만들고 실행할수 있는 자바프로그램 생성
			String sql="insert into board(num,name,pass,subject,content,readcount,date) values(?,?,?,?,?,?,?)";
			PreparedStatement pstmt=con.prepareStatement(sql);
			pstmt.setInt(1, num);  //parameterIndex ? 물음표 순서 ,값저장된 변수
			pstmt.setString(2, bb.getName());
			pstmt.setString(3, bb.getPass());
			pstmt.setString(4, bb.getSubject());
			pstmt.setString(5, bb.getContent());
			pstmt.setInt(6, bb.getReadcount());
			pstmt.setTimestamp(7, bb.getDate());
			// 4단계 - sql실행  (insert, update, delete)
			pstmt.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
		}finally {
			//마무리
		}
	}//메서드
	//리턴할형 BoardBean bb = getBoard(num) 메서드 만들고 호출
	public BoardBean getBoard(int num) {
		BoardBean bb=null;
		try {
			// 1,2 단계 디비연결 메서드 호출
			 Connection con=getConnection();
			//조회수   1 증가
			// 3단계  조회수= 기존조회수+1
			String sql2="update board set readcount=readcount+1 where num=?";
			PreparedStatement pstmt2=con.prepareStatement(sql2);
			pstmt2.setInt(1, num);  //parameterIndex ? 물음표 순서 ,값저장된 변수
			// 4단계 - sql실행  (insert, update, delete)
			pstmt2.executeUpdate();
 
			// 3단계 - 접속정보를 이용해서 select sql 구문 만들고 실행할수 있는 자바프로그램 생성
//			        num에 해당하는 게시판 글 가져오기
			String sql="select * from board where num=?";
			PreparedStatement pstmt=con.prepareStatement(sql);
			pstmt.setInt(1, num);
			// 4단계 - sql구문 실행(select) => 결과 저장
			ResultSet rs=pstmt.executeQuery();
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
			}
		} catch (Exception e) {
			e.printStackTrace();
		}finally {
			//마무리
		}
		return bb;
	}
	// int check = numCheck(BoardBean ) 메서드 만들고 호출
		public int numCheck(BoardBean bb) {
			int check=-1;
			try {
				// JDBC 프로그램 설치
				// 1,2 단계 디비연결 메서드 호출
				 Connection con=getConnection();
				// 3단계 - 접속정보를 이용해서 select sql 구문 만들고 실행할수 있는 자바프로그램 생성
				String sql="select * from board where num=?";
				PreparedStatement pstmt=con.prepareStatement(sql);
				pstmt.setInt(1, bb.getNum());
				// 4단계 - sql구문 실행(select) => 결과 저장
				ResultSet rs=pstmt.executeQuery();
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
			}
			return check;
		}
		public void updateBoard(BoardBean bb) {
			try {
				Connection con =getConnection();
				String sql="update board set name=?, subject=?, content=? where num=?";
				 PreparedStatement pstmt=con.prepareStatement(sql);
				pstmt.setString(1, bb.getName());
				pstmt.setNString(2, bb.getSubject());
				pstmt.setNString(3, bb.getContent());
				pstmt.setInt(4, bb.getNum());
				pstmt.executeUpdate();
			}catch (Exception e) {
				e.printStackTrace();
			}finally {
				
			}
		}
		public void deleteBoard(BoardBean bb) {
			try {
				Connection con =getConnection();
				String sql="delete from board where num=?";
				 PreparedStatement pstmt=con.prepareStatement(sql);
				pstmt.setInt(1, bb.getNum());
				pstmt.executeUpdate();
			} catch (Exception e) {
				e.printStackTrace();
			}finally {
				
			}
		}
	public List getBoardList() {
		List boardList = new ArrayList();
		try{
			Connection con =getConnection();
			String sql="select *from board order by num desc limit ?, ?";
			 PreparedStatement pstmt=con.prepareStatement(sql);
			 ResultSet rs = pstmt.executeQuery();
			 while(rs.next()){
				 BoardBean bb = new BoardBean();
				 bb.setNum(rs.getInt("num"));
				 bb.setName(rs.getString("name"));
				 bb.setPass(rs.getString("pass"));
				 bb.setSubject(rs.getString("subject"));
				 bb.setContent(rs.getString("content"));
				 bb.setReadcount(rs.getInt("readcount"));
				 bb.setDate(rs.getTimestamp("date"));
				 //배열에 첫번째 칸에 저장
				 boardList.add(bb);
			 }
		}catch(Exception e){
			e.printStackTrace();
		}finally{
				
			}
		return boardList;
		}
}//클래스
 