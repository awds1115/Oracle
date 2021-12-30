<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Create Cookie</title>
</head>
<body>
<%
	Cookie c = new Cookie("id","Laneige");
	c.setMaxAge(365*24*60*60); // 쿠키의 수명(365일 지정)
	response.addCookie(c);  // 클라이언트에 쿠키파일이 생성됨 
%>
</body>
</html>