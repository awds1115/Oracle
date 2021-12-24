<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	if(request.getParameter("userid").equals("adad")&&
	   request.getParameter("passcode1").equals("human123")){
		RequestDispatcher rd2=request.getRequestDispatcher("login.jsp");	
		rd2.forward(request,response);
	} else {
		RequestDispatcher r3d=request.getRequestDispatcher("register.jsp");
		r3d.forward(request,response);
	}
%>