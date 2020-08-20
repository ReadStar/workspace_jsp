<%@page import="java.sql.CallableStatement" %>
<%@page import="java.sql.PreparedStatement" %>
<%@page import="java.sql.Statement" %>
<%@page import="java.sql.Connection" %>
<%@page import="java.sql.DriverManager" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<h1>WebContent/jsp3/insertPro.jsp</h1>
<%
//request 한글처리
request.setCharacterEncoding("utf-8");
//int num, String nage 파라미터 => 서버 request 내장객체 저장 =>가져와서 변수 저장
int num=Integer.parseInt(request.getParameter("num"));
String name=request.getParameter("name");
//JDBC프로그램 설치
//1단계 JDBC안에 Driver 프로그램 가져오기
Class.forName("com.mysql.jdbc.Driver");
//2단계 DriverManager 자바 프로그램이 Driver 프로그램을 가지고 디비서버 접속=>접속정보저장
String dbUrl="jdbc:mysql://localhost:3306/jspDB1?serverTimezone=UTC";
String dbUser="root";
String dbPass="63520321";
Connection con=DriverManager.getConnection(dbUrl, dbUser, dbPass);
//3단계 접속정보를 이용해서 insert sql 구문 만들고 실행할수있는 자바프로그램 생성
//	 =>insert, update, delete, select
//insert into 테이블이름(열이름, 열이름) values(값1, '값2');
//insert into student(num, name) values(2, 'kim');
//statement, PreparedStatement, CallableStatement 자바프로그램
// String sql="insert into student(num, name) values("+num+", '"+name+"')";
String sql="insert into student(num, name) values(?, ?)";
PreparedStatement pstmt=con.prepareStatement(sql);
pstmt.setInt(1, num); //parameterIndex ? 물음표 순서 , 값이 저장된 변수
pstmt.setString(2, name);
//4단계 sql실행
pstmt.executeUpdate();
%>
학생등록 성공 : <%=pstmt %>
</body>
</html>