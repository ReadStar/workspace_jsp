<%@page import="fComment.fCommentDAO"%>
<%@page import="fComment.fCommentBean"%>
<%@page import="pComment.pCommentBean"%>
<%@page import="pComment.pCommentDAO"%>
<%@page import="Comment.CommentBean"%>
<%@page import="Comment.CommentDAO"%>
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
<li><a href="notice.jsp">Notice</a></li>
<li><a href="fnotice.jsp">Review</a></li>
<li><a href="pnotice.jsp">Pic</a></li>
</ul>
</nav>
<!-- 왼쪽메뉴 -->
<%
request.setCharacterEncoding("utf-8");
// 파라미터 가져오기  num ,pass
int num=Integer.parseInt(request.getParameter("num"));
int boardnum=Integer.parseInt(request.getParameter("boardnum"));
String name=(String)session.getAttribute("id");
fCommentBean fcb = new fCommentBean();
fcb.setNum(num);
fcb.setName(name);
fCommentDAO fcbdao = new fCommentDAO();
//int check = numcheck(bb) 만들고 호출
int check=fcbdao.numCheck(fcb);
//check ==1 리턴값 없음
if(check==1){
	fcbdao.deleteComment(fcb);
	response.sendRedirect("fcontent.jsp?num="+boardnum);
}else if(check == 0){
	%>
	<script type="text/javascript">
	alert("비밀번호틀림");
	history.back(); //뒤로이동
	</script>
	<%	
}else{
	%>
	<script type="text/javascript">
	alert("id 없음");
	history.back();
	</script>
	<%
}
%>
</body>
<!-- 게시판 -->
<article>
<h1>Notice Write</h1>
<div id="table_search">
<input type="submit" value="search" class="btn">
</div>
<!-- <div class="clear"></div> -->
<!-- <div id="page_control"> -->
<!-- <a href="#">Prev</a> -->
<!-- </div> -->
</article>
<!-- 게시판 -->
<!-- 본문들어가는 곳 -->
<div class="clear"></div>
<!-- 푸터들어가는 곳 -->
<jsp:include page="../inc/bottom.jsp"/>
<!-- 푸터들어가는 곳 -->
</body>
</html>