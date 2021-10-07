<%@page import="com.dowell.edu.vo.member.MemberVO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<% String countNo = request.getParameter("countNo"); %>
<%
 //Object obj = session.getAttribute("LOGIN");
MemberVO member = (MemberVO)session.getAttribute("member"); //session에 있는 정보를 받아온다.
 
 if(member == null){
  System.out.println("로그인 안한 사용자");
 }else{
  System.out.println("로그인한 사용자");
 }
%>  
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>매장재고조회팝업</title>
<link rel="icon" href="data:;base64,iVBORw0KGgo=">
<script src="https://kit.fontawesome.com/108adcc263.js" crossorigin="anonymous"></script>
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/partnerInventoryInquiry.css" />
<link rel="shortcut icon" href="/favicon.ico" type="image/x-icon">
<link rel="icon" href="/favicon.ico" type="image/x-icon">
<script type="text/javascript" src="http://code.jquery.com/jquery-latest.js"></script>
</head>
<body>
<h2 style="margin-left: 21px;">매장재고조회</h2>
        <section>
            <div class="container">
                <div style="float: left; margin-left: 5%;">
                    <table class="th">
						<tbody>
						  <tr>
						    <td class="th-0lax">매장</td>
						    <td class="th-0lax">
						    	<input type="text"  id="prt_nm" value="${member.prt_nm}" readonly onkeypress="show_enter(event)">
						    	<input type="hidden" name="prt_cd" id="prt_cd" value="${member.prt_cd}">
						    </td>
						  </tr>
						  <tr>
						    <td class="th-0lax">상품(코드+명)</td>
						    <td class="th-0lax">
						    	<input type="text" name="prd_cd" id="prd_cd" value="" onkeypress="show_enter(event)">
						    </td>
						  </tr>
						</tbody>
					</table>
					<div id="searchBtnDiv">
		                <button id="searchBtn" value="" onclick="partnerInventorySearch()">
		                	<i class="fas fa-search fa-2x"></i>
		                </button>
                	</div>
                </div>
            </div>
            <div style="margin-left: 25px; margin-top: 15px; height: 359px; overflow:auto;">
                <table class="tg" style="width: 100%;">
	                <thead>
	                    <tr>
		                    <th class="tg-0lax">선택</th>
		                    <th class="tg-0lax">상품코드</th>
		                    <th class="tg-0lax">상품명</th>
		                    <th class="tg-0lax">재고수량</th>
		                    <th class="tg-0lax">소비자가</th>
	                    </tr>
	                </thead>
	                <tbody id="searchTbody">
	                </tbody>
                </table>
            </div>
            
        </section>
        <footer>
        	<div class="closeDev">
	            <input type="button" class="closeBtn" value="닫기" onclick="window.close()">
	            <input type="button" class="submitBtn" value="적용" onclick="goSalesRegisText()">
       	 	</div>
        </footer>

    </body>
<script>
	
	
/* console.log('${countNo}');
var y = ${countNo};
console.log(y); */
function getParameter(name) {
    name = name.replace(/[\[]/, "\\[").replace(/[\]]/, "\\]");
    var regex = new RegExp("[\\?&]" + name + "=([^&#]*)"),
        results = regex.exec(location.search);
    return results === null ? "" : decodeURIComponent(results[1].replace(/\+/g, " "));
}

var countNo = getParameter("countNo");

