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
<h1>WebContent/jsp5/content.jsp</h1>
<%
//int num 파라미터 값 가져오기
int num=Integer.parseInt(request.getParameter("num"));
// 1단계 - JDBC프로그램안에 Driver 프로그램 가져오기
Class.forName("com.mysql.jdbc.Driver");
// 2단계 - DriverManager 자바프로그램이 Driver 프로그램을 가지고 디비서버 접속
//        => 접속정보 저장
String dbUrl="jdbc:mysql://localhost:3306/jspDB1?serverTimezone=UTC";
String dbUser="jspid";
String dbPass="jsppass";
Connection con=DriverManager.getConnection(dbUrl, dbUser, dbPass);
//조회수   1 증가
// 3단계  조회수= 기존조회수+1
String sql2="update board set readcount=readcount+1 where num=?";
PreparedStatement pstmt2=con.prepareStatement(sql2);
pstmt2.setInt(1, num);  //parameterIndex ? 물음표 순서 ,값저장된 변수
// 4단계 - sql실행  (insert, update, delete)
pstmt2.executeUpdate();
 
// 3단계 - 접속정보를 이용해서 select sql 구문 만들고 실행할수 있는 자바프로그램 생성
//        num에 해당하는 게시판 글 가져오기
String sql="select * from board where num=?";
PreparedStatement pstmt=con.prepareStatement(sql);
pstmt.setInt(1, num);
// 4단계 - sql구문 실행(select) => 결과 저장
ResultSet rs=pstmt.executeQuery();
// 5단계 - 결과 저장 => 출력    
// if 첫행으로 이동 데이터 있으면  열을 찾아서 출력
if(rs.next()){
	%>
<table border="1">
<tr><td>글번호</td><td><%=rs.getInt("num") %></td>
    <td>글쓴날짜</td><td><%=rs.getTimestamp("date") %></td></tr>
<tr><td>작성자</td><td><%=rs.getString("name") %></td>
    <td>조회수</td><td><%=rs.getInt("readcount") %></td></tr>
<tr><td>제목</td><td colspan="3"><%=rs.getString("subject") %></td></tr>
<tr><td>내용</td><td colspan="3"><%=rs.getString("content") %></td></tr>
<tr><td colspan="4">
<input type="button" value="글수정" onclick="location.href='updateForm.jsp?num=<%=rs.getInt("num")%>'">
<input type="button" value="글삭제" onclick="location.href='deleteForm.jsp?num=<%=rs.getInt("num")%>'">
<input type="button" value="글목록" onclick="location.href='list.jsp'"></td></tr>
</table>	
	<%
}
%>
</body>
</html>
 
 
 
 
 
 