<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@page session="true" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<%
// 	request.removeAttribute("id");
	session.invalidate(); // 모든 session attributes를 삭제(제거)
// 	Cookie c = new Cookie("id",null);
// 	Cookie c1 = new Cookie("passcode",null);
// 	c.setMaxAge(0);
// 	c1.setMaxAge(0);
// 	response.addCookie(c);
// 	response.addCookie(c1);
// 	response.sendRedirect("home.jsp");
// 	RequestDispatcher rd3=request.getRequestDispatcher("home.jsp");	
// 	rd3.forward(request,response);
	%>
	<jsp:forward page="home.jsp" />
</body>
</html>