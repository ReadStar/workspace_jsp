<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<h1>WebContent/jsp2/sessionSet.jsp</h1>
<%
//세션값 하나 생성
//session.setAttribute("이름", 모든형적용 값);
session.setAttribute("ses1", "session value1");
session.setAttribute("ses2", "session value2");
%>
<script type="text/javascript">
	alert("세션값 생성");
	location.href="sessionForm.jsp";

</script>
</body>
</html>