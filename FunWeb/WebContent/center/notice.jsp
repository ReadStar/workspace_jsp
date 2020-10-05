<%@page import="java.text.SimpleDateFormat"%>
<%@page import="Board.BoardBean"%>
<%@page import="java.util.List"%>
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

<%
BoardDAO bdao = new BoardDAO();

int count=bdao.getBoardCount();
//한페이지에 보여줄 글 개수설정
int pageSize=10;
//현 페이지 번호 가져오기

//pageNum 파라미터 가져오기
String pageNum=request.getParameter("pageNum");
//pageNum 없으면 "1"페이지 설정
if(pageNum==null){
	pageNum="1";
}
//시작하는 행번호 구하기
int currentPage=Integer.parseInt(pageNum);
//int startRow= currentPage pageSize 이용한 계산식
//current Page pageSize => startRow
//					1			10		=>		0*10+1 => 1
//					2			10		=>		1*10+1 => 11
//					3			10		=>		2*10+1 => 21
int startRow = (currentPage-1)*pageSize+1;
//String sql="select *from board order by num desc limit ?, ?"; //limit 구문은 mysql만
//?startRow -1 ? pageSize 
//날짜를 원하는 모양으로 변경하는 문자열 결과값
List boardList=bdao.getBoardList(startRow, pageSize);
SimpleDateFormat sdf=new SimpleDateFormat("yy.MM.dd");
%> 
<!-- 게시판 -->
<article>
<h1>Notice</h1>
<table id="notice">
<!-- <tr><th class="tno">No.</th> -->
<!--     <th class="ttitle">Title</th> -->
<!--     <th class="twrite">Writer</th> -->
<!--     <th class="tdate">Date</th> -->
<!--     <th class="tread">Read</th></tr> -->
<tr><th class="tno">번호</th><th class="ttitle">제목</th><th class="twrite">작성자</th>
<th class="tdate">게시일</th><th class="tread">조회수</th></tr>

<!-- <tr><td>번호</td><td>제목</td><td>작성자</td><td>날짜</td><td>조회수</td> -->
<%
for(int i = 0 ; i < boardList.size() ; i++){
	//배열 한칸에서 게시판 글 하나 가져오기
	BoardBean bb = (BoardBean)boardList.get(i);

%>
			<tr><td><%=bb.getNum() %></td>
			 <td><a href="content.jsp?num=<%=bb.getNum() %>"><%=bb.getSubject() %></a></td>
			 <td><%=bb.getName() %></td><td><%=sdf.format(bb.getDate()) %></td>
			 <td><%=bb.getReadcount() %></td>
<%
}
%>
</table>
<div id="table_search">
<form action="noticeSearch.jsp" method="post">
<input type="text" name="search" class="input_box">
<input type="submit" value="search" class="btn">
</form>
<%
String id=(String)session.getAttribute("id");
if(id!=null){
	%><input type="button" value="Write" class="btn" onclick="location.href='writeForm.jsp'"><%
}
%>
</div>
<div class="clear"></div>
<div id="page_control">
<%
//한 화면에 보여줄 페이지 개수 설정
int pageBlock=10;
//시작하는 페이지번호 구하기
//페이지번호 pageBlock => startPage
// 1~10				10	   =>			(0~9) / 10*10+1=>0*10+1=>0+1=1
//11~20				20      =>		   (10~19) / 10*10+1=>1*10+1=>10+1=11
int startPage=(currentPage-1)/pageBlock*pageBlock+1;

//끝나는 페이지 구하기
//시작페이지번호		pageBlock		=>	endPage
//			1							10			=>		 10
//			11						10			=>		 20
//			21						10			=>		 30
int endPage=startPage+pageBlock-1;
//페이지 번호가 10까지 없을 경우
//전체페이지 수 구하기
//전체게시판 글 갯수 / pageSiez => pageCount
//count12				/ pageSize 10 =>	1+1	=>	2
//			20				/ pageSize	10 =>	2	=> 2	
int pageCount = count/pageSize+(count%pageSize==0?0:1);
if(endPage > pageCount){
	endPage=pageCount;
}
for(int i=startPage; i<=endPage; i++){
	%><a href="list.jsp?pageNum=<%=i  %>"><%=i %></a><%
			}
//이전
if(startPage > pageBlock){
	%><a href="list.jsp?pageNum=<%=startPage-pageBlock%>">Prev</a><%
}
//다음
if(endPage < pageCount){
	%><a href="list.jsp?pageNum<%=startPage+pageBlock%>">Next</a><%
}
	%>
	
<!-- <a href="#">Prev</a> -->
<!-- <a href="list.jsp?pageNum=1">1</a><a href="list.jsp?pageNum=2">2</a><a href="#">3</a> -->
<!-- <a href="#">4</a><a href="#">5</a><a href="#">6</a> -->
<!-- <a href="#">7</a><a href="#">8</a><a href="#">9</a> -->
<!-- <a href="#">10</a> -->
<!-- <a href="#">Next</a> -->
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