<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원가입</title>
</head>
<style>
table{
	border-collapse:collapse;
	background-color: yellow;
}
td{
	border:1px solid blue;
}

</style>
<form method=POST action=validate.jsp>
<body align=center>
    <table align=center>
        <tr>
            <td align=right>실명</td>
            <td><input type=text id=realname name=realname size=20></td>
            <td>성별</td>
            <td><input type=radio id=male name=gender value=male>남성
                <input type=radio id=female name=gender value=female>여성</td>
        </tr>

        <tr>
            <td align=right>아이디</td>
            <td><input type=text id=userid name=userid size=20></td>
        </tr>   
        <tr>
            <td align=right>비밀번호</td>
            <td><input type=password id=passcode1 name=passcode1></td>
            <td align=right>비밀번호 확인</td>
            <td><input type=password id=passcode2 name=passcode2></td>
        </tr>
        <tr>
            <td align=right>모바일 번호</td>
            <td><input type=number id=mobile name=mobile size=20></td>
        </tr>

        <tr>
            <td align=right>관심분야</td>
            <td align=left>
                <input type=checkbox name=interest value="정치">정치&nbsp;
                <input type=checkbox name=interest value="경제">경제&nbsp;
                <input type=checkbox name=interest value="사회">사회&nbsp;
                <input type=checkbox name=interest value="문화">문화&nbsp;<br>
                <input type=checkbox name=interest value="역사">역사&nbsp;
                <input type=checkbox name=interest value="연예">연예&nbsp;
                <input type=checkbox name=interest value="스포츠">스포츠&nbsp;
                <input type=checkbox name=interest value="예술">예술&nbsp;<br>
            </td>
        </tr>
        <tr>
            <td colspan=2>
                <input type=submit value='가입완료'>&nbsp;
                <input type=button id=btncancel value='취소'>
            </td>
        </tr>
    </table>
    </form>
</body>
<script src="https://code.jquery.com/jquery-3.5.0.js"></script>
<script>
$(document)
.on('submit',function(){

	//if($('#passcode2').val()=='') {
		// #passcode2 로 id 를 찾아 조건을 달아도 되고
		// input[name=passcode2] 로 name을 찾아 조건을 달아도 된다.
		if($('input[name=passcode2]').val()==''){
		alert('false');
		return false;   // submit 취소
	} else {
		alert('true');
		return true;    // submit 진행 
	}
})
		// 유효성검사(validation)결과가 허용범위이면 return true -> submit 계속 진행(서버쪽에 전달)
		// 허용안되는 값이 있으면 return false -> submit 중단(서버쪽으로 전달을 차단)
.on('click','#btncancel',function(){
	document.location='login.jsp';
	})

	
	
	
	
	
	

</script>
</html>