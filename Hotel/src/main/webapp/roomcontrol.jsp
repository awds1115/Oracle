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
  String userid="ora_user";
  String passcode="human123";
  String sql="select roomcode,name,type,howmany,howmuch from room order by roomcode";
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
<thead>
	<tr><th>객실코드</th><th>객실명</th><th>객실타입</th><th>숙박가능인원</th><th>숙박비</th></tr>
</thead>
<tbody>
<%
try {
	 Class.forName("oracle.jdbc.driver.OracleDriver");
	 conn=DriverManager.getConnection(url,userid,passcode); 
	 stmt=conn.createStatement();  
	 rs=stmt.executeQuery(sql);    
	 while(rs.next()){
	int code=rs.getInt("roomcode");
	String name=rs.getString("name");
	int type=rs.getInt("type");
	int many=rs.getInt("howmany");
	int much=rs.getInt("howmuch");
	out.println("<tr><td>"+code+"</td><td>"+name+"</td><td>"+type+"</td><td>"+many+"</td><td>"+much+"</td></tr>");
	
	 }
} catch(Exception e){
	e.printStackTrace();
} finally {
	if(rs!=null) rs.close();
	if(stmt!=null) stmt.close();
	if(conn!=null) conn.close();
}
%>
</tbody>
</table><br><br><br>
<form method="GET" action="" id=frmRoom>
<table>
<tr>
	<td>객실코드:<input type=number id=code name=code></td>
</tr>
<tr>
	<td>객실명:<input type=text id=name name=name></td>
</tr>
<tr>
	<td>객실타입:<input type=number id=type name=type></td>
</tr>
<tr>
	<td>숙박가능인원:<input type=number id=many name=many></td>
</tr>
<tr>
	<td>숙박비:<input type=number id=much name=much></td>
</tr>
<tr>
	<td><input type=submit value='전송'>&nbsp;<input type=reset value='비우기'></td>
</tr>
</table>
</form>
</body>
<script src='https://code.jquery.com/jquery-3.5.0.js'></script>
<script>
$(document)
.on('submit','#frmRoom',function(){
	if($('#code').val()!=''){  
		if($('#name').val()!=''){  // room_update
			$('#frmRoom').prop('action','room_update.jsp');
		} else { //room_delete
			$('#frmRoom').prop('action','room_delete.jsp');
		}
	} else {   //room_add
		if($('#name').val()!='' && $('#type').val()!='' &&
		   $('#many').val()!='' && $('#much').val()!=''){ 
			$('#frmRoom').prop('action','room_add.jsp');
		} else {
			alert('입력되지 않은 란이 있습니다.')
			return false;
		}
	}
	return true;
})







</script>
</html>