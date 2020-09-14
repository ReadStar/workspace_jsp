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
<h1>WebContent/board/list.jsp</h1>
<%
Class.forName("com.mysql.jdbc.Driver");
String dbUrl="jdbc:mysql://localhost:3306/jspDB1?serverTimezone=UTC";
String dbUser="jspid";
String dbPass="jsppass";
Connection con=DriverManager.getConnection(dbUrl, dbUser, dbPass);
//구문저장 num기준 내림차순
String sql="select * from board order by num desc";
PreparedStatement pstmt=con.prepareStatement(sql);
ResultSet rs=pstmt.executeQuery();

%>
<table border="1">
<tr><td>번호</td><td>제목</td><td>작성자</td><td>날짜</td><td>조회수</td>
<%
while(rs.next()){
		%><tr><td><%=rs.getInt("num") %></td>
			 <td><a href="content.jsp?num=<%=rs.getString("num") %>"><%=rs.getString("subject") %></a></td>
			 <td><%=rs.getString("name") %></td><td><%=rs.getTimestamp("date") %></td>
			 <td><%=rs.getInt("readcount") %></td><%
		
}
%>

</table>
</body>
</html>