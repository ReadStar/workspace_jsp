<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<h1>WebContent/jsp2/sessionForm.jsp</h1>
세션값1:<%=session.getAttribute("ses1") %><br>
세션값2:<%=session.getAttribute("ses2") %><br>
<input type="button" value="세션값설정" onclick="location.href='sessionSet.jsp'">
<input type="button" value="세션값하나삭제" onclick="location.href='sessionDel.jsp'">
<input type="button" value="세션값전체삭제" onclick="location.href='sessionInval.jsp'">
</body>
</html>