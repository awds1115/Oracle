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
  String sql="select a.department_id as did, a.department_name as dname, nvl(b.emp_name,'-') as mname, nvl(c.department_name,'-') as dname2 "+
		  "from departments a, employees b, departments c "+
		  "where a.manager_id=b.employee_id(+) and c.department_id(+)=a.parent_id order by a.department_id";
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
<!-- <tr><th>사번</th><th>직원명</th><th>월급</th><th>매니저사번</th><th>부서아이디</th><th>직위아이디</th></tr> -->
<!-- <tr><th>부서아이디</th><th>부서명</th><th>매니저아이디</th></tr> -->
<tr><th>부서아이디</th><th>부서명</th><th>매니저아이디</th><th>상위부서명</th></tr>
<%
try {
	 Class.forName("oracle.jdbc.driver.OracleDriver"); // driver (ojdbc6.jar)
	 conn=DriverManager.getConnection(url,userid,passcode); // db접속에 실패하면 null이 나옴
	 stmt=conn.createStatement();  // sql문을 넣을 곳을 만들어라.
	 rs=stmt.executeQuery(sql);    // sql문 실행 결과를 2차원 배열로 rs에 저장한다. 
	 while(rs.next()){
// 		 out.println("<tr>");
// 		 int eid=rs.getInt("employee_id");   // employee_id 는 스키마가 number이므로 getInt를 사용
// 		 String ename=rs.getString("emp_name");
// 		 int salary=rs.getInt("salary");
// 		 int mid=rs.getInt("manager_id");
// 		 int did=rs.getInt("department_id");
// 		 String jobid=rs.getString("job_id");
// 		 out.println("<td>"+eid+"</td>"+"<td>"+ename+"</td>"+"<td>"+salary+"</td>"+"<td>"+mid+
// 				     "</td>"+"<td>"+did+"<td>"+jobid+"</td>");
// 		 out.println("</tr>");
	int did=rs.getInt("did");
	String dname=rs.getString("dname");
	String mname=rs.getString("mname");
	String dname2=rs.getString("dname2");
	%>
	<tr><td><%=did %></td><td><%=dname %></td><td><%=mname %></td><td><%=dname2 %></td></tr>
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