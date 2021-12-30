<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>First Page</title>
</head>
<body>
<%
	pageContext.setAttribute("name","page man");
	request.setAttribute("name","request man");
	session.setAttribute("name","session man");
	application.setAttribute("name","application man");
	%>
	firstPage.jsp<br>
	하나의 page 속성:${pageScope.name}<br>
	하나의 request 속성:${requestScope.name }<br>
	하나의 session 속성:${sessionScope.name }<br>
	하나의 application 속성:${applicationScope.name}<br>
	
	<jsp:forward page="07_secondpage.jsp">
		<jsp:param name="name" value="request man" />
	</jsp:forward>
	 
	
	
<!-- // 	RequestDispatcher rd=request.getRequestDispatcher("07_secondpage.jsp"); -->
<!-- // 	rd.forward(request,response); -->
<!-- //	위 아래 같은 코드임  -->
<!-- 	request.getRequestDispatcher("07_secondpage.jsp").forward(request,response); -->
	 

</body>
</html>