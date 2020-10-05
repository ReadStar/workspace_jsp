package Member;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

public class MemberDAO {
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
		// // 접근지정자 리턴값없음 insertMember(mb주소값 받을 변수) 메서드만들기
		public void insertMember(MemberBean mb) {
			try {
				//1,2단계
				Connection con=getConnection();
				//3 sql
				String sql="insert into member(id,pass,name,date,email,address,phone,mobile) values(?,?,?,?,?,?,?,?)";
				 PreparedStatement pstmt=con.prepareStatement(sql);
				 pstmt.setString(1, mb.getId());  //parameterIndex ? 물음표 순서 ,값저장된 변수
				 pstmt.setString(2, mb.getPass());
				 pstmt.setString(3, mb.getName());
				 pstmt.setTimestamp(4, mb.getDate());
				 pstmt.setString(5, mb.getEmail());
				 pstmt.setString(6, mb.getAddress());
				 pstmt.setString(7, mb.getPhone());
				 pstmt.setString(8, mb.getMobile());
				// 4 실행
				 pstmt.executeUpdate();
				
			} catch (Exception e) {
				e.printStackTrace();
			}finally {
				//마무리
			}
		}
		
		// int check = userCheck(id,pass)
		public int userCheck(String id,String pass) {
			int check=-1;
			try {
				//1,2단계
				Connection con=getConnection();
				//3
				String sql="select * from member where id=?";
				PreparedStatement pstmt=con.prepareStatement(sql);
				pstmt.setString(1, id);
				// 4
				ResultSet rs=pstmt.executeQuery();
				//5
				if(rs.next()) {
					if(pass.equals(rs.getString("pass"))) {
						check=1;
					}else {
						check=0;
					}
				}else {
					check=-1;
				}
			} catch (Exception e) {
				e.printStackTrace();
			}finally {
				//마무리
			}
			return check;
		}
		// getMember(id)
		public MemberBean getMember(String id) {
			MemberBean mb=null;
			try {
				//1,2단계
				Connection con=getConnection();
				//3
				String sql="select * from member where id=?";
				PreparedStatement pstmt=con.prepareStatement(sql);
				pstmt.setString(1, id);
				// 4
				ResultSet rs=pstmt.executeQuery();
				//5
				if(rs.next()) {
					// 객체생성(기억장소할당)
					mb=new MemberBean();
					// set 멤버변수 <- rs 가져와서 저장
					mb.setId(rs.getString("id"));
					mb.setPass(rs.getString("pass"));
					mb.setName(rs.getString("name"));
					mb.setDate(rs.getTimestamp("date"));
					mb.setEmail(rs.getString("email"));
					mb.setAddress(rs.getString("address"));
					mb.setPhone(rs.getString("phone"));
					mb.setMobile(rs.getString("mobile"));
				}
			} catch (Exception e) {
				e.printStackTrace();
			}finally {
				//마무리
			}
			return mb;
		}
		public void updateMember(MemberBean mb) {
			try {
				//1,2단계
				Connection con=getConnection();
				//3 sql
				String sql="update member set name=?, email=?, address=?, phone=?, mobile=? where id =?";
				 PreparedStatement pstmt=con.prepareStatement(sql);
				 pstmt.setString(1, mb.getName());
				 pstmt.setString(2, mb.getEmail());
				 pstmt.setString(3, mb.getAddress());
				 pstmt.setString(4, mb.getPhone());
				 pstmt.setString(5, mb.getMobile());
				 pstmt.setString(6, mb.getId());
				// 4 실행
				 pstmt.executeUpdate();
			}catch(Exception e){
				e.printStackTrace();
			}finally {
				
			}
		}
		public int dupCheck(String wid) {
			int check=0;
			try {
				//1,2단계
				Connection con=getConnection();
				//3
				String sql="select * from member where id=?";
				PreparedStatement pstmt=con.prepareStatement(sql);
				pstmt.setString(1, wid);
				// 4
				ResultSet rs=pstmt.executeQuery();
				//5
				if(rs.next()) {
						check=1;
					}else {
						check=0;
				}
			} catch (Exception e) {
				e.printStackTrace();
			}finally {
				//마무리
			}
			return check;
				}
}//클래스
