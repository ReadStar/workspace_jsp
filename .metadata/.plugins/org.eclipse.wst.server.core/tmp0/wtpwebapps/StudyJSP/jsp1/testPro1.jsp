<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<h1>WebContent/jsp/testPro1.jsp</h1>
<%
// name = 입력한 값 num = 입력한 값 =>
// => WAS request, response 생성 기억장소 확보 처리담당자 서블릿 처리
// request : http가 들고온 파라미터 정보(태그정보) 저장
// response : 처리결과 저장
// request.변수
// request.함수()
// request에 저장된 파라미더 정보(태그정보)를 가져오는 함수 .getParameter()
// request.getParameter("파라미터(태그)이름")
// request에 저장된 파라미터 값은 문자열로 저장된다
// 전송방식이 POST방식일때 예외적으로 request내장객체를 한글처리utf-8 설정
// request사용하기 전에 설정
request.setCharacterEncoding("utf-8");

String snum = request.getParameter("num");
//문자열 => 정수형 변경 Integer.parseInt()
int num = Integer.parseInt(snum);
%>
이름 : <%=request.getParameter("name") %> <br>
좋아하는 숫자 : <%=request.getParameter("num") %> <br>
좋아하는 숫자 + 100 : <%=request.getParameter("num") + 100%><br>
좋아하는 숫자 숫자로 변경 +100 : <%=num+100%><br>
</body>
</html>
