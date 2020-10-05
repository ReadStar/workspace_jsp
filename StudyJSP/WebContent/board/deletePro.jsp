<%@page import="board.boardDAO"%>
<%@page import="board.BoardBean"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.sql.DriverManager"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<h1>WebContent/board/deletePro.jsp</h1>
<%
// 파라미터 가져오기  num ,pass
int num=Integer.parseInt(request.getParameter("num"));
String pass=request.getParameter("pass");
BoardBean bb = new BoardBean();
bb.setNum(num);
bb.setPass(pass);

boardDAO bdao = new boardDAO();

//int check = numcheck(bb) 만들고 호출
int check=bdao.numCheck(bb);
//check ==1 리턴값 없음
if(check==1){
	bdao.deleteBoard(bb);
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