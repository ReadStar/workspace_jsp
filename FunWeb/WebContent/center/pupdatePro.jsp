<%@page import="PicBoard.pBoardBean"%>
<%@page import="PicBoard.pBoardDAO"%>
<%@page import="FileBoard.fBoardDAO"%>
<%@page import="FileBoard.fBoardBean"%>
<%@page import="com.oreilly.servlet.multipart.DefaultFileRenamePolicy"%>
<%@page import="com.oreilly.servlet.MultipartRequest"%>
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
<!-- 왼쪽메뉴 -->
 <%
//  request.setCharacterEncoding("utf-8");
 String uploadPath=request.getRealPath("/upload");
 System.out.println(uploadPath);
 //파일크기 10M
 int maxSize=10*1024*1024;
 MultipartRequest multi = 
		 new MultipartRequest(request,uploadPath,maxSize,"utf-8",new DefaultFileRenamePolicy());
 
//파라미터 가져오기
int num = Integer.parseInt(multi.getParameter("num"));
String name = multi.getParameter("name");
String subject = multi.getParameter("subject");
String content = multi.getParameter("content");
//새롭게 추가할 file 
String file=multi.getFilesystemName("file");
//기존 file 이름
if(file==null){
	file=multi.getParameter("oldfile");
}
//BoardBean bb 객체생성
pBoardBean pbb = new pBoardBean();

//bb 멤버변수 파라미터 저장
pbb.setNum(num);
pbb.setName(name);
pbb.setSubject(subject);
pbb.setContent(content);
pbb.setFile(file);
//DAO 객체 생성
pBoardDAO pbdao = new pBoardDAO();
//int check = numcheck(bb) 만들고 호출
int check=pbdao.numCheck(pbb);	
pbdao.updateBoard(pbb);
	response.sendRedirect("pnotice.jsp");
%>

<!-- 게시판 -->
<!-- <article> -->
<!-- <h1>Notice Write</h1> -->


<!-- <div id="table_search"> -->
<!-- <input type="submit" value="search" class="btn"> -->
<!-- </div> -->
<!-- <div class="clear"></div> -->
<!-- <div id="page_control"> -->
<!-- </div> -->
<!-- </article> -->
<!-- 게시판 -->
<!-- 본문들어가는 곳 -->
<div class="clear"></div>
<!-- 푸터들어가는 곳 -->
<jsp:include page="../inc/bottom.jsp"/>
<!-- 푸터들어가는 곳 -->
</div>
</body>
</html>