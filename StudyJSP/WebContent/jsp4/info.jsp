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
<h1>WebContent/jsp4/info.jsp</h1>
<h2>나의 정보 조회</h2>
<%
//로그인한 사용자 
String id ="test";
request.setCharacterEncoding("utf-8");
//드라이버 정보 가져오기
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
		%>
		아이디 : <%=rs.getString("id") %><br>
		비밀번호 : <%=rs.getString("pass") %><br>
		이름 : <%=rs.getString("name") %><br>
		가입날짜 : <%=rs.getTimestamp("date") %><br>
		<%
}
%>
</body>
</html>