<%@page import="board.BoardBean"%>
<%@page import="java.util.List"%>
<%@page import="board.boardDAO"%>
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
boardDAO bdao = new boardDAO();

List boardList = bdao.getBoardList();


%>
<table border="1">
<tr><td>번호</td><td>제목</td><td>작성자</td><td>날짜</td><td>조회수</td>
<%
for(int i = 0 ; i < boardList.size() ; i++){
	//배열 한칸에서 게시판 글 하나 가져오기
	BoardBean bb = (BoardBean)boardList.get(i);

%>
			<tr><td><%=bb.getNum() %></td>
			 <td><a href="content.jsp?num=<%=bb.getNum() %>"><%=bb.getSubject() %></a></td>
			 <td><%=bb.getName() %></td><td><%=bb.getDate() %></td>
			 <td><%=bb.getReadcount() %></td>
<%
}
%>
</table>
</body>
</html>