<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<h1>WebContent/jsp1.testPro3.jsp</h1>
<%
request.setCharacterEncoding("utf-8");
String sname = request.getParameter("name");
String sgender = request.getParameter("gender");
// String shobby = request.getParameter("hobby");
String[] hobby=request.getParameterValues("hobby");
if(hobby==null){
	out.println("취미선택 안함");
}else{
	out.println("배열의 크기:"+hobby.length);
}
%>
<br>이름 : <%= sname %> <br>
성별 : <%= sgender %> <br>
취미 : <%= hobby %> <br>
<%
if(hobby!=null){
	for(int i=0; i<hobby.length; i++){
		%><%=hobby[i] %><%
// 		out.println(hobby[i]);
	}
}

%>
</body>
</html>