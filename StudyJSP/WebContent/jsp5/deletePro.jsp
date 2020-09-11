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
<h1>WebContent/jsp5/deletePro.jsp</h1>
<%
// 파라미터 가져오기  num ,pass
int num=Integer.parseInt(request.getParameter("num"));
String pass=request.getParameter("pass");
// JDBC 프로그램 설치
// 1단계 - JDBC프로그램안에 Driver 프로그램 가져오기
Class.forName("com.mysql.jdbc.Driver");
// 2단계 - DriverManager 자바프로그램이 Driver 프로그램을 가지고 디비서버 접속
//        => 접속정보 저장
String dbUrl="jdbc:mysql://localhost:3306/jspDB1?serverTimezone=UTC";
String dbUser="jspid";
String dbPass="jsppass";
Connection con=DriverManager.getConnection(dbUrl, dbUser, dbPass);
// 3단계 - 접속정보를 이용해서 select sql 구문 만들고 실행할수 있는 자바프로그램 생성
//   board테이블에  num열에 해당하는 게시판글 있는지 조회
String sql="select * from board where num=?";
PreparedStatement pstmt=con.prepareStatement(sql);
pstmt.setInt(1, num);
// 4단계 - sql구문 실행(select) => 결과 저장
ResultSet rs=pstmt.executeQuery();
// 5단계 - 결과 저장 => 
// if rs.next() 다음행이동 했을때 데이터가 있으면  true  게시판 글 있음
//         폼에서 입력한 비밀번호 디비에서 가져온 비밀번호 비교 맞으면 
// 3단계 delete( 조건num) 4단계 실행 list.jsp이동
//           틀리면 "비밀번호 틀림" 뒤로이동
// 데이터가 없으면 false  "게시판 글 없음" 뒤로이동
if(rs.next()){
	if(pass.equals(rs.getString("pass"))){
		//3단계 delete(  조건num)
		String sql2="delete from board where num=?";
		PreparedStatement pstmt2=con.prepareStatement(sql2);
		pstmt2.setInt(1, num);  //parameterIndex ? 물음표 순서 ,값저장된 변수
		// 4단계 - sql실행  (insert, update, delete)
		pstmt2.executeUpdate();
		// list.jsp이동
		response.sendRedirect("list.jsp");
	}else{
		%>
		<script type="text/javascript">
			alert("비밀번호 틀림");
			history.back(); // 뒤로이동 
		</script>
		<%
	}
}else{
	%>
	<script type="text/javascript">
		alert("게시판 글 없음");
		history.back(); // 뒤로이동 
	</script>
	<%
}
%>
</body>
</html>