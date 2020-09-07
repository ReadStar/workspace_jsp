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
<h1>WebContent/jsp5/list.jsp</h1>
<%
//int num 파라미터 값 가져오기
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
ResultSet rs = pstmt.executeQuery();
if(rs.next()){
	%>
	
<table border="1">
<tr><td>글번호</td><td><%=rs.getInt("num") %></td><td></td><td>작성일자<%=rs.getTimestamp("date") %></td><td></td></tr>
<tr><td>작성자</td><td><%=rs.getString("name") %></td><td></td><td>조회수<%=rs.getInt("readcount") %></td><td></td></tr>
<tr><td>제목</td><td><%=rs.getString("subject") %></td><td colspan="3"></td></tr>
<tr><td>내용</td><td><%=rs.getString("content") %></td><td colspan="3"></td></tr>
<tr><td colspan="4">
<input type="button" value="글목록" onclick="location.href='list.jsp'">
<input type="button" value="글수정" onclick="location.href='updateForm.jsp?num=<%=rs.getInt("num")%>'">
<input type="button" value="글삭제" onclick="location,href='deleteForm.jsp?num=<%=rs.getInt("num")%>'"></td></tr>
</table>
<%
}
%>
</body>
</html>