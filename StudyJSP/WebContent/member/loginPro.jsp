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
<h1>WebContent/member/loginPro.jsp</h1>
<%
//id, pass 파라미터 가져오기
String id=request.getParameter("id");
String pass=request.getParameter("pass");
Class.forName("com.mysql.jdbc.Driver");
String dbUrl="jdbc:mysql://localhost:3306/jspDB1?serverTimezone=UTC";
String dbUser="jspid";
String dbPass="jsppass";
Connection con=DriverManager.getConnection(dbUrl, dbUser, dbPass);
String sql="select *from member where id=? && pass = ?";
PreparedStatement pstmt=con.prepareStatement(sql);
pstmt.setString(1, id);
pstmt.setString(2, pass);
ResultSet rs=pstmt.executeQuery();
if(rs.next()==true){
	out.println("아이디 있음");
	if(pass.equals(rs.getString("pass"))){
		out.println("비밀번호 맞음");
		//세션값 부여(생성) : 페이지 상관없이 값을 유지 이름 , 값 "id",id
		%><script type="text/javascript">
	alert("로그인성공");
	</script><%
		session.setAttribute("id", id);
		response.sendRedirect("main.jsp");
	}else{
		out.println("비밀번호 틀림");
		%>
		<script type="text/javascript">
		alert("비밀번호틀림");
		history.back(); //뒤로이동
		</script>		<%
	}
}else{
	out.println("아이디 없음");
	%>
	<script type="text/javascript">
		alert("아이디틀림");
		history.back();
	</script>
	<%
}
%>
</body>
</html>