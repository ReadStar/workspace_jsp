<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<h1>WebContent/jsp1/test3.jsp</h1>
<%
out.println(s+100);
//String s="jsp 스터디";=>엘어발생

// //메서드(함수) 정의
// public String prn(){
// 	return "안녕";
// }
// //메서드(함수) 호출
out.println(prn());
%>
<%!
//전 영역에서 사용하는 변수
String s = "jsp 스터디"; //맨처음 선언
//메서드(함수) 정의
public String prn(){
	return "안녕";
}
//메서드(함수) 호출
%>
</body>
</html>