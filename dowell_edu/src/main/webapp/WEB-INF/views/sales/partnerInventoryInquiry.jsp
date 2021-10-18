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
<%-- 위에 이거 선언해있어서 아래에서 <% String countNo = request.getParameter("countNo"); %>
 <%=countNo%>이런식으로 쓰면된다.  --%>
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
		var prd_cd= $("#prd_cd").val();
		
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
			        		 tbodyHtml += ' <tr style="display:none;">';
			        		 tbodyHtml += '<td class="tg-0lax"><input type="checkbox" disabled name="prdCheck" id="prdCheck" value="'+ data.list[i].prd_cd+'" onclick="checkOnly(this)"></td>';
			        		 tbodyHtml += '<td class="tg-0lax">' + data.list[i].prd_cd + '<input type="hidden" id="prd_tp_cd" value="' + data.list[i].prd_tp_cd + '"></td>';
			        		 tbodyHtml += '<td class="tg-0lax">' + data.list[i].prd_nm + '<input type="hidden" id="tax_cs_cd" value="' + data.list[i].tax_cs_cd + '"></td>';
			        		 tbodyHtml += '<td class="tg-0lax">' + data.list[i].ivco_qty + '<input type="hidden" id="prd_ss_cd" value="' + data.list[i].prd_ss_cd + '"></td>';
			        		 tbodyHtml += '<td class="tg-0lax">' + data.list[i].prd_csmr_upr + '</td>';
			        		 tbodyHtml += '</tr>';
		        	 	}
		        		 if(data.list[i].ivco_qty == '0' || data.list[i].prd_csmr_upr == '0'){
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

				  //체크된 row의 모든 값을 배열에 담는다
				  rowData.push(tr.text());
				  rowData.push(prd_tp_cd);
				  rowData.push(prd_ss_cd);

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
			
			  <!-- 고객판매수금등록 팝업창으로 정보 보내기 -->
			  //고객판매수금등록의 table 길이
				var totalRowCnt  = opener.$('#salTable > tbody tr').length;

			  	//현재 클릭  
				var prd_cd_l = '';
			  	
			    //1번부터 i번까지 검사할   
			    var prd_cd_j = '';
			    
			    //중복된게 있을때
			    for(var j = 1; j <= totalRowCnt; j++){

		    	  //검사할 val ->1번부터 시작
		    	  prd_cd_j = opener.$("#prd_cd" + j).val();
		    	  //현재 클릭이 검사할꺼랑 다를때
	    		  if(countNo != j){
	    			  //쿨릭이랑 검사한게 같고, 상품명이 공백이 아닐때 -> alert 하고 리턴
	    			  if((tdArr[0] == prd_cd_j) && !(opener.$("#prd_nm" + j).val() == "")){
	    				  alert('중복된 정보입니다!');
			    		  return;
	    		  	  }
	    	 	   }
			     }
		    	   //중복된 정보가 없을때
		   		  opener.document.getElementById("prd_cd"+countNo).value = tdArr[0];
				  opener.document.getElementById("prd_nm"+countNo).value = tdArr[1];
				  opener.document.getElementById("ivco_qty" + countNo).value = tdArr[2];
			 	  opener.document.getElementById("prd_csmr_upr" + countNo).value = tdArr[3];			    	   
			  window.close()
		   	}
	   	}
		   
</script>
</html>