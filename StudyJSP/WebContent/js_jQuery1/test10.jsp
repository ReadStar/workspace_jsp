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
		//효과 대상.show() 대상.hide() 대상.toggle()
		//		  대상.slideDown() 대상.slideUp() 대상.slideToggle()
		//		  대상.fadeIn() 대상.fadeOut 대상.fadeToggle()
		//h2대상 클릭했을때 클릭한 대상 다음태그 .next() .toggle() 효과
		$('h2').click(function(){
			$(this).next().toggle('slow',function(){
				alert("효과 끝");
				
			});
			
		});
	});
</script>
</head>
<body>
<h1>js_jQuery/test10.jsp</h1>
<h2>열고 닫기</h2>
<div>
<h2>제목1</h2>
<p>내용</p>
</div>
<h2>열고 닫기2</h2>
<div>
<h2>제</h2>
<p>내용2</p>
</div>
</body>
</html>