<%@page import="jsp6.BeanDB"%>
<%@page import="jsp6.BeanTest1"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<h1>WebContent/jsp6/beanPro1.jsp</h1> 
<%
request.setCharacterEncoding("utf-8");
// String name = request.getParameter("name");
// int num=Integer.parseInt(request.getParameter("num"));
//name, num 하나의 바구니에 담아서 전달 => JavaBean(JavaDTO)
//패키지 jsp6 자바파일 BeanTest1 만들기
//BeanTest1클래스 정의 => 사용하기 위해 객체생성(기억장소 할당)
// BeanTest1 bt1= new BeanTest1();
//파라미터 name, num => BeanTest 멤버변수 name, num 저장
//bt1.name=name; private name 변수 데이터은닉
//public setName() 통해서 파라미터 값 전달받아 name 변수에 저장
// bt1.setName(name);
// bt1.setNum(num);
//액션태그 가지고 객체생성
%>
<jsp:useBean id= "bt1" class="jsp6.BeanTest1"/>
<%-- <jsp:setProperty property="name" name="bt1" param="name"/> --%>
<%-- <jsp:setProperty property="num" name="bt1" param="num"/> --%>
<%--파라미터 가져와서 set메서드 호출 값 저장 --%>
<jsp:setProperty property="*" name="bt1"/>

<%
//DB작업 => 자바파일 메서드 호출 => insert 작업
//DB작업 패키지 jsp6 파일이름 BeanDB
//BeanDB 객체생성
BeanDB bd = new BeanDB();
//insert 호출
bd.insert(bt1);
%>
</body>
</html>