<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<h1>WebContent/jsp1/for.jsp</h1>
<%
// int a=10;
// 	a = 20;
// out.println(a);
// int a1=10; int a2=20; int a3=30; int a4=40; int a5=50;
// 배열 : 같은형의 데이터 여러개를 저장
int a[]= {10, 20, 30, 40, 50};
int aa[]= new int[5];
aa[0]=10;
aa[1]=20;
aa[2]=30;
aa[3]=40;
aa[4]=50;
int aaa[]=new int[]{10, 20, 30, 40, 50};
out.print(a[0]+"<br>");
out.print(a[1]+"<br>");
out.print(a[2]+"<br>");
out.print(a[3]+"<br>");
out.print(a[4]+"<br>");

// 0~4출력 a[] 배열 변수 내용 출력
out.println("배열개수 :"+a.length+"<br>");
for(int i=0; i<=4; i++){
	out.print(i+"<br>");
}
%>
<table border="1">
<tr><td>번호</td><td>배열내용</td></tr>
<tr><td>0</td><td>10</td></tr>
<tr><td>1</td><td>20</td></tr>
<tr><td>2</td><td>30</td></tr>
<tr><td>3</td><td>40</td></tr>
<tr><td>4</td><td>50</td></tr>
</table>
<table border="1">
<tr><td>번호</td></tr>
<%
for (int ii=0; ii<5; ii++){
	out.print("<tr><td>"+ii+"</td></tr>");
}
%>
</table>

<%
//hobby배열 변수
String s[]={"여행", "독서", "게임", "축구"};

for(int j=0; j<s.length; j++){
	out.print(s[j]+"<br>");
}
for(int j=0; j<s.length; j++){
	%><%=s[j] %><br><% 
	}
%>
<table border="1">
<tr><td>번호</td><td>취미</td></tr>
<tr><td>1</td><td>여행</td></tr>
<tr><td>2</td><td>독서</td></tr>
<tr><td>3</td><td>게임</td></tr>
<tr><td>4</td><td>축구</td></tr>
</table>
<table border="1"> 
<tr><td>취미</td></tr>
	<%for(int i=0; i<s.length; i++){
		out.println("<tr><td>번호</td><td>"+s[i]+"</td></tr>");
	}
		%>
</table>
<table border="1"> 
<tr><td>취미</td></tr>
<%
for(int i=0; i<s.length; i++){
%><tr><td><%=i+1 %></td><td><%=s[i] %></td></tr><%
}%>

</table>
</body>
</html>