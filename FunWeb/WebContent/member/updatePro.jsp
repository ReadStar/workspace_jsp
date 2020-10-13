<%@page import="java.util.Set"%>
<%@page import="Member.MemberBean"%>
<%@page import="Member.MemberDAO"%>
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
//member/updatePro.jsp
// 한글처리 
// 파라미터 가져오기
request.setCharacterEncoding("utf-8");
// id pass name email address phone mobile 파라미터 가져오기
String id=request.getParameter("id");
String pass=request.getParameter("pass");
String name=request.getParameter("name");
String email=request.getParameter("email");
String phone=request.getParameter("phone");
String mobile=request.getParameter("mobile");
String postcode=request.getParameter("postcode");
String roadAddress=request.getParameter("roadAddress");
String detailAddress=request.getParameter("detailAddress");

// MemberBean mb 객체생성
MemberDAO mdao = new MemberDAO();
MemberBean mb = new MemberBean();
// 멤버변수 <- 파라미터 값 저장
mb.setId(id);
mb.setPass(pass);
mb.setName(name);
mb.setEmail(email);
mb.setPhone(phone);
mb.setMobile(mobile);
mb.setPostcode(postcode);
mb.setRoadaddress(roadAddress);
mb.setDetailaddress(detailAddress);
// MemberDAO mdao 객체생성
// int check = userCheck(id,pass) 메서드  호출

// check==1   // 리턴값없음 updateMember(mb) 만들고  호출
//            main.jsp 
// check==0 "비밀번호틀림" 뒤로이동
// check==-1 "아이디없음" 뒤로이동
int check=mdao.userCheck(id, pass);
// check==1 세션값 생성 "id",id  main.jsp 
// check==0 "비밀번호틀림" 뒤로이동
// check==-1 "아이디없음" 뒤로이동
if(check==1){
	session.setAttribute("id", id);
	mdao.updateMember(mb);
	response.sendRedirect("../main/main.jsp");
}else if(check==0){
	%>
	<script type="text/javascript">
		alert("비밀번호 틀림");
		history.back(); // 뒤로이동 
	</script>
	<%
}else{
	%>
	<script type="text/javascript">
		alert("아이디 없음");
		history.back(); // 뒤로이동 
	</script>
	<%
	}
%>
</body>
</html>





