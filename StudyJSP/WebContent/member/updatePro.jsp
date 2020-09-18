<%@page import="member.MemberBean"%>
<%@page import="member.MemberDAO"%>
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
</head>
<body>
<h1>WebContent/member/updatePro.jsp</h1>
<%
request.setCharacterEncoding("utf-8");
String id = (String)session.getAttribute("id");
String pass = (String)request.getParameter("pass");
String name = (String)request.getParameter("name");

MemberDAO mdao = new MemberDAO();

int check=mdao.userCheck(id, pass);

//check==1 아이디 비밀번호 일치 신호 1 받아서
//MemberBean bb 객체 생성 멤버변수 파라미터 값 저장
//3단계 update 4단실행 updateMember(mb)
//main.jsp 이동
//check==0 아이디일치 비밀번호 틀림 신호 0받아서 "비밀번호 틀림" 뒤로이동
//나머지 check==-1 아이디 틀림 신호 -1 받아서 "아이디 없음" 뒤로 이동
if(check==1){
	MemberBean mb = new MemberBean();
	mb.setId(id);
	mb.setPass(pass);
	mb.setName(name);
	mdao.updateMember(mb);
	response.sendRedirect("main.jsp");
}else if(check == 0){
	%>
	<script type="text/javascript">
	alert("비밀번호틀림");
	history.back(); //뒤로이동
	</script>
	<%	
}else{
	%>
	<script type="text/javascript">
	alert("아이디 틀림");
	history.back();
	</script>
	<%
}
%>
</body>
</html>