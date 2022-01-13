<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>로그인 체크</title>
</head>
<body>
<%
	 session.setAttribute("userid",request.getParameter("userid"));
	 session.setAttribute("password",request.getParameter("password"));	 	
	 if(request.getParameter("userid").equals("aaa1111") &&
		request.getParameter("password").equals("1234")){
		 response.sendRedirect("test03Pro02.jsp");
	 } else {
		 response.sendRedirect("test03Form.jsp");
	 }
%>
   

</body>
</html>