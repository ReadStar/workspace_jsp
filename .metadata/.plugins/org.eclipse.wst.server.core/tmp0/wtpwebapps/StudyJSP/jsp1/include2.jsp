<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<h1>WebContent/jsp1/include2.jsp</h1>
<table border="1" width="600" height="600">
<table border="1" width="600" height="600">
<tr><td colspan="2" width="600" height="100"> <jsp:include page="includeTop.jsp"/></td></tr>
<tr><td width="100" heigt="400"><jsp:include page="includeLeft.jsp"/></td></tr>
				<td>본문2</td>
<tr><td colspan="2" width="600" height="100"><jsp:include page="includeBottom.jsp"/></td></tr>
</table>
</body>
</html>