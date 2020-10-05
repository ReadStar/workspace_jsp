<%@page import="member.MemberBean"%>
<%@page import="java.util.List"%>
<%@page import="member.MemberDAO"%>
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
MemberDAO mdao = new MemberDAO();

List memberList = mdao.getMemberList();
%>
<table border="1">
<tr><td>아이디</td><td>비밀번호</td><td>이름</td><td>가입일자</td></tr>
<%
for(int i = 0 ; i < memberList.size() ; i++){
	//배열 한칸에서 게시판 글 하나 가져오기
	MemberBean mb = (MemberBean)memberList.get(i);

%>
<tr><td><%=mb.getId() %></td>
<td><%=mb.getPass() %></td>
<td><%=mb.getName() %></td>
<td><%=mb.getDate() %></td></tr>
<%
}
	%>
</table>
</body>
</html>