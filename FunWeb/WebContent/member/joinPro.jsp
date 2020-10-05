<%@page import="Member.MemberBean"%>
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
// member/joinPro.jsp
// 한글처리
request.setCharacterEncoding("utf-8");
// id pass name email address phone mobile 파라미터 가져오기
String id=request.getParameter("id");
String pass=request.getParameter("pass");
String name=request.getParameter("name");
String email=request.getParameter("email");
String address=request.getParameter("address");
String phone=request.getParameter("phone");
String mobile=request.getParameter("mobile");
// Timestamp date 현시스템 가입날짜 
Timestamp date=new Timestamp(System.currentTimeMillis());

// 패키지 member 파일이름 MemberBean 
// id pass name email address phone mobile 멤버변수 정의 set get
// MemberBean mb 객체 생성
MemberBean mb=new MemberBean();
// set메서드 호출 <- 파라미터 값 저장
mb.setId(id);
mb.setPass(pass);
mb.setName(name);
mb.setEmail(email);
mb.setAddress(address);
mb.setPhone(phone);
mb.setMobile(mobile);
mb.setDate(date);

// 패키지 member 파일이름 MemberDAO
// 리턴값없음 insertMember(mb주소값 받을 변수) 메서드만들기
// MemberDAO mdao 객체생성
MemberDAO mdao=new MemberDAO();
// insertMember(mb)
mdao.insertMember(mb);

%>
<script type="text/javascript">
	alert("회원가입성공");
	location.href="login.jsp";
</script>
</body>
</html>




