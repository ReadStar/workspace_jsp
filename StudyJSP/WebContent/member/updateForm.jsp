<%@page import="member.MemberBean"%>
<%@page import="member.MemberDAO"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<h1>WebContent/member/updateForm.jsp</h1>
<%
request.setCharacterEncoding("utf-8");
//세션값가져오기
String id = (String)session.getAttribute("id");
//세션값 없으면 loginForm으로 이동
if(id==null){
	response.sendRedirect("loginForm.jsp");
}
//MemberDAO mdao 객체 생성
MemberDAO mdao =new MemberDAO();
//Member bb= getMember(id) 메서드 호출
MemberBean bb = mdao.getMember(id);


// // JDBC Driver 가져오기
// Class.forName("com.mysql.jdbc.Driver");
// // DriverManager 가지고 DB접속
// String dbUrl="jdbc:mysql://localhost:3306/jspDB1?serverTimezone=UTC";
// String dbUser="jspid";
// String dbPass="jsppass";
// Connection con=DriverManager.getConnection(dbUrl, dbUser, dbPass);
// //sql구문 만들기
// String sql="select *from member where id=? ";
// PreparedStatement pstmt=con.prepareStatement(sql);
// pstmt.setString(1, id);
// //sql구문 실행 => 결과 저장
// ResultSet rs=pstmt.executeQuery();
// // 결과저장 => 출력
// // rs.next()이동 했을때 데이터가 있으면 True / 데이터가 없으면 false
// if(rs.next()){
	%>
<form action="updatePro.jsp" method="post">
아이디 : <input type="text" name="id" value="<%=bb.getId()%>" readonly><br>
비밀번호 : <input type="text" name="pass"><br>
이름 : <input type="text" name="name" value="<%=bb.getName()%>" ><br>
<input type="submit" value="회원정보수정">
</form>
</body>
</html>