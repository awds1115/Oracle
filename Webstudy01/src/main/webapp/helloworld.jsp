<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<title>Hello World</title>
</head>
<body>
<h1>Hello World, Shin Jin Yong.</h1>
넌 누구니?
<input type=text id=txtMyNam>

<% 
	// 내장객체(request/out)가 이미 내부적으로 들어가 있기 때문에 
	// 선언하지 않아도 out.println 을 사용 할 수 있다. 
for(int j=2; j<10; j++) { 
for(int i=1; i<10; i++) {
	out.println(j+"x"+i+"="+(j*i)+"<br>"); 
	
}
}
%> 

</body>
</html>