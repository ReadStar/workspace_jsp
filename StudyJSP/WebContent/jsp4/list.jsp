<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.sql.DriverManager"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<h1>WebContent/jsp4/list.jsp</h1>
<%
request.setCharacterEncoding("utf-8");
String id = (String)session.getAttribute("id");
Class.forName("com.mysql.jdbc.Driver");
String dbUrl="jdbc:mysql://localhost:3306/jspDB1?serverTimezone=UTC";
String dbUser="jspid";
String dbPass="jsppass";
Connection con=DriverManager.getConnection(dbUrl, dbUser, dbPass);
String sql="select *from member where id=? and pass=? and name=?? and date";

PreparedStatement pstmt=con.prepareStatement(sql);
pstmt.setString(1, id);
ResultSet rs=pstmt.execZ¸uteQuery();
%>

<table border="1">
<tr><td>아이디</td><td>비밀번호</td><td>이름</td><td>가입일</td></tr>
<%
while(rs.next()){
%>
<tr><td><%=rs.getString("id") %></td><td><%=rs.getString("pass") %></td>
		<td><%=rs.getString("name") %></td><td><%rs.getTimestamp("date");%></td></tr>
<%
}
	%>
</table>
</body>
</html>