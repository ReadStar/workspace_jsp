<%@page import="fComment.fCommentDAO"%>
<%@page import="fComment.fCommentBean"%>
<%@page import="pComment.pCommentBean"%>
<%@page import="pComment.pCommentDAO"%>
<%@page import="Comment.CommentDAO"%>
<%@page import="Comment.CommentBean"%>
<%@page import="Board.BoardDAO"%>
<%@page import="Board.BoardBean"%>
<%@page import="java.sql.Timestamp"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<%
//한글처리
request.setCharacterEncoding("utf-8");
//파라미터
String name=(String)session.getAttribute("id");
String pass=request.getParameter("pass");
String content=request.getParameter("content");
int boardnum = Integer.parseInt(request.getParameter("boardnum"));
//글쓴날짜 <= 현시스템에 날짜시간을 가져오기
Timestamp date=new Timestamp(System.currentTimeMillis());
//패키지 board 파일이름 BoardBean
fCommentBean fcb = new fCommentBean();
//멤버변수 준비 set(), get()
//BoardBean bb객체 생성
//bb 멤버변수 set메서드 호출 파라미터 값 저장
fcb.setName(name);
fcb.setContent(content);
fcb.setDate(date);
fcb.setBoardnum(boardnum);
//패키지 Board BoardDAO 생성
//리턴값 없음 insertBoard(bb)
//BoardDAO bdao 객체 생성
fCommentDAO fcdao = new fCommentDAO();
//bdao insertBoard(bb)	메서드 호출
fcdao.insertcomment(fcb);
//notice.jsp 이동
%>
<script type="text/javascript">
	alert("댓글 작성");
	location.replace("fcontent.jsp?num=<%=boardnum%>");
	</script>
</body>
</html>