<%@page import="board.BoardBean"%>
<%@page import="board.boardDAO"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.sql.DriverManager"%>
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
<h1>WebContent/board/writePro.jsp</h1>
<%
// request 한글처리
request.setCharacterEncoding("utf-8");
// name, pass, subject, content 파라미터 가져오기
String name=request.getParameter("name");
String pass=request.getParameter("pass");
String subject=request.getParameter("subject");
String content=request.getParameter("content");
// int readcount = 0 //조회수
int readcount = 0;
// 글쓴날짜 <= 현시스템에 날짜시간을 가져오기
Timestamp date=new Timestamp(System.currentTimeMillis());

//게시판글을 하나의 자바빈에 저장
//패키지 board 파일이름 BoardBean
//멤버변수 num, name, pass, subject, content, readcount, date 정의
//BoardBean bb 객체 생성
BoardBean bb = new BoardBean();
//bb set 메서드 호출 파라미터 값 저장
bb.setName(name);
bb.setPass(pass);
bb.setSubject(subject);
bb.setContent(content);
bb.setReadcount(readcount);
bb.setDate(date);


//게시판 데이터베이스 작업
//패키지 Board 파일이름 BoardDAO
//리턴값 없음 insertBoard(BB)	메서드 만들기
//BoardDAO bdao 객체 생성
boardDAO bdao = new boardDAO();
//insertBoard(bb)메서드 호출
bdao.insertBoard(bb);

// // 1단계 - JDBC프로그램안에 Driver 프로그램 가져오기
// Class.forName("com.mysql.jdbc.Driver");
// // 2단계 - DriverManager 자바프로그램이 Driver 프로그램을 가지고 디비서버 접속
// //        => 접속정보 저장
// String dbUrl="jdbc:mysql://localhost:3306/jspDB1?serverTimezone=UTC";
// String dbUser="jspid";
// String dbPass="jsppass";
// Connection con=DriverManager.getConnection(dbUrl, dbUser, dbPass);
// //3단계 num구하기 기존글에서 최대 num 값을 구해서 +1 
// String sql2="select max(num) from board";
// PreparedStatement pstmt2=con.prepareStatement(sql2);
// //4단계 실행 => rs 저장
// ResultSet rs=pstmt2.executeQuery();
// //5단계 rs 첫행이동 max(num) 가져오기 +1
// int num=0;
// if(rs.next()){
// 	num=rs.getInt("max(num)")+1;
// }
 
// 3단계 - 접속정보를 이용해서 insert sql 구문 만들고 실행할수 있는 자바프로그램 생성
// String sql="insert into board(num,name,pass,subject,content,readcount,date) values(?,?,?,?,?,?,?)";
// PreparedStatement pstmt=con.prepareStatement(sql);
// pstmt.setInt(1, num);  //parameterIndex ? 물음표 순서 ,값저장된 변수
// pstmt.setString(2, name);
// pstmt.setString(3, pass);
// pstmt.setString(4, subject);
// pstmt.setString(5, content);
// pstmt.setInt(6, readcount);
// pstmt.setTimestamp(7, date);
// // 4단계 - sql실행  (insert, update, delete)
// pstmt.executeUpdate();
// 글목록 이동
response.sendRedirect("list.jsp");
%>
</body>
</html>
 
 
 
 
 
 
 
 
 
 