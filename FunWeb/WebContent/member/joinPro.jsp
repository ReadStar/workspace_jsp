<%@page import="Member.MemberDAO"%>
<%@page import="Member.MemberBean"%>
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
//member/joinPro.jsp
//한글처리
request.setCharacterEncoding("utf-8");
//id, pass, name, email, address phone mobile 파라미터값 가져오기
String id=request.getParameter("id");
String pass=request.getParameter("pass");
String name=request.getParameter("name");
String email=request.getParameter("email");
String address=request.getParameter("address");
String phone=request.getParameter("phone");
String mobile=request.getParameter("mobile");
//가입날짜 <= 현 시스템에 날짜시간 가져오기
Timestamp date = new Timestamp(System.currentTimeMillis());
//패키지 member 파일이름 MemberBean
//id pass name emil address phone mobile 멤버변수 정의 set get
//MemberBean mb 객체 생성
//set메서드 호출 파라미터값 저장
MemberBean mb = new MemberBean();
mb.setId(id);
mb.setPass(pass);
mb.setName(name);
mb.setEmail(email);
mb.setAddress(address);
mb.setPhone(phone);
mb.setMobile(mobile);
mb.setDate(date);
//패키지 Member 파일이름 MemberDAO
MemberDAO mdb = new MemberDAO();
//리턴값 없음 insertMember(mb주소값)
//MemberDAO 객체 생성
%>
</body>
</html>