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
Class.forName("com.mysql.jdbc.Driver");
String dbUrl="jdbc:mysql://localhost:3306/jspDB1?serverTimezone=UTC";
String dbUser="jspid";
String dbPass="jsppass";
Connection con=DriverManager.getConnection(dbUrl, dbUser, dbPass);

String sql="select *from member";

PreparedStatement pstmt=con.prepareStatement(sql);
ResultSet rs=pstmt.executeQuery();
// List memberList=new ArrayList();
JSONArray memberList = new JSONArray();
while(rs.next()){
// 	MemberBean mb=new MemberBean();
	JSONObject mb = new JSONObject();
// 	mb.setId(rs.getString("id"));
// 	mb.setPass(rs.getString("pass"));
// 	mb.setName(rs.getString("name"));
// 	mb.setDate(rs.getTimestamp("date"));
	mb.put("id", rs.getString("id"));
	mb.put("pass", rs.getString("pass"));
	mb.put("name",rs.getString("name"));
	mb.put("date",rs.getString("date"));

	memberList.add(mb);
}
%>
	<%=memberList%>