<%@page import="member.MemberDAO"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<h1>WebContent/member/loginPro.jsp</h1>
<%
// id, pass 폼에서 파라미터 가져와서 변수 저장
String id=request.getParameter("id");
String pass=request.getParameter("pass");
// MemberDAO mdao 객체생성
MemberDAO mdao = new MemberDAO();
// int check = userCheck(id,pass) 메서드 만들고 호출

// check==1  아이디비밀번호 일치  신호 1받아서  세션값 생성  main.jsp이동
// check==0  아이디일치비밀번호틀림 신호0받아서  "비밀번호 틀림" 뒤로이동 
// 나머지 check==-1  아이디틀림  신호-1받아서  "아이디없음" 뒤로이동
 
 
// // JDBC 프로그램 설치
// // 1단계 - JDBC프로그램안에 Driver 프로그램 가져오기
// Class.forName("com.mysql.jdbc.Driver");
// // 2단계 - DriverManager 자바프로그램이 Driver 프로그램을 가지고 디비서버 접속
// //        => 접속정보 저장
// String dbUrl="jdbc:mysql://localhost:3306/jspdb1";
// String dbUser="jspid";
// String dbPass="jsppass";
// Connection con=DriverManager.getConnection(dbUrl, dbUser, dbPass);
// // 3단계 - 접속정보를 이용해서 select sql 구문 만들고 실행할수 있는 자바프로그램 생성
// //   member테이블에  폼에서 입력한 id가  테이블id열에 해당하는 아이디가 있는지 조회
// String sql="select * from member where id=?";
// PreparedStatement pstmt=con.prepareStatement(sql);
// pstmt.setString(1, id);
// // 4단계 - sql구문 실행(select) => 결과 저장
// ResultSet rs=pstmt.executeQuery();
// // 5단계 - 결과 저장 => 
// // rs.next() 다음행이동 했을때 데이터가 있으면  true / 데이터가 없으면 false
// if(rs.next()){
// 	out.println("아이디 있음");
// 	// "폼에서 가져온 비밀번호".equals("디비에서 가져온 비밀번호")
// 	if(pass.equals(rs.getString("pass"))){
// 		out.println("비밀번호 맞음");
// 		// 세션값 부여(생성) : 페이지 상관없이 값을 유지  이름,값  "id",id
// 		session.setAttribute("id", id);
// 		// main.jsp 이동
// 		response.sendRedirect("main.jsp");
// 	}else{
// 		out.println("비밀번호 틀림");
		%>
		<script type="text/javascript">
			alert("비밀번호 틀림");
			history.back(); // 뒤로이동 
		</script>
		<%
// 	}
// }else{
// 	out.println("아이디 없음");
	%>
		<script type="text/javascript">
			alert("아이디 없음");
			history.back(); // 뒤로이동 
		</script>
	<%
// }
%>
</body>
</html>
 
 
 
 
 
 
 