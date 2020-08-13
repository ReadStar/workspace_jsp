<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<h1>WebContent/jsp1/scopePro.jsp</h1>
<%
//request에 저장된 id파라미터 가져오기 변수 저장
String id = request.getParameter("id");
String pass = request.getParameter("pass");
//내장객체생성하고 page Context request session application
//영역(내장객체 유지영역) 		내장(영역)객체				유효범위
//page										pageContext				해당페이지만 정보유지
//request									request						클라이언트에서 요청정보받았으면 정보유지
//session									session						접속정보유지(페이지 상관 없이 접속만 되어 있으면 유지)
//application 							application					웹애플리케이션이 실행(서버 start)되는 동안 유지

//내장객체 값 저장 내장객체.setAttribute(이름, 값)
// 			  가져오기 내장객체.getAttribute(이름)
//			  하나삭제 내장객체.removeAttribute(이름)
pageContext.setAttribute("page", "pageContext Value");
request.setAttribute("req","request Value");
session.setAttribute("ses", "session Value");
application.setAttribute("app", "application Value");
%>
아이디 : <%="id" %><br>
비밀번호 : <%="pass" %><br>
pageContext 값 : <%=pageContext.getAttribute("page") %><br>
request 값 : <%=request.getAttribute("req") %><br>
session 값 : <%=session.getAttribute("ses") %><br>
application 값 : <%=application.getAttribute("app") %><br>
<a href="scopeProPro.jsp?id=<%=id%>&pass=<%=pass%>">scopeProPro.jsp 이동</a>
<%-- <a href="scopeProPro.jsp?pass=<%=pass%>">scopeProPro.jsp이동</a> --%>
<script type = "text/javascript">
// 	alert("scopeProPro.jsp로 이동");
<%-- 	location.href = "scopeProPro.jsp?id=<%=id%>&pass=<%=pass%>" --%>
</script>
<%
//  		response.sendRedirect("scopeProPro.jsp?id="+id+"&pass="+pass);  //<<- jsp
%>
<%
//액션태그 : jsp문법, jsp명령을 태그처럼 사용할 수 있게 만든 문법
//					forward, include, useBean, setAttribute
//foward 액션태그 : 현페이지 request모든 정보를 들고 다음 페이지로 이동
//							 : 주소줄에서는 현 페이지주소 화면에는 다음페이지 실행화면이 보임
%>
<%-- <jsp:forward page="scopeProPro.jsp"/> --%>
</body>
</html>