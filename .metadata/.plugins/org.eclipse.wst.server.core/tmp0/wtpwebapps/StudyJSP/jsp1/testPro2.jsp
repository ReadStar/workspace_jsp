<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<h1>WebContent/jsp1/testPro2.jsp</h1>
<!-- html태그주석 -->
<%--<%jsp 주석%> --%>
<%
//자바ㅏ 한줄 주석
/*여러줄
 주석*/
%>
<%
//request 한글처림
request.setCharacterEncoding("utf-8");
String sid = request.getParameter("id");
String sname = request.getParameter("name");
String sage = request.getParameter("age");
//sage => 정수형변경
int age = Integer.parseInt(sage);
%>
아이디 : <%= sid %> <br>
이름 : <%= sname %> <br>
나이 : <%= sage %> <br>
<%
//나이가 20세 보다 크거나 같으면 성인입니다. 나머지 미성년
if(age >= 20){
	out.println("성인입니다"); //system.out.print 아님
}else{
	out.println("미성년입니다");
}

if(age >= 20){
	%>성인입니다<br><% 
}else{
	%>미성년입니다<%
}
%>
</body>
</html>