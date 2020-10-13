<%@page import="pComment.pCommentBean"%>
<%@page import="java.util.List"%>
<%@page import="pComment.pCommentDAO"%>
<%@page import="PicBoard.pBoardBean"%>
<%@page import="PicBoard.pBoardDAO"%>
<%@page import="FileBoard.fBoardDAO"%>
<%@page import="FileBoard.fBoardBean"%>
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
<title>pic</title>
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
<li><a href="notice.jsp">FreeBoard</a></li>
<li><a href="fnotice.jsp">File</a></li>
<li><a href="pnotice.jsp">Pic</a></li>
</ul>
</nav>
<!-- 왼쪽메뉴 -->
 
<!-- 게시판 -->
<article>
<h1>Pic</h1>
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
SimpleDateFormat sdf2=new SimpleDateFormat("yy.MM.dd. hh:mm:ss");
//BoardDAO bdao 객체생성
pBoardDAO pbdao = new pBoardDAO();
//조회수 증가 메서드 만들고 호출
pbdao.updateReadcount(num);
//리턴할형 BoardBean bb = getBoard(num) 메서드 만들고 호출
pBoardBean pbb=pbdao.getfBoard(num);
%>
<tr><td class="tno">글번호</td><td><%=pbb.getNum() %></td>
    <td>글쓴날짜</td><td><%=sdf.format(pbb.getDate()) %></td></tr>
<tr><td>작성자</td><td><%=pbb.getName() %></td>
    <td>조회수</td><td><%=pbb.getReadcount()%></td></tr>
<tr><td>제목</td><td colspan="3"><%=pbb.getSubject() %></td></tr>
</td></tr>
<tr><td>내용</td><td colspan="3"><img src="../upload/<%=pbb.getFile() %>" width ="100%" height ="auto" ><br>
<%=pbb.getContent() %></td></tr>
<tr><td colspan="4">
<%
String id=(String)session.getAttribute("id");
if(id!=null){
	if(id.equals(pbb.getName())){
		%>
<input type="button" value="글수정" class = "btn" onclick="location.href='pupdateForm.jsp?num=<%=pbb.getNum()%>'">
<input type="button" value="글삭제" class = "btn" onclick="location.href='pdeletePro.jsp?num=<%=pbb.getNum()%>'">
	<%
	}
}
%>
<input type="button" value="글목록" class = "btn" onclick="location.href='pnotice.jsp'"></td></tr>
</table>
<h4 style="text-align: center;">Comment</h4>
<hr>
<ul style ="list-style-type: none;">
<%
pCommentDAO pdao = new pCommentDAO();
List commentList = pdao.getCommentList();
for(int i = 0 ; i <commentList.size() ; i++){
	//배열 한칸에서 게시판 글 하나 가져오기
	pCommentBean pcb = (pCommentBean)commentList.get(i);
%>
			 <li><div>작성자 : <%=pcb.getName()%> 작성일 : <%=sdf2.format(pcb.getDate())%> 
			 <%if(id!=null){
				 if(id.equals(pcb.getName())){
					 %>
			 <input type="button" value="x" 
			 style = "width:20px; height:20px; text-align: center; margin: 0 0 0 300px;"
			 onclick="location.href='pcommentdeletePro.jsp?num=<%=pcb.getNum() %>&boardnum=<%=pbb.getNum()%>'"></div></li>
					 <%
				 }
			 }%>
			 			 <li><div>내용 : <%=pcb.getContent()%></div></li>
			 			 <li><hr></li>
<% 
}
%></ul>
<form action="pcommentWritePro.jsp" method="post">
<input type="hidden" name ="boardnum" value="<%=pbb.getNum() %>">
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