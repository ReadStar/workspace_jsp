<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ include file="includeFile.jspf" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body bgcolor="<%=color1%>">
<h1>WebContent/jsp1/include1.jsp</h1>
<table border="1" width="600" height="600" bgcolor="<%=color2%>">
<tr><td colspan="2" width="600" height="100">
<jsp:include page="includeTop.jsp"><jsp:param value="kim" name="id"/>
</jsp:include></td>
<tr><td width="100" heigt="400"><jsp:include page="includeLeft.jsp"/></td></tr>
				<td>본문1</td>
<tr><td colspan="2" width="600" height="100"><jsp:include page="includeBottom.jsp"/></td></tr>
</table>
</body>
</html>