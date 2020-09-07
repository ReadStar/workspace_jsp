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
<h1>WebContent/jsp4_test/updateForm.jsp</h1>
<%
request.setCharacterEncoding("utf-8");
String id = (String)session.getAttribute("id");
if(id==null){
	response.sendRedirect("loginForm.jsp");
}
Class.forName("com.mysql.jdbc.Driver");
String dbUrl="jdbc:mysql://localhost:3306/jspDB1?serverTimezone=UTC";
String dbUser="jspid";
String dbPass="jsppass";
Connection con=DriverManager.getConnection(dbUrl, dbUser, dbPass);
String sql="select *from member where id=? ";
PreparedStatement pstmt=con.prepareStatement(sql);
pstmt.setString(1, id);
ResultSet rs=pstmt.executeQuery();
if(rs.next()){
	String gender=rs.getString("gender");
	if(gender == null){
		gender ="male";
	}
	%>
<form action="updatePro.jsp" method="post">
아이디 : <input type="text" name="id" value="<%=rs.getString("id")%>" readonly><br>
비밀번호 : <input type="text" name="pass"><br>
이름 : <input type="text" name="name" value="<%=rs.getString("name")%>" ><br>
나이 : <input type="text" name = "age"	 value="<%=rs.getString("age") %>" ><br>
성별 : <input type="radio"	 name="gender" value="male" <%if(rs.getString("gender").equals("male")){%>checked<%} %>>male
		 <input type="radio" name="gender" value="female"<%if(rs.getString("gender").equals("female")){%>checked<%} %>>female<br>
이메일 : <input type="text" name="email" value=" <%=rs.getString("email") %>"><br>
<input type="submit" value="회원정보수정">
</form>
<%
}
%>
</body>
</html>