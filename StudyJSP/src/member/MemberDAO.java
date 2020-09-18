package member;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

public class MemberDAO {
	//1,2 디비연결 메서드
	public Connection getConnection() throws Exception {
		//예외처리를 함수 호출하는 곳에서 처리하도록 설정
		Connection con=null;
		Class.forName("com.mysql.jdbc.Driver");
		String dbUrl="jdbc:mysql://localhost:3306/jspDB1?serverTimezone=UTC";
		 String dbUser="jspid";
		 String dbPass="jsppass";
		 con=DriverManager.getConnection(dbUrl, dbUser, dbPass);
		 return con;
	}
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
		//예외발생코드
		//1,2단계 디비연결 메서드 호출
		Connection con =getConnection();
		 String sql="insert into member(id, pass, name, date) values(?,?,?,?)";
		 PreparedStatement pstmt=con.prepareStatement(sql);
		 pstmt.setString(1, mb.getId());
		 pstmt.setString(2, mb.getPass());
		 pstmt.setString(3, mb.getName());
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
			//1,2단계 디비연결 메서드 호출
			Connection con =getConnection();
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
public int userCheck(String id, String pass) {
	int check = -1;
	try {
		 // 1단계 - JDBC프로그램안에 Driver 프로그램 가져오기
		 Class.forName("com.mysql.jdbc.Driver");
		 // 2단계 - DriverManager 자바프로그램이 Driver 프로그램을 가지고 디비서버 접속
		 //        => 접속정보 저장
		 String dbUrl="jdbc:mysql://localhost:3306/jspDB1?serverTimezone=UTC";
		 String dbUser="jspid";
		 String dbPass="jsppass";
		 Connection con=DriverManager.getConnection(dbUrl, dbUser, dbPass);
		 // 3단계 - 접속정보를 이용해서 select sql 구문 만들고 실행할수 있는 자바프로그램 생성
		 //   member테이블에  폼에서 입력한 id가  테이블id열에 해당하는 아이디가 있는지 조회
		 String sql="select * from member where id=?";
		 PreparedStatement pstmt=con.prepareStatement(sql);
		 pstmt.setString(1, id);
		 // 4단계 - sql구문 실행(select) => 결과 저장
		 ResultSet rs=pstmt.executeQuery();
		 // 5단계 - 결과 저장 => 
		 // rs.next() 다음행이동 했을때 데이터가 있으면  true / 데이터가 없으면 false
		 if(rs.next()){
		 	// "폼에서 가져온 비밀번호".equals("디비에서 가져온 비밀번호")
		 	if(pass.equals(rs.getString("pass"))){
		 		check =1;//아이디 비밀번호 일치
		 	}else{
		 		check=0;//비밀번호 틀림
		 	}
		 }else {
			 check= -1; //아이디 틀림
		 }
	}catch (Exception e) {
		e.printStackTrace();
	}finally {
		//마무리
	}
	return check;
}
public void updateMember(MemberBean mb){
	try {
		//1,2단계 디비연결 메서드 호출
		Connection con =getConnection();
		 String sql2="update member set name=? where id=? and pass=?";
		 PreparedStatement pstmt2=con.prepareStatement(sql2);
		 		pstmt2.setString(1, mb.getName());
		 		pstmt2.setString(2, mb.getId());
		 		pstmt2.setString(3, mb.getPass());
		 		pstmt2.executeUpdate();
	}catch (Exception e) {
		e.printStackTrace();
	}finally {
		//마무리
	}
}
public void deleteMember(String id, String pass) {
	try {
		//1,2단계 디비연결 메서드 호출
		Connection con =getConnection();
		String sql="delete from member where id=? and pass=?";
		PreparedStatement pstmt=con.prepareStatement(sql);
		pstmt.setString(1, id);
		pstmt.setNString(2, pass);
		pstmt.executeUpdate();
	}catch (Exception e) {
		e.printStackTrace();
	}finally {
		//마무리
	}
}
}//클래스
