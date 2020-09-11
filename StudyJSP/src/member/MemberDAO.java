package member;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

public class MemberDAO {
public void insertMember(MemberBean mb) {
	System.out.println("BeanDB insert()");
	System.out.println("받은 주소:" + mb );
	System.out.println("주소를 찾아서 Name값 가져옴" + mb.getName());
	System.out.println("주소를 찾아서 Id값 가져옴" + mb.getId());
	System.out.println("주소를 찾아서 pass값 가져옴" + mb.getPass());
	System.out.println("주소를 찾아서 pass값 가져옴" + mb.getDate());
	
	//예외처리 : 예기치 않게 에러발생을 처리할수 있게 만든 코드
//	int a=10;
//	int b=0;
	//수동예외처리
//	if(b!=0) {
//		System.out.println(a/b);
//	}else {
//		System.out.println("b가 0임");
//	}
	//자동예외처리
//	try {System.out.println(a/b);
//		//예외발행코드
//	}catch(Exception e) {
//		//예외발생처리코드
//		System.out.println("b가 0임");
//	}finally {
//		//예외상관없이 처리되는코드
//		System.out.println("예외상관없이 처리");
//	}
//	System.out.println("프로그램 끝");

	try {
		Class.forName("com.mysql.jdbc.Driver");
		String dbUrl="jdbc:mysql://localhost:3306/jspDB1?serverTimezone=UTC";
		 String dbUser="jspid";
		 String dbPass="jsppass";
		 Connection con=DriverManager.getConnection(dbUrl, dbUser, dbPass);
		 String sql="insert into member(id, pass, name, date) values(?,?,?,?)";
		 PreparedStatement pstmt=con.prepareStatement(sql);
		 pstmt.setString(1, mb.getId());
		 pstmt.setString(2, mb.getPass());
		 pstmt.setString(3, mb.getPass());
		 pstmt.setTimestamp(4, mb.getDate());
		 pstmt.executeUpdate();
	}catch(Exception e) {
		//예외처리
		e.printStackTrace();
	}finally {
		//예외상관없이 처리됨
	}
//	 //JDBC프로그램 설치
//	 //1단계 JDBC안에 Driver 프로그램 가져오기
//	 Class.forName("com.mysql.jdbc.Driver");
//	 //2단계 DriverManager 자바 프로그램이 Driver 프로그램을 가지고 디비서버 접속=>접속정보저장
//	 String dbUrl="jdbc:mysql://localhost:3306/jspDB1?serverTimezone=UTC";
//	 String dbUser="jspid";
//	 String dbPass="jsppass";
//	 Connection con=DriverManager.getConnection(dbUrl, dbUser, dbPass);
//	 //3단계 접속정보를 이용해서 insert sql 구문 만들고 실행할수있는 자바프로그램 생성
//	 String sql="insert into member(id, pass, name, date) values(?,?,?,?)";
//	 PreparedStatement pstmt=con.prepareStatement(sql);
//	 pstmt.setString(1, mb.getId());
//	 pstmt.setString(2, mb.getPass());
//	 pstmt.setString(3, mb.getPass());
//	 pstmt.setTimestamp(4, mb.getDate());
//	 //4단계 sql실행
//	 pstmt.executeUpdate();
}//메서드
public MemberBean getMember(String id) {
		MemberBean mb=null; //참조형 초기값
		try {
			 Class.forName("com.mysql.jdbc.Driver");
			 //DB연동
			 String dbUrl="jdbc:mysql://localhost:3306/jspDB1?serverTimezone=UTC";
			 String dbUser="jspid";
			 String dbPass="jsppass";
			 Connection con=DriverManager.getConnection(dbUrl, dbUser, dbPass);
			 //sql 구문
			 String sql="select *from member where id=?";
			 PreparedStatement pstmt=con.prepareStatement(sql);
			 pstmt.setString(1, id);
			 ResultSet rs=pstmt.executeQuery();
			 if(rs.next()){
				 // mb=객체생성(기억장소 할당)
				 mb = new MemberBean();
				 //mb set메서드 호출 rs.get() 저장
				 //디비에서 가져온 값 rs.getString("id") => mb id 변수 저장
				 mb.setId(rs.getNString("id"));
				 mb.setPass(rs.getString("pass"));
				 mb.setName(rs.getNString("name"));
				 mb.setDate(rs.getTimestamp("date"));
			 }
		}catch (Exception e) {
			e.printStackTrace();
		}finally {
			
		}
	return mb;

	}
}//클래스
