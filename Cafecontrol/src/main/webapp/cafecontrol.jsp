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
                        <td>메뉴코드</td>
                        <td><input type=text id=menucode readonly></td>
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
                        <td align="right" colspan=2>
                        <button id=btnSum >Summary</button>
           			    </td>
                   </tr>
                    <tr>
                        <td>
                            <select id=selSales size=16></select>
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
    <div id=dlgMenu title=메뉴 관리 >
       <table>
        <tr>
            <td>
                <select id=selMenu1 size=10></select>
            </td>
            <td>
                <table>
                <tr>
                    <td>메뉴코드</td><td><input type=text id=_menucode></td>
                </tr>
                <tr>
                    <td>메뉴명</td><td><input type=text id=_menuname></td>
                </tr>
                <tr>
                    <td>단가(가격)</td><td><input type=number id=_price step=100 min=100 width=50px>원</td>
                </tr>
                <tr>
                    <td  colspan=2 align=center>
                        <button id=btnGo>작성완료</button>&nbsp;
                        <button id=reset>비우기</button>&nbsp;
                    </td>
                </tr>
                </table>
            </td>
        </tr>    
        </table>
    
    </div>
    <div id=dlgSales title=판매 실적 >
     <table>
        <tr>
            <td>
                <select id=selSales1 size=15></select>
            </td>
            <td>
            <table>
            <tr>
               <td>
            		<select id=selSales2 size=15></select>
               </td>
            </tr>
            </table>
              </td>
      </tr>    
   </table>
</div>
</body>
<script src='https://code.jquery.com/jquery-3.5.0.js'></script>
<script src='https://code.jquery.com/ui/1.13.0/jquery-ui.js'></script>
<script>
let total=0;
let toMenu=[];
$(document)
.ready(function(){
	loadMenu();
	return false;
})
.on('click','#selMenu',function(){
    c_m=$('#selMenu option:selected').text();
    ar=c_m.split(' ');
   $('#menucode').val(ar[0]);
   $('#menuname').val(ar[1]);
   $('#price').val(ar[2]);
   $('#count').val(1)
})
.on('change','#count',function(){
    pc=$('#selMenu option:selected').text();
     ar=pc.split(' ');
     parseInt(ar[2]);
    $('#price').val(ar[2]*$('#count').val());
})
.on('click','#btnReset',function(){
    $('#menucode,#menuname,#count,#price').val('');
})
.on('click','#btnAdd',function(){
    total=0; 
    P=parseInt($('#price').val());
    toMenu.push(P);
    strOrder='<option>'+$('#menucode').val()+'  '+$('#menuname').val()+'  '+' x'+$('#count').val()+'  '+P+'</option>';
    $('#selOrder').append(strOrder);
    
    for(i=0;i<toMenu.length;i++){
        total+=toMenu[i];
    }
    $('#total').val(total);
    $('#menucode,#menuname,#count,#price').val('');
})
.on('click','#btnCancel',function(){
    $('#selOrder').text('');
    toMenu=[];
    $('#total').val('');
})
.on('click','#btnDone',function(){
	$('#selOrder option').each(function(){
		if($('#mobile').val()=="") $('#mobile').val('-');
		sal='<option>'+$('#mobile').val()+"  "+$(this).text()+"</option>";
		$('#selSales').append(sal);	
		tosal=[];
		tosal=$(this).text().split("  ");
		tosal2=tosal[2].replace(' x','');
// 		alert(tosal[0]+","+tosal[1]+","+tosal2+","+tosal[3]);
		// 메뉴코드,메뉴네임,수량,가격
		$.get('Sales_insert',{mobile:$('#mobile').val(),
			  				menu_code:tosal[0],
			  				qty:tosal2,
			  				total:tosal[3]},function(txt){},'text')
	})
	total=0; 
	toMenu=[];
	$('#selOrder').text('');
	$('#total,#mobile').val('');
})
.on('click','#clean',function(){
    $('#selSales').empty();
})
.on('click','#btnMenu',function(){
    $('#dlgMenu').dialog({
        width: 700,
        open:function(){
            loadMenu1();    
       },
        close:function(){
         	loadMenu();
            }
        })
    })
.on('click','#selMenu1',function(){
    let str=$('#selMenu1 option:selected').text();
    ar1=str.split(' ');
    $('#_menuname').val(ar1[1]);
    $('#_price').val(ar1[2]);
})
.on('click','#btnGo',function(){
	let operation="";
	if($('#_menucode').val()==''){
		if($('#_menuname').val()!='' && $('#_price').val()!=''){
			operation="insert";
		} else{
			alert('메뉴명 또는 가격이 채워지지 않았습니다.');
			return false;
		}
	}else{
		if($('#_menuname').val()!='' && $('#_price').val()!=''){
			operation="update";
		} else{
			operation="delete";
		}
	}
	$.get(operation,{code:$('#_menucode').val(),name:$('#_menuname').val(),price:$('#_price').val()},function(){
		loadMenu1();
		$('#_menucode,#_menuname,#_price').val('');
		},'text');
		return false;
})
.on('click','#btnSum',function(){

    $('#dlgSales').dialog({
        width: 700,
        open:function(){
        	loadSales();
            },
        close:function(){
         	
            }
        })
    })
function loadMenu(){
	 $('#selMenu').empty();
$.get('select',{},function(txt){
		let rec=txt.split(';');
		for(i=0; i<rec.length; i++){
			let field=rec[i].split(',');
			let html='<option>'+field[0]+' '+field[1]+' '+field[2]+'</option>';
			 $('#selMenu').append(html);
		}
	},'text');
	return false;
}
function loadMenu1(){
	$('#selMenu1').empty();
	$.get('select',{},function(txt){
			let rec=txt.split(';');
			for(i=0; i<rec.length; i++){
				let field=rec[i].split(',');
				let html='<option>'+field[0]+' '+field[1]+' '+field[2]+'</option>';
				 $('#selMenu1').append(html);
			}
		},'text');
		return false;
	}
function loadSales(){
	$('#selSales1').empty();
    $.get('Sales_select1',{},function(txt){
		let rec=txt.split(';');
		for(i=0; i<rec.length; i++){
			let field=rec[i].split(',');
			let html='<option>'+field[0]+' '+'x'+field[1]+' '+field[2]+'</option>';
			 $('#selSales1').append(html);
		}
	},'text');
	return false;
}
function loadSales1(){
	$('#selSales2').empty();
    $.get('Sales_select2',{},function(txt){
		let rec=txt.split(';');
		for(i=0; i<rec.length; i++){
			let field=rec[i].split(',');
			let html='<option>'+field[0]+' '+field[1]+' '+field[2]+'</option>';
			 $('#selSales2').append(html);
		}
	},'text');
	return false;
}
</script>
</html>