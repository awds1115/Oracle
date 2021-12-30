<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%! int global_cnt=0; %>
    <%@ page session="true" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>jsp 선언부</title>
</head>
<body>
<%
int local_cnt=0;

out.print("<br>local_cnt : ");
out.print(++local_cnt);  // body부분에서 변수선언을 했으므로 홈페이지를 실행할때마다
                         //  변수 선언값이 적용되어 계속 1로 변한다.

out.print("<br>global_cnt : ");
out.print(++global_cnt); // 선언부의 변수선언은 홈페이지 실행시 한번만 적용되므로 
                         //++ 로 값을 올리면 새로고침 할때마다 값이 계속 오른다.
%>
</body>
</html>