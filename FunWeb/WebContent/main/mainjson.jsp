<%@page import="org.json.simple.JSONObject"%>
<%@page import="org.json.simple.JSONArray"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%@ page language="java" contentType="application/json; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
//mainjson.jsp
Class.forName("com.mysql.jdbc.Driver");
String dbUrl="jdbc:mysql://localhost:3306/jspDB1?serverTimezone=UTC";
String dbUser="jspid";
String dbPass="jsppass";
Connection con=DriverManager.getConnection(dbUrl, dbUser, dbPass);

String sql="select *from board order by date desc limit 0, 5";

PreparedStatement pstmt=con.prepareStatement(sql);
ResultSet rs=pstmt.executeQuery();

JSONArray boardList = new JSONArray();
while(rs.next()){
	JSONObject bb = new JSONObject();
	bb.put("num", rs.getString("num"));
	bb.put("subject",rs.getString("subject"));
	bb.put("date",rs.getString("date"));
	}
%>
<%=boardList%>