<%-- 위에 이거 선언해있어서 아래에서
 <% String countNo = request.getParameter("countNo"); %>
 <%=countNo%>이런식으로 쓰면된다. 
 https://bumcrush.tistory.com/122
 --%>


	//엔터이벤트 -  작성 후 엔터 누르면 custSearch()작동
	 function show_enter(e){
		 var prt_nm = document.getElementById("prd_cd").value;
		 var prt_nm = document.getElementById("prt_cd").value;
	       
	       if(e.keyCode == 13){
	    	   partnerInventorySearch();
	       }
	    }
	
	
	 function partnerInventorySearch(){
	
		var prt_cd = $("#prt_cd").val();
		//prd_cd
		var prd_cd= $("#prd_cd").val();
		
		console.log(prt_cd);
		console.log(prd_cd);
		$.ajax({
			url: "<c:url value='/sales/partnerInvenInqList'/>",
			 type: 'POST',
			 dataType: "json",
	         data : {
	        	"prt_cd" : prt_cd,
	        	"prd_cd" : prd_cd
	        	
	         },
	         success : function(data){
	        	var tbody = $('#searchTbody');
				tbody.empty();
					
				var tbodyHtml = '';
				 if (data.list.length == 0) {
				
				 }else{
		        	 for(var i =0; i < data.list.length; i++){
		        		
		        		 if(data.list[i].prd_ss_cd == 'C'){
			        		 tbodyHtml += ' <tr style="background-color: yellow;">';
			        		 tbodyHtml += '<td class="tg-0lax"><input type="checkbox" disabled name="prdCheck" id="prdCheck" value="'+ data.list[i].prd_cd+'" onclick="checkOnly(this)"></td>';
			        		 tbodyHtml += '<td class="tg-0lax">' + data.list[i].prd_cd + '<input type="hidden" id="prd_tp_cd" value="' + data.list[i].prd_tp_cd + '"></td>';
			        		 tbodyHtml += '<td class="tg-0lax">' + data.list[i].prd_nm + '<input type="hidden" id="tax_cs_cd" value="' + data.list[i].tax_cs_cd + '"></td>';
			        		 tbodyHtml += '<td class="tg-0lax">' + data.list[i].ivco_qty + '<input type="hidden" id="prd_ss_cd" value="' + data.list[i].prd_ss_cd + '"></td>';
			        		 tbodyHtml += '<td class="tg-0lax">' + data.list[i].prd_csmr_upr + '</td>';
			        		 tbodyHtml += '</tr>';
		        	 	}
		        		 if( data.list[i].prd_tp_cd == '20' ){
			        		 tbodyHtml += ' <trstyle="display:none;">';
			        		 tbodyHtml += '<td class="tg-0lax"><input type="checkbox" disabled name="prdCheck" id="prdCheck" value="'+ data.list[i].prd_cd+'" onclick="checkOnly(this)"></td>';
			        		 tbodyHtml += '<td class="tg-0lax">' + data.list[i].prd_cd + '<input type="hidden" id="prd_tp_cd" value="' + data.list[i].prd_tp_cd + '"></td>';
			        		 tbodyHtml += '<td class="tg-0lax">' + data.list[i].prd_nm + '<input type="hidden" id="tax_cs_cd" value="' + data.list[i].tax_cs_cd + '"></td>';
			        		 tbodyHtml += '<td class="tg-0lax">' + data.list[i].ivco_qty + '<input type="hidden" id="prd_ss_cd" value="' + data.list[i].prd_ss_cd + '"></td>';
			        		 tbodyHtml += '<td class="tg-0lax">' + data.list[i].prd_csmr_upr + '</td>';
			        		 tbodyHtml += '</tr>';
		        	 	}
		        		 if(data.list[i].ivco_qty == '0'){
			        		 tbodyHtml += ' <tr>';
			        		 tbodyHtml += '<td class="tg-0lax"><input type="checkbox" disabled name="prdCheck" id="prdCheck" value="'+ data.list[i].prd_cd+'" onclick="checkOnly(this)"></td>';
			        		 tbodyHtml += '<td class="tg-0lax">' + data.list[i].prd_cd + '<input type="hidden" id="prd_tp_cd" value="' + data.list[i].prd_tp_cd + '"></td>';
			        		 tbodyHtml += '<td class="tg-0lax">' + data.list[i].prd_nm + '<input type="hidden" id="tax_cs_cd" value="' + data.list[i].tax_cs_cd + '"></td>';
			        		 tbodyHtml += '<td class="tg-0lax">' + data.list[i].ivco_qty + '<input type="hidden" id="prd_ss_cd" value="' + data.list[i].prd_ss_cd + '"></td>';
			        		 tbodyHtml += '<td class="tg-0lax">' + data.list[i].prd_csmr_upr + '</td>';
			        		 tbodyHtml += '</tr>';
		        	 	} 
		        		
		        	 	else if (!(data.list[i].prd_ss_cd == 'C' || data.list[i].prd_tp_cd == '20' ||data.list[i].ivco_qty == '0')){
		        	 		 tbodyHtml += ' <tr>';
			        		 tbodyHtml += '<td class="tg-0lax"><input type="checkbox" name="prdCheck" id="prdCheck" value="'+ data.list[i].prd_cd+'" onclick="checkOnly(this)"></td>';
			        		 tbodyHtml += '<td class="tg-0lax">' + data.list[i].prd_cd + '<input type="hidden" id="prd_tp_cd" value="' + data.list[i].prd_tp_cd + '"></td>';
			        		 tbodyHtml += '<td class="tg-0lax">' + data.list[i].prd_nm + '<input type="hidden" id="tax_cs_cd" value="' + data.list[i].tax_cs_cd + '"></td>';
			        		 tbodyHtml += '<td class="tg-0lax">' + data.list[i].ivco_qty + '<input type="hidden" id="prd_ss_cd" value="' + data.list[i].prd_ss_cd + '"></td>';
			        		 tbodyHtml += '<td class="tg-0lax">' + data.list[i].prd_csmr_upr + '</td>';
			        		 tbodyHtml += '</tr>';
		        	 	} 
		        	 }
				 }
	        	 tbody.append(tbodyHtml);
	        	
	         },
	         
	         error(xhr, status, err){
	   			  	console.log(xhr, status, err);
		       }
			
			});
		};
		
		//체크박스 체크 하나만 되도록
		function checkOnly(target){
	
		   document.querySelectorAll(`input[type=checkbox]`).forEach(el => el.checked = false);
		   target.checked = true;
		   
		   
		}
		$('#hide').attr('style', "display:none;");

	   <!-- 전달하기 버튼-->
	   function goSalesRegisText(){
		   var i = 0;
		   ++i;
		 
		   if($("input:checkbox[id=prdCheck]").is(":checked") == false){
				  alert("상품을 선택해주세요");
				  return false;
			}
		   
		
		   
			else{
			  var rowData = new Array();
			  var tdArr = new Array();
			  var checkbox = $("input:checkbox[id=prdCheck]:checked");
			  
			  //체크된 체크박스 값을 가져온다
			  checkbox.each(function(i){
				
				  //checkvbox.parent() : checkbox의 부모 td
				  var tr = checkbox.parent().parent().eq(i);
				  //checkbox.parent().parent() : td의 부모 tr
				  var td = tr.children();
				  var prd_tp_cd = tr.children().children("#prd_tp_cd").val();
				  var prd_ss_cd = tr.children().children("#prd_ss_cd").val();
				  console.log(prd_tp_cd);
				  console.log(prd_ss_cd);
				  //체크된 row의 모든 값을 배열에 담는다
				  rowData.push(tr.text());
				  rowData.push(prd_tp_cd);
				  rowData.push(prd_ss_cd);
				  console.log(rowData);
				  //td.eq(0)은 체크박스이므로 rd.eq(1)의 값부터 가져온다.
				  var prdCd = td.eq(1).text();
				  var prdNm = td.eq(2).text();
				  var ivcoQty = td.eq(3).text();
				  var prdCsmrUpr = td.eq(4).text();
				  
				 
				  //가저온 값을 배열에 넣는다.
				  tdArr.push(prdCd);
				  tdArr.push(prdNm);
				  tdArr.push(ivcoQty);
				  tdArr.push(prdCsmrUpr);
				  
				 
	
			  })
			  //console.log("느아아아아ㅏㅇ + " + rowData[1]);
			  //prd_tp_cd상품유형코드 20: 견본품은 판매x
			 /*  if(rowData[1] == '20'){
				  alert("해당 상품은 구매하실 수 없습니다.(견본품)");
				  return false;
			  }
			  if(rowData[2] == 'C'){
				  alert("해당 상품은 구매하실 수 없습니다.(해지)");
				  return false;
			  }
			  if(tdArr[2]  == '0'){
				  alert("해당 상품은 구매하실 수 없습니다.(재고부족)");
				  return false;
			  }  */
			  //prd_ss_cd 상품상태코드 C: 해지 판매x
				  //자식창의 체크값의 배열중 0, 1번째를 부모창으로 보낸다.
			   		opener.document.getElementById("prd_cd"+countNo).value = tdArr[0]
				  opener.document.getElementById("prd_nm"+countNo).value = tdArr[1]
				  opener.document.getElementById("ivco_qty" + countNo).value = tdArr[2] 
			  
				  /* for(int i= 0; i <=10; i++ ){
					  opener.document.getElementById("prd_cd").value = tdArr[0]
					  opener.document.getElementById("prd_nm").value = tdArr[1]
					  opener.document.getElementById("ivco_qty").value = tdArr[2]
					  
				  } */
				  
				  
			  /* console.log(tdArr[1]);
			  console.log(tdArr[0]);
			  console.log(tdArr[2]); */
			  //window.close()
		   	}
	   	}
		   
</script>
</html>