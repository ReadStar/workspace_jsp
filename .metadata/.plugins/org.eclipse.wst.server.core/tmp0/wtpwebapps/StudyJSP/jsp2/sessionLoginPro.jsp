<%@page import="javax.xml.ws.Response"%>
<%@page import="org.apache.jasper.tagplugins.jstl.core.If"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<h1>WebContent/jsp2/sessionLoginPro.jsp</h1>
<%
//id, pass 파라미터 가져와서 변수에 저장
String id=request.getParameter("id");
String pass=request.getParameter("pass");
%>
폼에서 가져온 아이디 : <%=id%><br>
폼에서 가져온 비밀번호 : <%=pass%><br>
<%
//데이터베이스에 저장된 id, pass
String dbId="admin";
String dbPass="p123";
%>
데이터베이스에서 가져온 아이디 : <%=dbId %><br>
데이터베이스에서 가져온 비밀번호 : <%=dbPass %><br>
<%
//폼에서 가져온 아이디, 디비에서 가져온 아이디 비교
//문자비교 문자열.equals(문자)
//폼아이디.equals(디비아이디)
if(id.equals(dbId)){
	//아이디일치
	out.print("아이디일치");
	if(pass.equals(dbPass)){
		out.print("비밀번호 일치");
		//세션값 이름, 값 "id",id로그인정보유지
		session.setAttribute("id", id);
		//sessionLoginMain.jsp이동
		response.sendRedirect("sessionLoginMain.jsp");
		%>
		<script type="text/javascript">
			alert("로그인성공");
			location.href="sessionLoginMain.jsp";
		</script>
		<%
	}else{
		out.print("비밀번호 틀림");
}
}else{
	//아이디틀림
	out.print("아이디 틀림");
}


%>
</body>
</html>