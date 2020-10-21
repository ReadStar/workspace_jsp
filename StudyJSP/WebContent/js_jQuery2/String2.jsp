<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<!-- <h1>js_jQuery2/String2.jsp</h1> -->
<%
String id = request.getParameter("id");
String pass = request.getParameter("pass");
%>
아이디 : <%=id%>, 비밀번호:<%=pass%>