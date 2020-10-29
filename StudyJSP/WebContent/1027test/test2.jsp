<%@page import="org.json.simple.JSONArray"%>
<%@page import="org.json.simple.JSONObject"%>
<%@page import="java.util.List"%>
<%@page import="java.util.ArrayList"%>
<%@page import="member.MemberBean"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%@ page language="java" contentType="application/json; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
Connection con = null;
Class.forName("com.mysql.jdbc.Driver");                                                                     
String dbUrl="jdbc:mysql://localhost:3306/jspdb1?serverTimezone=UTC";                              
String dbUser="jspid";
String dbPass="jsppass";
con = DriverManager.getConnection(dbUrl, dbUser,dbPass);               
String sql ="select * from board order by num";
PreparedStatement pstmt = con.prepareStatement(sql); 
ResultSet rs = pstmt.executeQuery(); 


JSONArray boardList = new JSONArray();
while(rs.next()){                  
   JSONObject bb=new JSONObject();
   bb.put("num", rs.getInt("num"));
   bb.put("subject", rs.getString("subject"));
   bb.put("name", rs.getString("name"));
   bb.put("date", rs.getString("date"));   
   bb.put("readcount", rs.getInt("readcount"));

   boardList.add(bb);
}
%>
<%=boardList %>
