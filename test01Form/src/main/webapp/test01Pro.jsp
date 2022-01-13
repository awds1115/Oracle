<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>면적/둘레 계산</title>
</head>
<body>
<%
String pay=request.getParameter("pay");
  double r=Double.parseDouble(pay);
%>
<h1>원의 면적/원의 둘레를 계산합니다.</h1>
<hr>
반지름: <%=r %> <br>
원의 면적: <%=Math.pow((Math.PI*r),2) %><br>
원의 둘레:<%=2*Math.PI*r %>
</body>
</html>