<%@page import="java.text.SimpleDateFormat"%>
<%@page import="Board.BoardBean"%>
<%@page import="Board.BoardDAO"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
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
<li><a href="notice.jsp">Notice</a></li>
<li><a href="fnotice.jsp">ReView</a></li>
<li><a href="#">Pic</a></li>
</ul>
</nav>
<!-- 왼쪽메뉴 -->
 
<!-- 게시판 -->
<article>
<h1>Notice</h1>
<table id="notice">
<!-- <tr><th class="tno">번호</th> -->
<!--     <th class="ttitle">제목</th> -->
<!--     <th class="twrite">작성자</th> -->
<!--     <th class="tdate">게시일</th> -->
<!--     <th class="tread">조회수</th></tr> -->
<%
request.setCharacterEncoding("utf-8");
//int num 파라미터 값 가져오기
int num=Integer.parseInt(request.getParameter("num"));
SimpleDateFormat sdf=new SimpleDateFormat("yy.MM.dd");
//BoardDAO bdao 객체생성
BoardDAO bdao = new BoardDAO();
//조회수 증가 메서드 만들고 호출
bdao.updateReadcount(num);
//리턴할형 BoardBean bb = getBoard(num) 메서드 만들고 호출
BoardBean bb=bdao.getBoard(num);
%>
<tr><td class="tno">글번호</td><td><%=bb.getNum() %></td>
    <td>글쓴날짜</td><td><%=sdf.format(bb.getDate()) %></td></tr>
<tr><td>작성자</td><td><%=bb.getName() %></td>
    <td>조회수</td><td><%=bb.getReadcount()%></td></tr>
<tr><td>제목</td><td colspan="3"><%=bb.getSubject() %></td></tr>
<tr><td>파일</td><td colspan="3">
<a href="../upload/<%=bb.getFile() %>"<%=bb.getFile() %>></a>
<a href="file_down.jsp?file_name=<%=bb.getFile() %>">
파일다운 : <%=bb.getFile() %></a>
<img src="../upload/<%=bb.getFile() %>" width="50" height="50">
</td></tr>
<tr><td>내용</td><td colspan="3"><%=bb.getContent() %></td></tr>
<tr><td colspan="4">
<input type="button" value="글수정" class = "btn" onclick="location.href='fupdateForm.jsp?num=<%=bb.getNum()%>'">
<input type="button" value="글삭제" class = "btn" onclick="location.href='fdeleteForm.jsp?num=<%=bb.getNum()%>'">
<input type="button" value="글목록" class = "btn" onclick="location.href='fnotice.jsp'"></td></tr>
</table>
<div id="table_search">
<input type="text" name="search" class="input_box">
<input type="button" value="search" class="btn">
</div>
<div class="clear"></div>
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