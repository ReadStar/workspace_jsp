<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<h1>WebContent/jsp4/deleteForm.jsp</h1>
<%
request.setCharacterEncoding("utf-8");
//세션값가져오기
String id = (String)session.getAttribute("id");
//세션값 없으면 loginForm으로 이동
if(id==null){
	response.sendRedirect("loginForm.jsp");
}

%>
<form action="deletePro.jsp" method="post">
아이디 : <input type="text" name="id" value= "<%=id %>" readonly><br>
비밀번호 : <input type="text" name="pass"><br>
<input type="submit" value="회원정보삭제">
</form>
</body>
</html>