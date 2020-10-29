<%@page import="FileBoard.fBoardBean"%>
<%@page import="FileBoard.fBoardDAO"%>
<%@page import="PicBoard.pBoardBean"%>
<%@page import="PicBoard.pBoardDAO"%>
<%@page import="java.util.List"%>
<%@page import="Board.BoardBean"%>
<%@page import="Board.BoardDAO"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>main</title>
<link href="../css/default.css" rel="stylesheet" type="text/css">
<link href="../css/front.css" rel="stylesheet" type="text/css">
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
<script  src="../jQuery/jquery-3.5.1.js"></script>
<script type="text/javascript">
	$(document).ready(function(){
		$('.brown').click(function(){
			$.getJSON('mainjson.jsp',function(rdata){
				$.each(rdata, function(index,item){
					$('table').append('<tr><td>'+item.subject+'</td><td>'+item.date+'</td></tr>');
				});
			});
		});
	});
</script>

</head>
<body>
<div id="wrap">
<!-- 헤더파일들어가는 곳 -->
<jsp:include page="../inc/top.jsp"/>
<!-- 헤더파일들어가는 곳 -->
<!-- 메인이미지 들어가는곳 -->
<div class="clear"></div>
<div><img src="../images/main_img.jpg"
 width="400" height="150"></div>
<!-- 메인이미지 들어가는곳 -->
<!-- 메인 콘텐츠 들어가는 곳 -->
<article id="front">
<!-- <div id="solution"> -->
<!-- <div id="hosting"> -->
<!-- <h3>Web Hosting Solution</h3> -->
<!-- <p>내용</p> -->
<!-- </div> -->
<!-- <div id="security"> -->
<!-- <h3>Web Security Solution</h3> -->
<!-- <p>내용</p> -->
<!-- </div> -->
<!-- <div id="payment"> -->
<!-- <h3>Web Payment Solution</h3> -->
<!-- <p>내용</p> -->
<!-- </div> -->
<!-- </div> -->
<div class="clear"></div>
<div id="sec_news">
<h3><span class="orange">Free</span>Board</h3>
<dl class="contxt">
<%
BoardDAO bdao = new BoardDAO();
int pageSize = 5;
int startRow = 1;
List boardList = bdao.getBoardList(startRow, pageSize);
SimpleDateFormat sdf=new SimpleDateFormat("yyyy.MM.dd. hh:mm");
for(int i=0; i<boardList.size(); i++){
	BoardBean bb=(BoardBean)boardList.get(i);
	%>
<a href="../center/content.jsp?num=<%=bb.getNum()%>">
<dt><%=bb.getSubject() %><dt></a>
    <dd><%=sdf.format(bb.getDate())%></dd>
    <%
}
%>
</dl>
</div>
<div id="news_notice">
<h3 class="brown">File</h3>
<table>
<%
// fBoardDAO fdao = new fBoardDAO();
// List fboardList = fdao.getfileBoardList(startRow, pageSize);
// SimpleDateFormat sdf2=new SimpleDateFormat("yyyy.MM.dd. hh:mm");
// for(int j=0; j<fboardList.size(); j++){
// 	fBoardBean fb=(fBoardBean)fboardList.get(j);
	%>
<%-- <tr><td class="contxt"><a href="../center/pcontent.jsp?num=<%=fb.getNum()%>"><%=fb.getSubject() %></a></td> --%>
<%--     <td><%=sdf2.format(fb.getDate())%></td></tr> --%>
    <%
// }
// request.setCharacterEncoding("utf-8");
// //int num 파라미터 값 가져오기
// int num=Integer.parseInt(request.getParameter("num"));
// SimpleDateFormat sdf=new SimpleDateFormat("yy.MM.dd");
// //BoardDAO bdao 객체생성
// BoardDAO bdao = new BoardDAO();
// //조회수 증가 메서드 만들고 호출
// bdao.updateReadcount(num);
// //리턴할형 BoardBean bb = getBoard(num) 메서드 만들고 호출
// BoardBean bb=bdao.getBoard(num);
%>
<%-- <tr><td class="contxt"> <td><a href="content.jsp?num="><%=bb.getSubject() %></a></td></tr> --%>
</table>
</div>
</article>
<!-- 메인 콘텐츠 들어가는 곳 -->
<div class="clear"></div>
<!-- 푸터 들어가는 곳 -->
<jsp:include page="../inc/bottom.jsp"/>
<!-- 푸터 들어가는 곳 -->
</div>
</body>
</html>