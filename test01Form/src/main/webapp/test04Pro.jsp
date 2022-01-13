<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ page import="member.Member" %>  
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>가입정보 확인</title>
</head>
<body>

        <jsp:useBean id="Member" class="member.Member" />
        <jsp:setProperty name="Member" property="*" />
    
<table border="1">
	<tr><th colspan=2>회원 정보 확인</th></tr>
	<tr><th>회원 아이디</th><td><jsp:getProperty name="Member" property="userid" /></td></tr>
	<tr><th>회원 이름</th><td><jsp:getProperty name="Member" property="name" /></td></tr>
	<tr><th>회원 나이</th><td><jsp:getProperty name="Member" property="age" /></td></tr>
	<tr><th>회원 전화</th><td><jsp:getProperty name="Member" property="mobile" /></td></tr>
</table>


</body>
</html>