<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<h1>WebContent/jsp4/main.jsp</h1>
<%
String id = (String)session.getAttribute("id");
if(id == null){
	response.sendRedirect("login.jsp");
}
%>
<%=session.getAttribute("id") %>님 로그인 하셨습니다.
<input type="button" value="로그아웃"
		onclick="location.href='logout.jsp'"><br>
<a href="info.jsp">회원정보조회</a>
<a href="updateForm.jsp">회원정보수정</a>
<a href="deleteForm.jsp">회원정보삭제</a>
<a href="list.jsp">회원목록</a>
</body>
</html>