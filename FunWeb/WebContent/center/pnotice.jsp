<%@page import="PicBoard.pBoardBean"%>
<%@page import="PicBoard.pBoardDAO"%>
<%@page import="FileBoard.fBoardBean"%>
<%@page import="FileBoard.fBoardDAO"%>
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
<style type="text/css"> 
  a:link { text-decoration: none;} 
  a:visited { text-decoration: none;} 
  a:active { text-decoration: none;}
  a:hover {text-decoration:underline;}
</style>
<body vlink="black" link="black" alink="black">
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
 <style>
		.album{
			float:left; 
			text-align:center;
			margin: 15px;
			String fileName = "";
		}
		/* clear: both; */
</style>
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
<li><a href="notice.jsp">FreeBoard</a></li>
<li><a href="fnotice.jsp">File</a></li>
<li><a href="pnotice.jsp">Pic</a></li>
</ul>
</nav>
<!-- 왼쪽메뉴 -->

<%
pBoardDAO pbdao = new pBoardDAO();

int count=pbdao.getBoardCount();
//한페이지에 보여줄 글 개수설정
int pageSize=12;
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
List boardList=pbdao.getpicBoardList(startRow, pageSize);
SimpleDateFormat sdf=new SimpleDateFormat("yy.MM.dd");
%> 

<!-- 게시판 -->
<article>
<h1>Pic</h1>
 <table id="pnotice">
<!-- <table> -->
<!-- <tr><th class="tno">No.</th> -->
<!--     <th class="ttitle">Title</th> -->
<!--     <th class="twrite">Writer</th> -->
<!--     <th class="tdate">Date</th> -->
<!--     <th class="tread">Read</th></tr> -->
<%


%>
<!-- <tr><td>번호</td><td>제목</td><td>작성자</td><td>날짜</td><td>조회수</td> -->


<tr><td><div class="row">
		<div class="col-md-2"> 
		</div>
		<div class="col-md-8">
			<%	
				int check = 0;
				for(check = 0 ; check < boardList.size();){ //게시글 데이터 
				pBoardBean pbb = (pBoardBean)boardList.get(check);
			        	String fileName="";
				if (pbb.getFile() != null) {  // 이미지 파일 있으면
					fileName = pbb.getName(); // 이미지 파일 불러오고
				} else {
					fileName = "../imagers/home-8-fill.png";// 없으면 기본 그림으로 출력
				}
				if(check % 4 == 0){
		        	%>
			        	<div style="clear:both;"></div>
				<%
					}//if
					check++;
				%>		
				<div class="album"> 
				<div style = "text-align:center;">	
					<a href = "pcontent.jsp?num=<%=pbb.getNum() %>"><img src="../upload/<%=pbb.getFile() %>" width ="100" height ="100" class="img-thumbnail"></div>
				<div style = "text-align:center;"><%=pbb.getSubject() %></a></div>
				<div style = "text-align:center;"><%=pbb.getName() %><br></div>
				<div style = "text-align:center;"><%=sdf.format(pbb.getDate()) %></div>
			</div>
		<%
			}//for
		%>	
	</div>
	<div class="col-md-2">
		</div>
	</div></td></tr>
<%-- 			<tr><td><%=bb.getNum() %></td> --%>
<%-- 			 <td><a href="content.jsp?num=<%=bb.getNum() %>"><%=bb.getSubject() %></a></td> --%>
<%-- 			 <td><%=bb.getName() %></td><td><%=sdf.format(bb.getDate()) %></td> --%>
<%-- 			 <td><%=bb.getReadcount() %></td> --%>
</table>
<div id="table_search">
<form action="pnoticeSearch.jsp" method="post">
<input type="text" name="search" class="input_box">
<input type="submit" value="search" class="btn">
<%
String id=(String)session.getAttribute("id");
if(id!=null){
	%><input type="button" value="Write" class="btn" onclick="location.href='pwriteForm.jsp'"
	style="margin:0 0 0 250px;"><%
}
%>
</form>
</div>
<div id="table_search">

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
	%><a href="plist.jsp?pageNum=<%=i  %>"><%=i %></a><%
			}
//이전
if(startPage > pageBlock){
	%><a href="plist.jsp?pageNum=<%=startPage-pageBlock%>">Prev</a><%
}
//다음
if(endPage < pageCount){
	%><a href="plist.jsp?pageNum<%=startPage+pageBlock%>">Next</a><%
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