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
String name=request.getParameter("name");
String pass=request.getParameter("pass");
String subject=request.getParameter("subject");
String content=request.getParameter("content");
//int readcount = 0 //조회수
int readcount = 0;
//글쓴날짜 <= 현시스템에 날짜시간을 가져오기
Timestamp date=new Timestamp(System.currentTimeMillis());
//패키지 board 파일이름 BoardBean
BoardBean bb = new BoardBean();
//멤버변수 준비 set(), get()
//BoardBean bb객체 생성
//bb 멤버변수 set메서드 호출 파라미터 값 저장
bb.setName(name);
bb.setPass(pass);
bb.setSubject(subject)	;
bb.setContent(content);
bb.setReadcount(readcount);
bb.setDate(date);

//패키지 Board BoardDAO 생성
//리턴값 없음 insertBoard(bb)
//BoardDAO bdao 객체 생성
BoardDAO dbao = new BoardDAO();
//bdao insertBoard(bb)	메서드 호출
dbao.insertboard(bb);
//notice.jsp 이동
response.sendRedirect("notice.jsp");
%>
</body>
</html>