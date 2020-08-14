<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<h1>WebContent/jsp2/sessionDel.jsp</h1>
<%
session.removeAttribute("ses1");
%>
<script type="text/javascript">
	alert("세션값하나삭제")
	location.href="sessionForm.jsp"
</script>
</body>
</html>