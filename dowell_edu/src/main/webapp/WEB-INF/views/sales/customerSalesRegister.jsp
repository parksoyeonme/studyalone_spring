<%@page import="com.dowell.edu.vo.member.MemberVO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
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
<title>고객조회</title>
<link rel="icon" href="data:;base64,iVBORw0KGgo=">
<script src="https://kit.fontawesome.com/108adcc263.js" crossorigin="anonymous"></script>
<script type="text/javascript" src="http://code.jquery.com/jquery-latest.js"></script>
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/customerSalesRegister.css" />
<!--달력 jquery-->
<script src="https://code.jquery.com/jquery-1.12.4.js"></script>
<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
<link rel="stylesheet" href="http://code.jquery.com/ui/1.8.18/themes/base/jquery-ui.css">
</head>
<body>
    <section>
        <div class="container" id="container">
            <span class="mainTitle">고객판매수금등록</span>
            <button type="button" id="btn_reset" onclick="refreshPage()">
                <i class="fas fa-redo fa-1x"></i>
            </button>
        <div class="firtBox">
            <table class="th" style="margin-top: 3px;">
                <tr>
                    <td class="th-0lax required">판매일자</td>
                    <td class="th-0lax">
                    	<input type="date" id="sal_dt" readonly>
                    	<input type="hidden" name="prt_cd" id="prt_cd" value="${member.prt_cd}">
                    </td>
                    <td class="th-0lax required">판매구분</td>
                    <td class="th-0lax">
                        <select id="" name="" style="width: 159px;"> 
                            <option value="" disabled selected >전체</option> 
                            <option value="${CommonCd[5].dtl_cd}">${CommonCd[5].dtl_cd_nm}</option>
                            <option disabled value="${CommonCd[4].dtl_cd}">${CommonCd[4].dtl_cd_nm}</option>
                        </select>
                    </td>
                    <td class="th-0lax">
                    <c:if test="${member != null}">
                        <button type="button" id="allSearchBtn" onclick="custSearchAllListBtn()">
                        <i class="fas fa-search fa-3x"></i>
                        </button>
                    </c:if>
                    <c:if test="${member == null}">
                        <button type="button" id="allSearchBtnNull" tabindex="9">
                        <i class="fas fa-search fa-3x"></i>
                        </button>
                    </c:if>
                    </td>
                </tr>
                <tr>
                    <td class="th-0lax required"><span>고객번호</span></td>
                    <td class="th-0lax">
                        <input type="text" id="customSearchInputNo" value="">
                        <button type="button" style="margin-left: -7px; width: 21px;" onclick="openCustom()">
							<i class="fas fa-search"></i>
						</button>
                        <input type="text" id="customSearchInputName" readonly>
                    </td>
                    <td class="th-0lax"></td>
                    <td class="th-0lax"></td>
                    <td class="th-0lax"></td>
                </tr>

            </table>
        </div>
       <!--  <form id="salesRegFrm" name="salesRegFrm"> -->
        <!--두번째 시작-->
        <div class="secondBox">
        
            <table class="th" style="margin-top: 3px;">
                <tr>
                    <td class="th-0lax" style="padding: 17px;">현금</td>
                    <td class="th-0lax">
                        <input type="text" name="" id="csh_stlm_amt" value="">
                    </td>
                    <td class="th-0lax">카드금액</td>
                    <td class="th-0lax">
                        <input type="text" name="" id="crd_stlm_amt" value="">
                    </td>
                    <td class="th-0lax">유효일자</td>
                    <td class="th-0lax">
                        <input type="text" name="" id="vld_ym" value="">
                    </td>
                </tr>
                <tr>
                    <td class="th-0lax">카드회사</td>
                    <td class="th-0lax">
                        <select id="" name="" style="width: 159px;"> 
                            <option value="" disabled selected >선택</option> 
                            <c:forEach var="CommonCd" items="${CommonCd}" begin="0" end="3">
                            	<option value="${CommonCd.dtl_cd}">${CommonCd.dtl_cd_nm}</option> 
                            </c:forEach>
                        </select>
                    </td>
                    <td class="th-0lax">카드번호</td>
                    <td class="th-0lax">
                        <input type="text" name="" id="crd_no1" value="">
                    </td>
                    <td class="th-0lax">
                        <input type="text" name="" id="crd_no2" value="">
                    </td>
                    <td class="th-0lax">
                        <input type="text" name="" id="crd_no3" value="">
                    </td>
                    <td class="th-0lax">
                        <input type="text" name="" id="crd_no4" value="">
                    </td>
                </tr>
            </table>
        </div>
        <!--버튼 누르면 테이블 행 추가 삭제-->
        <div id="adddeletBtn">
            <button type='button' value='' id="addRow" onclick='addRow()'>
            	<i class="fas fa-plus"></i>
            </button>
            <button type='button' value='' id="delRow" onclick='delRow()'>
            	<i class="fas fa-minus"></i>
            </button>
        </div>
        <div style="width:95%; height:301px; overflow-y:auto;overflow-x:hidden;">
            <table class="tg" id="salTable">
                <thead>
                    <tr class="title">
                        <th class="tg-0lax">선택</th>
                        <th class="tg-0lax">번호</th>
                        <th class="tg-0lax">상품코드</th>
                        <th class="tg-0lax">상품명</th>
                        <th class="tg-0lax">매장재고</th>
                        <th class="tg-0lax">판매수량</th>
                        <th class="tg-0lax">판매금액</th>
                    </tr>
                </thead>
                <tbody id="salTabletbody">
	                <tr>
		                <td>
		                	<input type="checkbox">
		                </td>
		           		<td class="tg-0lax" ><span name="count">1</span></td>
		            	<td class="tg-0lax">
		            		<input type="text" name="prd_cd" id="prd_cd1" value="" onkeypress="show_enter(1)">
		            		<input type="hidden" name="prt_cd"  value="${member.prt_cd}">
		            		<button type="button" id="partnerInventory" onclick="partnerInventory(1)">
		            			<i class="fas fa-search"></i>
		            		</button>
		            	</td>
			            <td class="tg-0lax">
			            	<input type="text" name="prd_nm"  id="prd_nm1" value="" > 
			            	<!-- <label name="prd_nm" id="prd_nm1"></label> -->
			            </td>
			            <td class="tg-0lax">
			            	<input type="text" name="ivco_qty" id="ivco_qty1"  value="">
			            	<!-- <label name="ivco_qty" id="ivco_qty1"></label> -->
			            </td>
			            <!-- 판매수량 -->
			            <td class="tg-0lax">
			            	<input type="number" min="0"  name="buy_sal" id="buy_sal1" onblur="losFocus(1);" onkeydown="return showKeyCode(event, id)" value="">
			            	<!-- 단가 -->
	                		<input type="hidden" id="prd_csmr_upr1" value="">
			            </td>
			            <td class="tg-0lax">
			            	<input type="text" name="tot_sal" id="tot_sal1"  value="">
			           		<!--  <label id = 'tot_sal1'></label> -->
			            </td>
					</tr>
                </tbody>
            </table>
            
        </div>
        <!-- </form> -->
         <div class="totaldiv" style="width:94%; height:58px;">
            <table class="tk">
            <thead>
                <tr>
                <td class="tk-0pky" colspan="4" style="width: 46%;">합계</td>
                <td class="tk-0pky">
	                판매수량 : 
	                <!-- <div id="tot_sal_qty"></div> -->
	                <!-- <label id = 'tot_sal_qty'></label> -->
	                <input type="text" name="tot_sal_qty" id="tot_sal_qty"  value="">
	                <!-- <input type="hidden" id="tot_sal_qty" value=""> -->
	                
                </td>
                <td class="tk-0lax">
                	판매금액 : 
                	<!-- <label id = 'tot_sal_amt'></label> -->
                	<input type="text" name="tot_sal_amt" id="tot_sal_amt"  value="">
                	<!-- <input type="hidden" id="tot_sal_amt" value=""> -->
                </td>
                </tr>
            </thead>
            </table>
        </div>
        
    </div>
    </section>
    <aside>
    </aside>
    <footer>
        <div class="closeDev">
            <input type="button" class="closeBtn" value="닫기" onclick="window.close()">
            <input type="button" class="submitBtn" value="적용" onclick="goStoreSalesReg()">
            </div>
    </footer>
