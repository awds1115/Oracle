<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Home</title>
</head>
   <link rel='stylesheet' type='text/css' href='page.css'>
<body align=right>
<jsp:include page="10_header.jsp" />
<!-- <a href="login.jsp">로그인</a> -->
<table id=home align=right>
	<tr>
		<td><%	if(request.getAttribute("id")==null){
					String userid=(String) session.getAttribute("id");
				if(userid==null){
					out.print("<a href='signin.jsp'>로그인</a>&nbsp;"+"<a href='signon.jsp'>회원가입</a>");
				} else {
					out.print(userid+"<a href=logout.jsp>로그아웃</a>");
				}	
			} %>
		</td>
	</tr>
</table>
<img src="https://images.pexels.com/photos/9386673/pexels-photo-9386673.jpeg?auto=compress&cs=tinysrgb&h=750&w=1260"
			width="1100px" height="600px"  >
<%-- <% --%>
<!-- // 	Cookie[] cookies=request.getCookies(); -->
<!-- // 	boolean flag=true; -->
<!-- // 	for(Cookie c:cookies){ -->
<!-- // 		if(c.getName().equals("id")){ -->
<!-- // 			out.println(c.getValue()+"&nbsp;&nbsp;<a href='logout.jsp'>로그아웃</a>"); -->
<!-- // 			flag=true; -->
<!-- // 			break; -->
<!-- // 		} -->
<!-- // 	} -->
<!-- // 	if(flag==true){ -->
<!-- // 		out.println("<a href='login.jsp'>로그인</a>&nbsp;&nbsp;<a href='register.jsp'>회원가입</a>"); -->
<!-- // 	} -->
<%-- %> --%>

<jsp:include page="10_footer.jsp" />
</body>
</html>