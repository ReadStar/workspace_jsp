<%@page import="board.boardDAO"%>
<%@page import="board.BoardBean"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<h1>WebContent/board/updatePro.jsp</h1>
<%
request.setCharacterEncoding("utf-8"); //한글처리
//파라미터 가져오기
int num = Integer.parseInt(request.getParameter("num"));
String name = request.getParameter("name");
String pass = request.getParameter("pass");
String subject = request.getParameter("subject");
String content = request.getParameter("content");
//BoardBean bb 객체생성
BoardBean bb = new BoardBean();
//bb 멤버변수 파라미터 저장
bb.setNum(num);
bb.setName(name);
bb.setPass(pass);
bb.setSubject(subject);
bb.setContent(content);
//DAO 객체 생성
boardDAO bdao = new boardDAO();
//int check = numcheck(bb) 만들고 호출
int check=bdao.numCheck(bb);
//check ==1 리턴값 없음
if(check==1){
	bdao.updateBoard(bb);
	response.sendRedirect("list.jsp");
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
	alert("num 없음");
	history.back();
	</script>
	<%
}
%>
</body>
</html>