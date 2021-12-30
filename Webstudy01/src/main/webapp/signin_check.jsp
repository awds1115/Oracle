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
String jspfile=null;
// request.setAttribute("id",request.getParameter("id"));
// RequestDispatcher rd3=request.getRequestDispatcher("home.jsp");	
// 	rd3.forward(request,response);
	session.setAttribute("id",request.getParameter("id"));
	session.setAttribute("pw",request.getParameter("pw"));
	jspfile="home.jsp";

//	Cookie c=new Cookie("id",request.getParameter("id"));

// 	c.setMaxAge(365*24*60*60);
// 	response.addCookie(c);
	
// 	response.addCookie(new Cookie("passcode",request.getParameter("pw")));
	
// 	response.sendRedirect("home.jsp");
%>
<jsp:forward page="<%=jspfile %>"/>
<!-- 위아래 jsp:forward 코드가 같음  -->
<%-- <jsp:forward page="home.jsp"> --%>
<%-- 	<jsp:param name="userid" value="<%=request.getParameter("id") %>" 	/> --%>
<%-- </jsp:forward> --%>
</body>
</html>