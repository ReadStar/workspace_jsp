<%@page import="Board.BoardBean"%>
<%@page import="Board.BoardDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link href="../css/default.css" rel="stylesheet" type="text/css">
<link href="../css/subpage.css" rel="stylesheet" type="text/css">
<!--[if lt IE 9]>
<script src="http://ie7-js.googlecode.com/svn/version/2.1(beta4)/IE9.js" type="text/javascript"></script>
<script src="http://ie7-js.googlecode.com/svn/version/2.1(beta4)/ie7-squish.js" type="text/javascript"></script>
<script src="http://html5shim.googlecode.com/svn/trunk/html5.js" type="text/javascript"></script>
<![endif]-->
<!--[if IE 6]>
 <script src="../script/DD_belatedPNG_0.0.8a.js"></script>
 <script>
   /* EXAMPLE */
   DD_belatedPNG.fix('#wrap');
   DD_belatedPNG.fix('#main_img');   
 
 </script>
 <![endif]-->
</head>
<body>
<div id="wrap">
<!-- 헤더들어가는 곳 -->
<jsp:include page="../inc/top.jsp"/>
<!-- 헤더들어가는 곳 -->
 
<!-- 본문들어가는 곳 -->
<!-- 메인이미지 -->
<div id="sub_img_center"></div>
<!-- 메인이미지 -->
 
<!-- 왼쪽메뉴 -->
<nav id="sub_menu">
<ul>
<li><a href="fnotice.jsp">Notice</a></li>
<li><a href="#">Public News</a></li>
<li><a href="#">Driver Download</a></li>
<li><a href="#">Service Policy</a></li>
</ul>
</nav>
<!-- 왼쪽메뉴 -->
 <%
 request.setCharacterEncoding("utf-8");
int num = Integer.parseInt(request.getParameter("num"));
BoardDAO bdao=new BoardDAO();
BoardBean bb=bdao.getBoard(num);
%>

<!-- 게시판 -->
<article>
<h1>reWrite</h1>

<form action="fupdatePro.jsp" method="post" enctype="multipart/form-data">
<input type="hidden" name="num" value="<%=num %>">
<table id="notice">
<tr><td>글쓴이</td><td><input type="text" name="name" value="<%=bb.getName() %>"></td></tr>
<tr><td>비밀번호</td><td><input type="password" name="pass"></td></tr>
<tr><td>제목</td><td><input type="text" name="subject" value="<%=bb.getSubject()%>"></td></tr>
<tr><td>파일</td><td><input type="file" name="file"><input type="hidden" name="oldfile" value="<%=bb.getFile()%>">
<%=bb.getFile() %></td></tr>
<tr><td>내용</td>
	<td><textarea name="content" rows="10" cols="20"><%=bb.getContent() %></textarea></td></tr>
	<tr><td colspan="2"><input type="submit" value="글수정" class="btn"></td></tr>    
</table>
<div id="table_search">
<input type="submit" value="search" class="btn">
</div>
</form>
<div class="clear"></div>
<div id="page_control">
<a href="#">Prev</a>
</div>
</article>
<!-- 게시판 -->
<!-- 본문들어가는 곳 -->
<div class="clear"></div>
<!-- 푸터들어가는 곳 -->
<jsp:include page="../inc/bottom.jsp"/>
<!-- 푸터들어가는 곳 -->
</div>
</body>
</html>