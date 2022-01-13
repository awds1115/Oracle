<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>로그인 정보</title>
</head>
<body>
<h1>로그인 확인</h1>
<hr>
<script>
alert("aaa1111님 환영합니다.");
</script>
아이디: <%=(String)session.getAttribute("userid") %>
비밀번호: <%=(String)session.getAttribute("password") %>
</body>
</html>