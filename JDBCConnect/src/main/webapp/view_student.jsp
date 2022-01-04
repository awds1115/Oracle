<%@ page import="java.sql.DriverManager" %>
<%@ page import="java.sql.ResultSet" %>
<%@ page import="java.sql.Statement" %>
<%@ page import="java.sql.Connection" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%!
  Connection conn=null;
  Statement stmt=null;
  ResultSet rs=null;
  
  String url="jdbc:oracle:thin:@localhost:1521:orcl";
  //1521 DB서버로 접속 이 url이 무조건 있어야함 **
  String userid="ora_user";
  String passcode="human123";
  String sql="select * from student";
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Employees</title>
</head>
<body>
<style>
table { border-collapse:collapse}
td,th {border:1px solid black;
	background-color:gold;
	font-family:궁서체;
	color:red;
}

</style>
<table>
<tr><th>이름</th><th>수학</th><th>국어</th></tr>
<%
try {
	 Class.forName("oracle.jdbc.driver.OracleDriver"); // driver (ojdbc6.jar)
	 conn=DriverManager.getConnection(url,userid,passcode); // db접속에 실패하면 null이 나옴
	 stmt=conn.createStatement();  // sql문을 넣을 곳을 만들어라.
	 rs=stmt.executeQuery(sql);    // sql문 실행 결과를 2차원 배열로 rs에 저장한다. 
	 while(rs.next()){

	String name=rs.getString("name");
	int math=rs.getInt("math");
	int korean=rs.getInt("korean");
	%>
	<tr><td><%=name %></td><td><%=math %></td><td><%=korean %></td></tr>
	<%	 
	 }
} catch(Exception e){
	e.printStackTrace();
} finally {
	if(rs!=null) rs.close();
	if(stmt!=null) stmt.close();
	if(conn!=null) conn.close();
}
%>
</table>
</body>
</html>