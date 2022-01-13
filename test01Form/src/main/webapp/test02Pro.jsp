<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원정보</title>
</head>
<style>
th,td{
border:1px solid black;
}
</style>
<body>
<%
String name=request.getParameter("name"); 
int age=Integer.parseInt(request.getParameter("age"));
String mobile=request.getParameter("mobile");
String address=request.getParameter("address");
%>
<table border="1">
	<tr><th colspan=2>회원 정보 확인</th></tr>
	<tr><th>이름</th><td><%=name %></td></tr>
	<tr><th>나이</th><td><%=age %></td></tr>
	<tr><th>전화번호</th><td><%=mobile %></td></tr>
	<tr><th>주소</th><td><%=address %></td></tr>
</table>
</body>
</html>