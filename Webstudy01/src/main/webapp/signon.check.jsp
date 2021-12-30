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

	 		session.setAttribute("userid",request.getParameter("userid"));
	 		session.setAttribute("passcode1",request.getParameter("passcode1"));
	 		
	 		response.sendRedirect("signin.jsp");
// 	 		RequestDispatcher rd2=request.getRequestDispatcher("login.jsp");	
// 	 		rd2.forward(request,response);
// response.sendRedirect("login.jsp?userid="+request.getParameter("userid"));
	 	
%>
</body>
<!-- <script> -->
<!-- // document.location="login.jsp?userid=adad&passcode1=human123"; -->
<!-- </script> -->
</html>