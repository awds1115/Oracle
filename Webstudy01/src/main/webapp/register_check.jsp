<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<%
request.setCharacterEncoding("UTF-8");
response.setContentType("text/html; charset=UTF-8"); 
%>
실명: <%=request.getParameter("realname") %><br>
성별: <%=request.getParameter("gender") %><br>
아이디: <%=request.getParameter("userid") %><br>
비밀번호: <%=request.getParameter("passcode1") %><br>
비밀번호 확인: <%=request.getParameter("passcode2") %><br>
관심분야: 
<%
//out.println(interest[i]+",");
// 이렇게 끝에 "," 를 넣으면 마지막 단어에 , 가 붙는다.
	//String[] interest=request.getParameterValues("interest");
	//for(int i=0; i<interest.length; i++){
		//if(i==0) out.println(interest[i]);
		//else{
			//out.println(",");
			//out.println(interest[i]);
			// 이렇게 if로 조건식을 넣어 처음엔 콤마없이 찎게하고,
			// 두번째부터는 else로 가서 콤마를 찍고 내용을 찍게 하면된다.
		//}
		for(String area: request.getParameterValues("interest")){
			out.println(area+"<br>");
		}
		// 위에랑 같은 값을 출력하지만 area코드가 훨씬 짧음 
		
	//}
%>
<input type=button value='로그인하기'>
</body>
<script src='https://code.jquery.com/jquery-3.5.0.js'></script>
<script>
$(document)
.ready(function(){
	setTimeout(function(){
		document.location='login.jsp';
	},3000)
})
//위 = 3초 후 누르지 않아도 login.jsp를 실행하라 
//아래 = 누른 즉시 실행하라 
//.on('click','#btnLogin',function(){
//	document.location='login.jsp';
//})
</script>
</html>