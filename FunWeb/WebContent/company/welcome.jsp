<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Intro</title>
<link href="../css/default.css" rel="stylesheet" type="text/css">
<link href="../css/subpage.css" rel="stylesheet" type="text/css">
<style>
.h1st {border: 1px solid;
width: 600px; }

.pre {white-space: pre;}

.boxst {border: 1px solid white;
width: 600px;
 line-height: 1.8;}
</style>
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
 
</head>
<body>
<div id="wrap">
<!-- 헤더가 들어가는 곳 -->
<jsp:include page="../inc/top.jsp"/>
<!-- 헤더가 들어가는 곳 -->

<!-- 본문 들어가는 곳 -->
<!-- 서브페이지 메인이미지 -->
<div id="sub_img"></div>
<!-- 서브페이지 메인이미지 -->
<!-- 왼쪽메뉴 -->
<!-- <nav id="sub_menu"> -->
<!-- <ul> -->
<!-- <li><a href="#">Welcome</a></li> -->
<!-- <li><a href="#">없음</a></li> -->
<!-- <li><a href="#">없음</a></li> -->
<!-- <li><a href="#">없음</a></li> -->
<!-- </ul> -->
<!-- </nav> -->
<!-- 왼쪽메뉴 -->
<!-- 내용 -->
<article>
<h2>내돈내산</h2>
<figure class="ceo">
<!-- <img src="../images/company/CEO.jpg" width="196" height="226"  -->
<!-- alt="CEO"> -->
<figcaption></figcaption>
</figure>
<div>
 <p class="pre boxst" style="font-size: 13px;">
<span style = "color: #FA5858;">내돈</span> 내고 <span style = "color: #FA5858;">내</span>가 <span style = "color: #FA5858;">산</span> 제품 사진 백업용도로 만든 곳<br>
사기는 애매했던 물건, 뭐하는 건지 궁금했던 물건 등등 <br>
자유게시판 및 페이지 하단의 메일로 건의 주시면<br>
여건이 될 때 구매 후 후기 작성 합니다.
 </p>
<h3>
</h3></div>
</article>
<!-- 내용 -->
<!-- 본문 들어가는 곳 -->
<div class="clear"></div>
<!-- 푸터 들어가는 곳 -->
<jsp:include page="../inc/bottom.jsp"/>
<!-- 푸터 들어가는 곳 -->
</div>
</body>
</html>



