<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="../js/jquery-3.5.1.js"></script>
<script type="text/javascript">
	$(document).ready(function(){
		$('#myform').submit(function(){
			var id=$('#myid').val();
// 			alert(id);
			//비밀번호
			var pass=$('#mypass').val();
// 			alert(pass);
			if(id==""){
				alert("아이디 입력하세요")
				$('#myid').focus();
				return false;
			}
			if(pass==""){
				alert("비밀번호 입력하세요")
				$('#mypass').focus();
				return false;
				}
			//체크 되어 있으면 true 
// 			alert($('#gen1').is(":checked"));
			//성별 체크 안되어있으면 알림
			if($('#gen1').is(":checked")==false && $('#gen2').is(":checked")==false){
			alert("성별체크");
			$('#gen1').focus();
			return false;
			};
		});
		
	});
</script>
</head>
<body>
<h1>js_jQuery/test9.jsp</h1>
<form action="a.jsp" method="post" id="myform">
아이디 : <input type="text" name="id" id="myid"><br>
비밀번호 : <input type="text" name="pass" id="mypass"><br>
성별 : <input type="radio" name="gender" value="남" id="gen">남
<input type="radio" name="gender" value="남" id="gen2">여<br>
<input type ="submit" value="로그인">
</form>
</body>
</html>