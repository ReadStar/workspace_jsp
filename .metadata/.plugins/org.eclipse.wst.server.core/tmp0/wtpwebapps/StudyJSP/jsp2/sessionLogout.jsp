<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<h1>WebContent/jsp2/sessionLogout.jsp</h1>
<%
//세션값 전체삭제(초기화)
session.invalidate();
//"로그아웃" "sessionLoginMain.jsp"
%><script type="text/javascript">
		alert("로그아웃");
		location.href="sessionLoginMain.jsp";
</script>
</body>
</html>