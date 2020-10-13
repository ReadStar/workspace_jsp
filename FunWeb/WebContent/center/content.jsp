<%@page import="java.util.List"%>
<%@page import="Comment.CommentDAO"%>
<%@page import="Comment.CommentBean"%>
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
<style>

.pre {white-space: pre;}

.boxst {border: 1px solid white;
width: 600px;
 line-height: 1.8;}
</style>
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
<li><a href="notice.jsp">FreeBoard</a></li>
<li><a href="fnotice.jsp">File</a></li>
<li><a href="pnotice.jsp">Pic</a></li>
</ul>
</nav>
<!-- 왼쪽메뉴 -->
 
<!-- 게시판 -->
<article>
<h1>FreeBoard</h1>
<table id="notice">
<%
//int num 파라미터 값 가져오기
int num=Integer.parseInt(request.getParameter("num"));
SimpleDateFormat sdf=new SimpleDateFormat("yy.MM.dd");
SimpleDateFormat sdf2=new SimpleDateFormat("yy.MM.dd. hh:mm:ss");
//BoardDAO bdao 객체생성
BoardDAO bdao = new BoardDAO();
//조회수 증가 메서드 만들고 호출
bdao.updateReadcount(num);
//리턴할형 BoardBean bb = getBoard(num) 메서드 만들고 호출
BoardBean bb=bdao.getBoard(num);
%>
<tr><td>글번호</td><td><%=bb.getNum() %></td>
    <td>글쓴날짜</td><td><%=sdf.format(bb.getDate()) %></td></tr>
<tr><td>작성자</td><td><%=bb.getName() %></td>
    <td>조회수</td><td><%=bb.getReadcount()%></td></tr>
<tr><td>제목</td><td colspan="3"><%=bb.getSubject() %></td></tr>
</td></tr>
<tr><td>내용</td><td colspan="3"><%=bb.getContent() %></td></tr>
<tr><td colspan="4">
<%
//세션값 가져오기
String id=(String)session.getAttribute("id");
//세션값과 글쓴이가 일치하면 글수정, 글삭제 버튼 보이기
if(id!=null){
	if(id.equals(bb.getName())){
		%>
<input type="button" value="글수정" class = "btn" onclick="location.href='updateForm.jsp?num=<%=bb.getNum()%>'">
<input type="button" value="글삭제" class = "btn" onclick="location.href='deletePro.jsp?num=<%=bb.getNum()%>'">
	<%
	}
}
%>
<input type="button" value="글목록" class = "btn" onclick="location.href='notice.jsp'"></td></tr>
</table>
<h4 style="text-align: center;">Comment</h4>
<hr>
<ul style ="list-style-type: none;">
<%
CommentDAO cdao = new CommentDAO();
List commentList = cdao.getCommentList(bb.getNum());
for(int i = 0 ; i <commentList.size() ; i++){
	//배열 한칸에서 게시판 글 하나 가져오기
	CommentBean cb = (CommentBean)commentList.get(i);
%>
			 <li><div>작성자 : <%=cb.getName()%> 작성일 : <%=sdf2.format(cb.getDate())%> 
			 <%if(id!=null){
				 if(id.equals(cb.getName())){
					 %>
			 <input type="button" value="x" 
			 style = "width:20px; height:20px; text-align: center; margin: 0 0 0 300px;"
			 onclick="location.href='commentdeletePro.jsp?num=<%=cb.getNum()%>&boardnum=<%=bb.getNum()%>'"></div></li>
					 <%
				 }
			 }%>
			 			 <li><div>내용 : <%=cb.getContent()%></div></li>
			 			 <li><hr></li>
<% 
}
%></ul>
<form action="commentWritePro.jsp" method="post">
<input type="hidden" name ="boardnum" value="<%=bb.getNum() %>">
<table>
<%
if(id!=null){
	%>
<tr><th>댓글</th>
	<th><textarea name="content" rows="3" cols="60"></textarea></th>
<th><input type="submit" value="댓글작성" style="margin: 0 0 0 10px;"><br><%
}
%></th>
</table>
</form>

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