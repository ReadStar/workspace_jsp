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
<h1>WebContent/member/deletePro.jsp</h1>
<% 
request.setCharacterEncoding("utf-8");
String id = (String)session.getAttribute("id");
String pass = (String)request.getParameter("pass");
//MemberDAO 객체 생성
MemberDAO mdao= new MemberDAO();
//int check = userCheck(id, pass)
int check = mdao.userCheck(id, pass);
//check ==1 deleteMember(id, pass) 메서드 호출 세션값 전체 삭제 main.jsp
if(check==1){
	mdao.deleteMember(id, pass);
	session.invalidate();
	response.sendRedirect("main.jsp");
}else if(check == 0){
	%><script type="text/javascript">
	alert("비밀번호틀림");
	history.back(); //뒤로이동
	</script><%
}else{
	%>		<script type="text/javascript">
	alert("아이디 틀림");
	history.back();
	</script>
	<%
}


// Class.forName("com.mysql.jdbc.Driver");
// String dbUrl="jdbc:mysql://localhost:3306/jspDB1?serverTimezone=UTC";
// String dbUser="jspid";
// String dbPass="jsppass";
// Connection con=DriverManager.getConnection(dbUrl, dbUser, dbPass);
// String sql="delete from member where id=? and pass=?";
// PreparedStatement pstmt=con.prepareStatement(sql);
// pstmt.setString(1, id);
// pstmt.setString(2, pass);
// pstmt.executeUpdate();
//세션값 초기화(전체삭제)


		

%>
</body>
</html>