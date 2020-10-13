<%@page import="MailSend.GoogleAuthentication"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ page import="javax.activation.*"%>
<%@ page import="java.util.*"%>
<%@ page import="javax.mail.*"%>
<%@ page import="javax.mail.internet.*"%>
<%@page import="MailSend.MailSend"%>
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
String phone=request.getParameter("phone");
String mobile=request.getParameter("mobile");
String postcode=request.getParameter("postcode");
String roadAddress=request.getParameter("roadAddress");
String detailAddress=request.getParameter("detailAddress");
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
mb.setPhone(phone);
mb.setMobile(mobile);
mb.setDate(date);
mb.setPostcode(postcode);
mb.setRoadaddress(roadAddress);
mb.setDetailaddress(detailAddress);

// 패키지 member 파일이름 MemberDAO
// 리턴값없음 insertMember(mb주소값 받을 변수) 메서드만들기
// MemberDAO mdao 객체생성
MemberDAO mdao=new MemberDAO();
// insertMember(mb)
mdao.insertMember(mb);
%>
<%
	String sender = "m.dorihosi@gmail.com";
	String receiver = request.getParameter("email");
	String subject = "회원가입을 환영합니다	";
	String content = request.getParameter("id")+"님 회원가입 감사힙니다."	;

	try {
		Properties properties = System.getProperties();
		properties.put("mail.smtp.starttls.enable", "true"); // gmail은 무조건 true 고정
		properties.put("mail.smtp.host", "smtp.gmail.com"); // smtp 서버 주소
		properties.put("mail.smtp.auth", "true"); // gmail은 무조건 true 고정
		properties.put("mail.smtp.port", "587"); // gmail 포트
		Authenticator auth = new GoogleAuthentication();
		Session s = Session.getDefaultInstance(properties, auth);
		//Session s = Session.getdefultInstance(properties, auth);
		Message message = new MimeMessage(s);
		Address sender_address = new InternetAddress(sender);
		Address receiver_address = new InternetAddress(receiver);
		message.setHeader("content-type", "text/html;charset=UTF-8");
		message.setFrom(sender_address);
		message.addRecipient(Message.RecipientType.TO, receiver_address);
		message.setSubject(subject);
		message.setContent(content, "text/html;charset=UTF-8");
		message.setSentDate(new java.util.Date());
		Transport.send(message);
	} catch (Exception e) {
		e.printStackTrace();			
	}
%>
<script type="text/javascript">
	alert("회원가입성공");
	location.href="login.jsp";
</script>

</body>
</html>




