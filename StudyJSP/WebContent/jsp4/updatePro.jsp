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
<h1>WebContent/jsp4/updatePro.jsp</h1>
<%
request.setCharacterEncoding("utf-8");
String id = (String)session.getAttribute("id");
String pass = (String)request.getParameter("pass");
String name = (String)request.getParameter("name");
Class.forName("com.mysql.jdbc.Driver");
String dbUrl="jdbc:mysql://localhost:3306/jspDB1?serverTimezone=UTC";
String dbUser="jspid";
String dbPass="jsppass";
Connection con=DriverManager.getConnection(dbUrl, dbUser, dbPass);

String sql="select *from member where id=?";

PreparedStatement pstmt=con.prepareStatement(sql);
pstmt.setString(1, id);
ResultSet rs=pstmt.executeQuery();
if(rs.next()){
	out.println("아이디 맞음");
	if(pass.equals(rs.getString("pass"))){
		out.println("비밀번호 맞음");
		sql ="update member set  name=? where id=?";
		pstmt =con.prepareStatement(sql);
		pstmt.setString(1, name);
		pstmt.setString(2, id);
		pstmt.executeUpdate();
		%>
		<script type="text/javascript">
		alert("정보 수정 완료");
		</script>
 <% response.sendRedirect("main.jsp");
	}else{
		out.println("비밀번호 틀림");
		%>
		<script type="text/javascript">
		alert("비밀번호틀림");
		history.back(); //뒤로이동
		</script>
		<%	
	}
}else{
		out.println("아이디 없음");
		%>
		<script type="text/javascript">
		alert("아이디 틀림");
		history.back();
		</script>
		<%
	}
%>
</body>
</html>