<%@page import="Member.MemberDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script type="text/javascript">
	function idok(){
		//join.jsp id저장
	window.opener.fr.id.value = document.wfr.wid.value;
		//창 닫기
	window.close();
	}
</script>
</head>
<body>
<%
// member/dupCheck.jsp

//"dupCheck.jsp?wid="+wid
//wid 파라미터 가져오기
String wid=request.getParameter("wid");
//MemberDAO mdao 생성
MemberDAO mdao = new MemberDAO();

//int check = dupCheck(wid)
int check=mdao.dupCheck(wid);
//check ==1 "id중복"
//check ==0 "id사용가능"
if(check==1){
	out.println("아이디 중복");
}else{
	out.println("사용 가능");
	%><input type="button" value="아이디 사용" onclick="idok()"><%
}

%>
<form action="dupCheck.jsp" method = "post" name = "wfr" >
아이디 : <input type="text" name="wid" value="<%=wid %>">
<input type="submit" value="아이디 중복체크">

</form>
</body>
</html>