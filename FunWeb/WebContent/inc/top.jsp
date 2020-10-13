<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<header>
<%
String id=(String)session.getAttribute("id");
if(id==null){
	%>
<div id="login"><a href="../member/login.jsp">login</a> | <a href="../member/join.jsp">join</a></div>
<%
}else{
	%>
	<div id="login"><%=id %>님 | <a href="../member/logout.jsp">logout</a> | 
	<a href="../member/updateForm.jsp">MyPage</a></div>
	<%
}
%>

<div class="clear"></div>
<!-- 로고들어가는 곳 -->
<div id="logo"><a href="../main/main.jsp"><img src="../images/LogoMakr_57ym8Y.png" width="265" height="62" alt="Fun Web"></a></div>
<!-- 로고들어가는 곳 -->
<nav id="top_menu">
<ul>
	<li><a href="../main/main.jsp">Home</a></li>
	<li><a href="../company/welcome.jsp">Intro</a></li>
	<li><a href="../center/notice.jsp">Board</a></li>
</ul>
</nav>
</header>