</body>

<script>
	
	<!--판매수량에 따른 판매금액 구하기 -->
	
	function losFocus(j) { 
		//ID 형식 : txt + "_" + OOO(축약어) + "_" + index 
		//ivco_qty1 + i(index)
		//따라서 앞에 고정 문자열의 개수는 8개(txt_ooo_) 
	//var pDefault_lenght = 8; 
	//전달받은 ID의 끝자리 Index를 추출해서 //동일 Index를 가지고 있는 ID의 이름에 Index 를 붙여줌. 
	//var pIndex = String(id.substring(pDefault_lenght, id.length)); 
	//var pri_name = "prd_csmr_upr" + pIndex; //가격 컬럼의 ID 
	//var qty_name = "txt_qty_" + pIndex; //수량 컬럼의 ID 
	//var tot_name = tot_sal_qty; //총 금액 컬럼의 ID 
	var buy_sal = document.getElementById('buy_sal'+j).value; //해당 수량컬럼의 값을 qty 에 저장 
	console.log("1111111 =" + buy_sal);
	var prd_csmr_upr = document.getElementById('prd_csmr_upr'+j).value; //해당 가격컬럼의 값을 pri 에 저장 
	console.log("222222 =" + prd_csmr_upr);
	var ivco_qty = $("#ivco_qty" + j).val();
	console.log("매장재고1 =" +ivco_qty);
	var tot_amt = buy_sal.replace(",", "") * prd_csmr_upr.replace(",", ""); //수량, 또는 금액 값에 ","" 가 입력되있을 때 오류를 방지하기 위해 .replace 로 "," 제거 
	console.log("3333333 =" + tot_amt);
	//document.getElementById(tot_name).innerHTML
//document.getElementById(tot_sal_qty).innerHTML
	//총 금액컬럼에 계산된 금액 입력. 3자리마다 "," 입력.
	
		//매장재고 넘었을때 -> 경고창 +  최대수량 + 최고수량 금액
		//parseInt -> 문자열을 정수형으로 변환
		if(parseInt(buy_sal) > parseInt(ivco_qty)){
			console.log("매장재고2 =" +ivco_qty);
			alert("해당 수량은 주문할 수 없습니다.");
			document.getElementById('buy_sal'+j).value= $("#ivco_qty" + j).val();
			document.getElementById('tot_sal'+j).value =  tot_amt.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ",");
			return false;
			
			
		}else{
			document.getElementById('tot_sal'+j).value =  tot_amt.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ",");
			
			
		}
		
		
		var buy_sal_sum = parseInt('0');
		var totalRowCnt  = $('#salTable > tbody tr').length;
		
		console.log("totalRowCnt안 =" + totalRowCnt);
		var k = buy_sal;
		
		for(var l = 1; l <= totalRowCnt; l++){
			console.log("나오라ㅏㅅ =" + $('#buy_sal'+l).val());
			if($('#buy_sal'+l).val() == ''){
				continue;
			}
			buy_sal_sum += parseInt($('#buy_sal'+l).val());
			console.log("buy_sal_sum안 =" + buy_sal_sum);
		}
		console.log("buy_sal_sum밖 =" + buy_sal_sum);
		document.getElementById('tot_sal_qty').value= buy_sal_sum;
	
	} 
	
	//input값 숫자만 받도록
	function showKeyCode(event, id) { 
		event = event || window.event; 
		var keyID = (event.which) ? event.which : event.keyCode; 
	if ((keyID >= 48 && keyID <= 57) || (keyID >= 96 && keyID <= 105) || keyID == 8 || keyID == 46 || keyID == 37 || keyID == 39 || keyID == 188) {
		;
		return; 
	} else { 
		
		return false; 
		} 
	}

	<!-- 판매일자는 당일만 가능 -->
	//현재날짜
	document.getElementById('sal_dt').valueAsDate = new Date();

	<!-- 상품코드 or 상품명 검색 시 엔터키 누르면 함수 발동-->
	function show_enter(l){
		 //var prd_cd = document.getElementById("prd_cd1").value;
		 //var prt_nm = document.getElementById("prt_cd").value;
		var totalRowCnt  = $('#salTable > tbody tr').length;
	    //현재 클릭  
		var prd_cd_l = '';
	    //1번부터 i번까지 검사할   
	    var prd_cd_j = '';
	       if(event.keyCode == 13){
	    	   //alert("성공")
	    	  //중복된게 있을때
	    	  for(var j = 1; j <= totalRowCnt; j++){
// 		    	  console.log('i = ' + i);
// 		    	  console.log('j = ' + j);
// 		    	  console.log('l = ' + l);
		    	  //현재 클릭된 val
		    	  prd_cd_l = $("#prd_cd" + l).val();
		    	  //검사할 val ->1번부터 시작
		    	  prd_cd_j = $("#prd_cd" + j).val();
		    	  //현재 클릭이 검사할꺼랑 다를때
	    		  if(l != j){
// 	    			  console.log(' 검사중! ');
// 	    			  console.log('현재 위치 입력한 값 = ' + prd_cd_l);
// 	    			  console.log('검사할 위치 입력한 값 = ' + prd_cd_j);
// 	    			  console.log('검사할 위치 입력한 값1 = ' + $("#prd_nm" + j).val());
	    			  //쿨릭이랑 검사한게 같고, 상품명이 공백이 아닐때 -> alert 하고 리턴
	    			  if((prd_cd_l == prd_cd_j) && !($("#prd_nm" + j).val() == "")){
	    				  console.log('여기 중복된곳');
			    		  alert('중복된 정보입니다!');
			    		  return;
	    		  	  }
	    		  }
	    	  } 
	    	   //중복된 정보가 없을때
	    	   prdInventorySearch(l);
	    	   //console.log("나와아아아ㅏ" + prd_cd);
	       }
      }

	 <!-- 상품코드, 상품명 입력시 나오는 값들 -->
	function prdInventorySearch(l){
		console.log("prdInventorySearch=" +l);
		var prd_cd = $("#prd_cd" + l).val();
		//매장코드
		var prt_cd = $("#prt_cd").val();
		console.log(prd_cd);
		console.log("뿌잉 =  " + prd_cd);
		$.ajax({
            url : "${pageContext.request.contextPath}/sales/prdInventorySearch",
            type :"POST",
            dataType : "json",
            data : {
            	"prt_cd" : prt_cd,
	        	"prd_cd" : prd_cd
            	
            },
            success : function(data){
           	 
					//alert("성공?.");
					//console.log(data);
					const $frm = $(salTabletbody);
					//console.log("노아아아아앙 2=" + data.listnm[0].prd_cd);
					if(data.listnm){
						//동일한 물건이 이미있을경우
						/* if(data.listnm[0].prd_cd == $("#prd_cd" + i).val()){
							console.log("노아아아아앙 =" + data.listnm[0].prd_cd);
							console.log("꾸이이이잉이 =  " + prd_cd);
							alert("이미 추가된 상품입니다.")
							return false;
						} */
						
						//상품이 존재하지 않을때
						if(data.listnm.length == 0){
							alert("해당상품은 존재하지 않습니다.");
						}
						
						
						if(data.listnm[0].prd_ss_cd =='C' || data.listnm[0].prd_tp_cd =='20' ||data.listnm[0].ivco_qty =='0'){
							alert("상품상태가 정상이 아닙니다.")
							return false;
						}
						$frm.find($("#prd_cd" + l)).val(data.listnm[0].prd_cd);
						$frm.find($("#prd_nm" + l)).val(data.listnm[0].prd_nm);
						//$frm.find(document.getElementById('buy_sal'+i)).innerText(data.listnm[0].prd_nm);
						$frm.find($("#ivco_qty" + l)).val(data.listnm[0].ivco_qty);
						$frm.find($("#prd_csmr_upr" + l)).val(data.listnm[0].prd_csmr_upr);
						//$frm.find(document.getElementById('ivco_qty'+i)).innerText(data.listnm[0].ivco_qty);
						
					}
					if(data.list){
						if(data.list.length == 0){
							alert("해당상품은 존재하지 않습니다.");
						}
						if(data.list[0].prd_ss_cd =='C' || data.list[0].prd_tp_cd =='20' ||data.list[0].ivco_qty =='0'){
							alert("상품상태가 정상이 아닙니다.")
							return false;
						}
						$frm.find($("#prd_cd" + l)).val(data.list[0].prd_cd);
						$frm.find($("#prd_nm" + l)).val(data.list[0].prd_nm);
						$frm.find($("#ivco_qty" + l)).val(data.list[0].ivco_qty);
						//prd_csmr_upr
						$frm.find($("#prd_csmr_upr" + l)).val(data.list[0].prd_csmr_upr);
						
					}
					
					
           	 
            },
            error: function(xhr, status, error){
                alert("등록실패했습니다." + error);
            }
           
        });
	}
	
	  //function addRow() {
		  
	    // table element 찾기
	    //const table = document.getElementById('tableAddDelete');
	    
	    // 새 행(Row) 추가
	   // const newRow = table.insertRow();
		var i = 1;

		
		//var j = 1;
		var html = '';
		   
		<!-- 행추가 -->
		function addRow() {
			
		//var max = $("#ivco_qty'+ i + '").val();
	     html = '';
         ++i;
         if (i > 10) {
        	 alert("최대 10개까지만 등록이 가능합니다.");
        	 return;
         }
         console.log("addRow=" +i);
        // var j = i.length;
	    // Cell에 텍스트 추가
	     $("#salTable").append(
	        '<tr><td><input type="checkbox" name="checkbox"></td>'
	            +'<td class="tg-0lax"><span name="count">' + i +'</spna></td>'
	            +'<td class="tg-0lax"><input type="text" name="prd_cd"  id="prd_cd'+i+'" onkeypress="show_enter('+ i+ ')"><button type="button" onclick="partnerInventory(' + i + ')"><i class="fas fa-search"></i></button></td>'
	            +'<td class="tg-0lax"><input tupe="text" name="prd_nm" id="prd_nm' + i + '"></td>'
	            +'<td class="tg-0lax"><input type="text" name="ivco_qty" id="ivco_qty' + i + '"></td>'
	            +'<td class="tg-0lax"><input type="number" min="0"  name="buy_sal" id="buy_sal' + i + '" onblur="losFocus(' + i + ');" onkeydown="return showKeyCode(event, id)" value=""><input type="hidden" id="prd_csmr_upr' + i + '" value=""></td>'
	            +'<td class="tg-0lax"><input type="text" id ="tot_sal' + i + '"></td></tr>'

	    ) 
	   
	  }

	/*   function delRow(){
	    $("#salTable > tbody:last >tr:not(:first):last ").remove(); 
	}
	    */
	   /*  function delRow(){          
	    	var checkbox = $("input:checkbox[type=checkbox]:checked");
	    	//var checkbox = $("input:checkbox[id=prdCheck]:checked");
	    	//checkvbox.parent() : checkbox의 부모 td
			 // var tr = checkbox.parent().parent().eq(i);
			  //checkbox.parent().parent() : td의 부모 tr
            if($("input:checkbox[type=checkbox]").is(":checked") == true){ //체크된 요소가 있으면               
                var i = checkbox.parents("tr");
            console.log("idddddddddddddd" + i);
                   //var e = i.next("tr");                     
                   i.remove();
                  // e.remove();
            }
       } */
       
       function delRow(){ 
		  //체크된 행이 없을 경우.
        if($("input:checkbox[type=checkbox]").is(":checked") == false){  
        
              alert("삭제할 행을 선택하여 주십시오.");  
            
        } else {                  
            
        	$("input:checkbox[type=checkbox]:checked").each(function(index){               
                       
                         
                     //체크박스를 포함하고 있는 행 제거 
                     var clickedRow = $(this).parent().parent();   
                     //var clickedRowNext = clickedRow.next("tr");                     
                     clickedRow.remove();
                     
                    // clickedRowNext.remove();     
                    
                    
                                       
              });                    
        }            
	//$("#salTable > tbody:last >tr:not(:first):last ").remove();
       }
       
       
	  
		//매장팝업
		function partnerInventory(countNo){
		
	     // window.name = "부모창 이름"; 
	     window.name = "storePopForm";
	     var storeSearchUrl = "${pageContext.request.contextPath}/sales/partnerInventoryInquiry?countNo=" +countNo;
	     // window.open("open할 window", "자식창 이름", "팝업창 옵션");
	     window.open(storeSearchUrl,
	     		"childStorePopForm", "width=650, height=650, resizable = no, scrollbars = no");    
	    }
	
		//고객번호팝업
		function openCustom(){
			 
			 window.name = "CustomPopForm";
			 var custInquiryUrl = "${pageContext.request.contextPath}/customer/customerInquiry"
			 
			 window.open(custInquiryUrl,
		         "childCustomPopForm", "width=700, height=650, resizable = no, scrollbars = no");
		
		}
	//goStoreSalesReg
	$("#goStoreSalesReg").on("click", function(){
		//판매일자, 총판매슈량, 총판매금액, 총공금가액, 총부가세액, 현금결제금액,
		//카드결제금액, 고객번호, 카드번호, 유효년월, 카드회사
		
		//날짜는 안가져가고 sysdate 찍어도될듯
		//var sal_dt = $("#").val();
		var prt_cd = $("#prt_cd").val();
		var tot_sal_amt = $("#tot_sal_amt").val();
		var tot_sal_qty = $("#tot_sal_qty").val();
		var tot_vos_amt = $("#tot_vos_amt").val();
		var tot_vat_amt = $("#tot_vat_amt").val();
		var csh_stlm_amt = $("#csh_stlm_amt").val();
		var crd_stlm_amt = $("#crd_stlm_amt").val();
		var crd_no1 = $("#crd_no1").val();
		var crd_no2 = $("#crd_no2").val();
		var crd_no3 = $("#crd_no3").val();
		var crd_no4 = $("#crd_no4").val();
		var vld_ym = $("#vld_ym").val();
		var crd_co_cd = $("#crd_co_cd option:selected").val();
	
		
		$.ajax({
            url : "${pageContext.request.contextPath}/sales/salesRegisterEnroll",
            type :"POST",
            dataType : "text",
            data : {
            	"prt_cd" : prt_cd,
            	"tot_sal_amt" : tot_sal_amt,
            	"tot_sal_qty" : tot_sal_qty,
            	"tot_vos_amt" : tot_vos_amt,
            	"tot_vat_amt" : tot_vat_amt,
            	"csh_stlm_amt" : csh_stlm_amt,
            	"crd_stlm_amt" : crd_stlm_amt,
            	"crd_no1" : crd_no1,
            	"crd_no2" : crd_no2,
            	"crd_no3" : crd_no3,
            	"crd_no4" : crd_no4,
            	"vld_ym" : vld_ym,
            	"crd_co_cd" : crd_co_cd

            },
           
            success : function(data){
           	 
					alert("회원등록되었습니다.")
				
                window.close();
           	 
            },
            error: function(xhr, status, error){
                alert("등록실패했습니다." + error);
            }
           
        });
		
	});
</script>

</html>