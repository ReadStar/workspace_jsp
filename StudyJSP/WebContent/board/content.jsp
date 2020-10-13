<%@page import="board.BoardBean"%>
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
<h1>WebContent/board/content.jsp</h1>
<%
//int num 파라미터 값 가져오기
int num=Integer.parseInt(request.getParameter("num"));

//BoardDAO bdao 객체생성
boardDAO bdao = new boardDAO();
//리턴할형 BoardBean bb = getBoard(num) 메서드 만들고 호출
BoardBean bb=bdao.getBoard(num);
	%>
<table border="1">
<tr><td>글번호</td><td><%=bb.getNum() %></td>
    <td>글쓴날짜</td><td><%=bb.getDate() %></td></tr>
<tr><td>작성자</td><td><%=bb.getName() %></td>
    <td>조회수</td><td><%=bb.getReadcount()%></td></tr>
<tr><td>제목</td><td colspan="3"><%=bb.getSubject() %></td></tr>
<tr><td>내용</td><td colspan="3"><%=bb.getContent() %></td></tr>
<tr><td colspan="4">
<input type="button" value="글수정" onclick="location.href='updateForm.jsp?num=<%=bb.getNum()%>'">
<input type="button" value="글삭제" onclick="location.href='deleteForm.jsp?num=<%=bb.getNum()%>'">
<input type="button" value="답글쓰기" onclick ="location.href='reWriteForm.jsp?num=<%=bb.getNum() %>&
re_ref=<%=bb.getRe_ref()%>&re_lev=<%=bb.getRe_lev()%>&re_seq=<%=bb.getRe_seq()%>'">
<input type="button" value="글목록" onclick="location.href='list.jsp'"></td></tr>
</table>	
</body>
</html>
 
 
 
 
 
 