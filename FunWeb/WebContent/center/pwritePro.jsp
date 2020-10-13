<%@page import="PicBoard.pBoardDAO"%>
<%@page import="PicBoard.pBoardBean"%>
<%@page import="FileBoard.fBoardDAO"%>
<%@page import="FileBoard.fBoardBean"%>
<%@page import="com.oreilly.servlet.MultipartRequest"%>
<%@page import="com.oreilly.servlet.multipart.DefaultFileRenamePolicy"%>
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
// request.setCharacterEncoding("utf-8");
//파일 업로드
//1. cos.jar 인스톨
//www.servlets,com
//cos file upload libray
//cos-20.08.zip -lib-cos.jar
//eclips WebCountent - Web-inf - cos.jar 넣기
//2. cos.jar - MultipartRequest 파일 객체생성 - 파일업로드
// MultipartRequest multi = new MultipartRequest(request,파일업로드폴더, 파일크기, 한글처리);
//WebContent - upload 폴더 만들기 파일업로드폴더(물리적인 경로)
String uploadPath=request.getRealPath("/upload");
System.out.println(uploadPath);
//파일크기 10M
int maxSize=10*1024*1024;
MultipartRequest multi = new MultipartRequest(request, uploadPath, maxSize, "utf-8", new DefaultFileRenamePolicy());
//파라미터
String name=multi.getParameter("name");
String pass=multi.getParameter("pass");
String subject=multi.getParameter("subject");
String content=multi.getParameter("content");
//int readcount = 0 //조회수
int readcount = 0;
//글쓴날짜 <= 현시스템에 날짜시간을 가져오기
Timestamp date=new Timestamp(System.currentTimeMillis());
//업로드된 파일이름 가져오기
String file=multi.getFilesystemName("file");

//패키지 board 파일이름 BoardBean
pBoardBean pbb = new pBoardBean();
//멤버변수 준비 set(), get()
//BoardBean bb객체 생성
//bb 멤버변수 set메서드 호출 파라미터 값 저장
pbb.setName(name);
pbb.setPass(pass);
pbb.setSubject(subject)	;
pbb.setContent(content);
pbb.setReadcount(readcount);
pbb.setDate(date);
//file 추가
pbb.setFile(file);

//패키지 Board BoardDAO 생성
//리턴값 없음 insertBoard(bb)
//BoardDAO bdao 객체 생성
pBoardDAO pbdao = new pBoardDAO();
//bdao insertBoard(bb)	메서드 호출
pbdao.insertpicboard(pbb);
//notice.jsp 이동
response.sendRedirect("pnotice.jsp");
%>
</body>
</html>