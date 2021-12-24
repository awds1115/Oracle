<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>로그인</title>
</head>
<body>
<form method=post action="Login_check.jsp">
 <table>
 <tr><td>아이디</td><td><input type=text name=userid></td></tr>
 <tr><td>비밀번호</td><td><input type=text name=password></td></tr>
 <tr><td colspan=2 align=center><input type=submit value='로그인'>&nbsp;
 				   <input type=reset value='다시하기'></td></tr>
 <tr><td colspan=2 align=center><input type=button id=cancel value='취소'></td>
 	 <td><a href="register.jsp">회원가입</a></td></tr>
 
 </table>
 </form>
 
</body>
<script src="https://code.jquery.com/jquery-3.5.0.js"></script>
<script>
$(document)
.on('click','#cancel',function(){
	document.location='home.jsp';
})
</script>
</html>