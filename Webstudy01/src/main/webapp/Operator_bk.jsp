<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>계산완료</title>
</head>
<body>
<%
// 해당jsp처럼 jsp에 직접 작성해서 
// 다른 jsp에서 jsp를 불러와 사용할 수도 있음
String val1=request.getParameter("value1");
String val2=request.getParameter("value2");
String op=request.getParameter("operator");
if( val1==null || val2==null || op==null) return;
int v1=Integer.parseInt(val1);
int v2=Integer.parseInt(val2);
//연산부
int result=0;
if(op.equals("+")){
	result=v1+v2;
} else if(op.equals("-")){
	result=v1-v2;
} else if(op.equals("*")){
	result=v1*v2;
} else if(op.equals("/")){
	result=v1/v2;
} else return;
//out.println("calue1:"+v1+"<br>value2:"+v2+
	//	"<br>operator:"+op+"<br>Result:"+result);
// out.println 으로 짜도 되지만 
// 아래 방법처럼 body(html)부분에 직접 넣을 수도 있음
%>
value1:<%=v1 %><br>
value2:<%=v2 %><br>
operator:<%=op %><br>
Result:<%=result %>
</body>
</html>