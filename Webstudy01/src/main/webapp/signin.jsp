<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@page session="true" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>로그인</title>
</head>
 <link rel='stylesheet' type='text/css' href='page.css'>
<body align=center>
<jsp:include page="10_header.jsp" />
<form method=post action="signin_check.jsp">
 <table align=center>
 <tr><td>아이디</td><td><input type=text id=id name=id ></td></tr>
 <tr><td>비밀번호</td><td><input type=password id=pw name=pw ></td></tr>
 <tr><td colspan=2 align=center><input type=submit value='로그인'>&nbsp;
 				   <input type=reset value='다시하기'></td></tr>
 <tr><td colspan=2 align=center><input type=button id=cancel value='취소'></td>
 	 <td><a href="signon.jsp">회원가입</a></td></tr>
 </table>
 </form>
 <jsp:include page="10_footer.jsp" />
</body>
<script src="https://code.jquery.com/jquery-3.5.0.js"></script>
<script>

$(document)
.on('submit',function(){


	 if($('#id').val()=='' || $('#pw').val()==''){
		alert("아이디 또는 비밀번호가 입력되지 않았습니다.");
		return false;
	} else if($('#id').val()!= "<%=session.getAttribute("userid")%>" ||
	  		  $('#pw').val()!= "<%=session.getAttribute("passcode1")%>"){
		alert("아이디 또는 비밀번호가 틀렸습니다.");
		return false;
	}else {
		alert("로그인 되었습니다.");
		return true;
	}
	  
	
	
})
.on('click','#cancel',function(){
	document.location='home.jsp';
	})


</script>
</html>