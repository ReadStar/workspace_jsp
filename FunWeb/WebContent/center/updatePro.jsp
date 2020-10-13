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
<!-- 헤더들어가는 곳 -->
 
<!-- 본문들어가는 곳 -->
<!-- 메인이미지 -->
<!-- 메인이미지 -->
 
<!-- 왼쪽메뉴 -->
<!-- 왼쪽메뉴 -->
 <%
 request.setCharacterEncoding("utf-8");
 
//파라미터 가져오기
int num = Integer.parseInt(request.getParameter("num"));
String name = request.getParameter("name");
String subject = request.getParameter("subject");
String content = request.getParameter("content");
//BoardBean bb 객체생성
BoardBean bb = new BoardBean();

//bb 멤버변수 파라미터 저장
bb.setNum(num);
bb.setName(name);
bb.setSubject(subject);
bb.setContent(content);
//DAO 객체 생성
BoardDAO bdao = new BoardDAO();
//int check = numcheck(bb) 만들고 호출
//check ==1 리턴값 없음
	bdao.updateBoard(bb);
	response.sendRedirect("notice.jsp");
	%>

<!-- 게시판 -->
</body>
</html>