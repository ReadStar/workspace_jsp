<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Join</title>
<link href="../css/default.css" rel="stylesheet" type="text/css">
<link href="../css/subpage.css" rel="stylesheet" type="text/css">
<!--[if lt IE 9]>
<script src="http://ie7-js.googlecode.com/svn/version/2.1(beta4)/IE9.js" type="text/javascript"></script>
<script src="http://ie7-js.googlecode.com/svn/version/2.1(beta4)/ie7-squish.js" type="text/javascript"></script>
<script src="http://html5shim.googlecode.com/svn/trunk/html5.js" type="text/javascript"></script>
<![endif]-->
<!--[if IE 6]>
 <script src="../script/DD_belatedPNG_0.0.8a.js"></script>
 <script>
   /* EXAMPLE */
   DD_belatedPNG.fix('#wrap');
   DD_belatedPNG.fix('#main_img');   

 </script>
 <![endif]-->
 <script src="https://t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
 <script type="text/javascript">
 function dupCheck(){
	 if(document.fr.id.value==""){
		 alert("아이디 입력 하세요");
		 document.fr.id.focus();
		 return;
	 }
	 //창을 열어서 id 들고가기
	 var wid=document.fr.id.value;
	 window.open("dupCheck.jsp?wid="+wid,"","width=200, height=200");
 }
 
 function DaumPostcode() {
     new daum.Postcode({
         oncomplete: function(data) {
             var roadAddr = data.roadAddress; // 도로명 주소 변수
             // 우편번호와 주소 정보를 해당 필드에 넣는다.
             document.getElementById('postcode').value = data.zonecode;
             document.getElementById("roadAddress").value = roadAddr;
             
             detailAddress
         }
     }).open();
 }
 </script>
</head>
<body>
<div id="wrap">
<!-- 헤더들어가는 곳 -->
<jsp:include page="../inc/top.jsp"/>
<!-- 헤더들어가는 곳 -->

<!-- 본문들어가는 곳 -->
<!-- 본문메인이미지 -->
<div id="sub_img_member"></div>
<!-- 본문메인이미지 -->
<!-- 왼쪽메뉴 -->
<!-- <nav id="sub_menu"> -->
<!-- <ul> -->
<!-- <li><a href="#">Join us</a></li> -->
<!-- <li><a href="#">Privacy policy</a></li> -->
<!-- </ul> -->
<!-- </nav> -->
<!-- 왼쪽메뉴 -->
<!-- 본문내용 -->
<article>
<h1>회원가입</h1>
<form action="joinPro.jsp" id="join" method="post" name="fr">
<fieldset>
<legend>필수정보</legend>
<label>User ID</label>
<input type="text" name="id" class="id">
<input type="button" value="중복확인" class="dup" onclick="dupCheck()"><br>
<label>Password</label>
<input type="password" name="pass"><br>
<label>Retype Password</label>
<input type="password" name="pass2"><br>
<label>Name</label>
<input type="text" name="name"><br>
<label>E-Mail</label>
<input type="email" name="email"><br>
<label>Retype E-Mail</label>
<input type="email" name="email2"><br>
</fieldset>

<fieldset>
<legend>선택사항</legend>
<label> 우편번호 </label>
<input type="text" name = "postcode" id="postcode" placeholder="우편번호">
<input type="button" class="dup" value="우편번호 찾기" onclick="DaumPostcode()"><br>
<label>주소</label>
<input type="text" name ="roadAddress" id="roadAddress"  placeholder="도로명주소">
<br>
<label>상세 주소 입력</label>
<input type="text" name= "detailAddress" id="detailAddress" placeholder="상세주소">
<br>
<label>집 전화</label>
<input type="text" name="phone"><br>
<label>핸드폰 번호</label>
<input type="text" name="mobile"><br>
</fieldset>
<div class="clear"></div>
<div id="buttons">
<input type="submit" value="Submit" class="submit">
<input type="reset" value="Cancel" class="cancel">
</div>
</form>
</article>
<!-- 본문내용 -->
<!-- 본문들어가는 곳 -->

<div class="clear"></div>
<!-- 푸터들어가는 곳 -->
<jsp:include page="../inc/bottom.jsp"/>
<!-- 푸터들어가는 곳 -->
</div>
</body>
</html>