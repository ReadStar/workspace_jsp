<%@page import="java.sql.ResultSet" %>
<%@page import="com.mysql.cj.x.protobuf.MysqlxCrud.Column"%>
<%@page import="org.eclipse.jdt.internal.compiler.ast.WhileStatement"%>
<%@page import="java.sql.CallableStatement" %>
<%@page import="java.sql.PreparedStatement" %>
<%@page import="java.sql.Statement" %>
<%@page import="java.sql.Connection" %>
<%@page import="java.sql.DriverManager" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<h1>WebContent/jsp3/select.jsp</h1>
<h3>학생목록</h3>
<%
//JDBC 가져오기
request.setCharacterEncoding("utf-8");
Class.forName("com.mysql.jdbc.Driver");
//DB연동
String dbUrl="jdbc:mysql://localhost:3306/jspDB1?serverTimezone=UTC";
String dbUser="root";
String dbPass="63520321";
Connection con=DriverManager.getConnection(dbUrl, dbUser, dbPass);
//sql구문
String sql="select * from student";
PreparedStatement pstmt=con.prepareStatement(sql);
//select 결과저장
ResultSet rs=pstmt.executeQuery();
//결과저장 => 출력
//rs.next()	다음행이동 했을때 데이터가 있으면 true / 데이터가 없으면 false
// while(rs.next()){
	//행이동 데이터가 있으면 true 반복문 안에 명령 실행
	//조건이 참이면 실행문(열 데이터 뽑아오기)
// 	out.println(rs.getInt(1)+","+rs.getString(2)+"<br>");
// 	out.println(rs.getInt("num")+","+rs.getString("name")+"<br>");
// }
%>
<table border="1">
<tr><td>학생번호</td><td>학생이름</td></tr>
<%
while(rs.next()){
	%><tr><td><%=rs.getInt(1) %></td>
			<td><%=rs.getString(2) %></td></tr><%
}
%>

</table>
</body>
</html>