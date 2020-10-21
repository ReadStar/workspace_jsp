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
			//대상.이벤트함수() bind() click() mouseover()
// 			$('h2').bind('click',function(){
// 				$(this).html('클릭');
// 				alert('클릭이벤트');
// 				//이벤트 한번만 하고 종료
// 				$(this).unbind();
// 			});
// 			$('h2').click(function(){
// 				$(this).html('클릭2');
// 				alert('클릭이벤트2');
// 				$(this).unbind();
// 			});

			//h2대상을 클릭했을때 기존 내용을 들고와서 head-0*** 내용 수정 넣기
			$('h2').click(function(){
				$(this).html(function(index, oldhtml){
				return oldhtml+"*";
				});
			});
			//img태그를 마우스오버 mouseover() 했을때
			//마우스어버 대상 attr() 'src'속성 2.jpg로 변경
			$('img').mouseover(function(){
				$(this).attr('src','2.jpg');
			}).mouseout(function(){
				$(this).attr('src','../img/1.jpg');
			});
			//img태그를 마우스 아웃 mouseout() 했을때
			//마우스아웃 대상 attr() 'src' 속성 1.jpg로 변경
	});
		
</script>
</head>
<body>
<h1>js_jQuery/test8.jsp</h1>
<img src="../img/1.jpg" width="300" height="200"	>
<h2>head-0</h2>
<h2>head-1</h2>
<h2>head-2</h2>
</body>
</html>