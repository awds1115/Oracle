<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.DriverManager" %>
<%@ page import="java.sql.PreparedStatement" %>
<%@ page import="java.sql.Connection" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>카페관리</title>
</head>
<link rel="stylesheet" href="https://code.jquery.com/ui/1.13.0/themes/base/jquery-ui.css">
<link rel='stylesheet' type='text/css' href='Control.css'>
<body>
<table align=center>
        <tr>
            <td valign=top>
                <table class=bound>
                    <caption id=capt1 align=left>메뉴목록</caption>
                    <tr>
                        <td align="right" colspan=2>
                        <button id=btnMenu >메뉴관리</button>
           			    </td>
                   </tr>
                    <tr>
                        <td colspan=2>
                            <select id=selMenu size=12 ></select>
                        </td>

                    </tr>

                    <tr>
                        <td>메뉴명</td>
                        <td><input type=text id=menuname readonly></td>
                    </tr>
                    <tr>
                        <td>수량</td>
                        <td><input type=number id=count min=1></td>
                    </tr>
                    <tr>
                        <td>금액</td>
                        <td><input type=number id=price readonly></td>
                    </tr>
                    <tr>
                        <td><button id=btnReset>지우기</button></td>
                        <td align=right><button id=btnAdd>메뉴추가</button></td>
                    </tr>
                </table>
            </td>
            <td valign=top>
                <table class=bound>
                    <caption id=capt1>주문목록</caption>
                    <tr>
                        <td colspan=2>
                            <select id=selOrder size=10></select>
                        </td>
                    </tr>
                    <tr>
                        <td>총액</td>
                        <td><input type=number id=total></td>
                    </tr>
                    <tr>
                        <td>모바일</td>
                        <td><input type=phone id=mobile size=10></td>
                    </tr>
                    <tr>
                        <td colspan=2>&nbsp;</td>
                    </tr>
                    <tr>
                        <td><button id=btnCancel>주문취소</button></td>
                        <td align=right><button id=btnDone>주문완료</button></td>
                    </tr>
                </table>
            </td>
            <td valign=top>
                <table class=bound >
                    <caption id=capt1>판매내역</caption>
                    <tr>
                        <td>
                            <select id=selSales size=10></select>
                        </td>
                    </tr>
                    <tr>
                        <td>
                            <button id=clean>초기화</button>
                        </td>
                    </tr>
                </table>
            </td>
        </tr>
    </table>
<!--     <div id=dlgMenu title=메뉴 관리 > -->
<!--        <table> -->
<!--         <tr> -->
<!--             <td> -->
<!--                 <select id=selMenu1 size=10></select> -->
<!--             </td> -->
<!--             <td> -->
<!--                 <table> -->
<!--                 <tr> -->
<!--                     <td>메뉴명</td><td><input type=text id=_menuname></td> -->
<!--                 </tr> -->
<!--                 <tr> -->
<!--                     <td>단가(가격)</td><td><input type=number id=_price step=100 min=100>원</td> -->
<!--                 </tr> -->
<!--                 <tr> -->
<!--                     <td  colspan=2 align=center> -->
<!--                         <button id=btnPlus>추가</button>&nbsp; -->
<!--                         <button id=btnMinus>삭제</button>&nbsp; -->
<!--                         <button id=btnUpdate>변경</button>&nbsp; -->
<!--                     </td> -->
<!--                 </tr> -->
<!--                 </table> -->
<!--             </td> -->
<!--         </tr>     -->
<!--         </table> -->
    
<!--     </div> -->
</body>
<script src='https://code.jquery.com/jquery-3.5.0.js'></script>
<script src='https://code.jquery.com/ui/1.13.0/jquery-ui.js'></script>
<script>
$(document)
.ready(function(){
	loadMenu();
	return false;
})
.on('click','#selMenu',function(){
    c_m=$('#selMenu option:selected').text();
    ar=c_m.split(' ');
   $('#menuname').val(ar[0]);
   $('#price').val(ar[1]);
   $('#count').val(1)
})
.on('change','#count',function(){
    pc=$('#selMenu option:selected').text();
     ar=pc.split(' ');
     parseInt(ar[1]);
    $('#price').val(ar[1]*$('#count').val());
})
.on('click','#btnReset',function(){
    $('#menuname,#count,#price').val('');
})
// .on('click','#btnAdd',function(){
//     total=0;
//     M=$('#menuname').val();
//     C=$('#count').val();
//     P=$('#price').val();
//     P=Integer.parseInt(P);
//     toMenu.push(P)
//     strOrder='<option>'+M+'  '+' x'+C+'  '+P+'</option>';
//     $('#selOrder').append(strOrder)
    
//     for(i=0;i<toMenu.length;i++){
//         total+=toMenu[i];
//     }
//     $('#total').val(total);
// })
function loadMenu(){
	$('#selMenu').empty();
$.get('select',{},function(txt){
		alert(txt);
		let rec=txt.split(';');
		for(i=0; i<rec.length; i++){
			let field=rec[i].split(',');
			let html='<option value='+field[0]+'>'+field[0]+' '+field[1]+'</option>';
					 $('#selMenu').append(html);
		}
	},'text');
	return false;
}

</script>
</html>