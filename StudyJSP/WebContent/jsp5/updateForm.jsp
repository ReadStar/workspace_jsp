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
<h1>WebContent/jsp5/updateForm.jsp</h1>
<%
request.setCharacterEncoding("utf-8");
int num = Integer.parseInt(request.getParameter("num"));

Class.forName("com.mysql.jdbc.Driver");
String dbUrl="jdbc:mysql://localhost:3306/jspDB1?serverTimezone=UTC";
String dbUser="jspid";
String dbPass="jsppass";
Connection con=DriverManager.getConnection(dbUrl, dbUser, dbPass);
String sql="select * from board where num = ?";
PreparedStatement pstmt=con.prepareStatement(sql);
pstmt.setInt(1, num);
ResultSet rs=pstmt.executeQuery();
if(rs.next()){
	if(pass.equals(rs.getString("pass"))){
		out.println("비밀번호 맞음");
		sql ="select * from board name=?, subject = ?, content = ?";
		pstmt =con.prepareStatement(sql);
		pstmt.setString(1, name);
		pstmt.setInt(2, subject);
		pstmt.setString(3, content);
		pstmt.executeUpdate();
		%>

%>

<form action="updatePro.jsp" method="post">
<input type="hidden" name="num" value="<%=num %>">
<table border="1">
<tr><td>글쓴이</td><td><input type="text" name="name" value="<%= %>"></td></tr>
<tr><td>비밀번호</td><td><input type="password" name="pass"></td></tr>
<tr><td>제목</td><td><input type="text" name="subject" value="<%= %>"></td></tr>
<tr><td>글내용</td>
<td><textarea name="content" rows="10" cols="20"><%= %></textarea></td></tr>
<tr><td colspan="2"><input type="submit" value="글수정"></td></tr>
</table>
</form>
</body>
</html>