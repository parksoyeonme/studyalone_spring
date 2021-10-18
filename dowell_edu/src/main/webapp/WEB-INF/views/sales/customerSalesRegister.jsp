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
<%-- RedirectAttribute.addFlashAttribute의 저장된 속성값 사용(1회용) --%>
<c:if test="${not empty msg}">
<script>
alert("${msg}");
</script>   
</c:if> 

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
            <form id="salesRegisterFrm" name="salesRegisterFrm"> 
	        	<div class="firtBox">
		            <table class="th" style="margin-top: 3px;">
		                <tr>
		                    <td class="th-0lax required">판매일자</td>
		                    <td class="th-0lax">
		                    	<input type="date" name="sal_dt" id="sal_dt" readonly>
		                    	<input type="hidden" name="prt_cd" id="prt_cd" value="${member.prt_cd}">
		                    	<input type="hidden" name="user_id" id="user_id" value="${member.user_id}">
		                    </td>
		                    <td class="th-0lax required">판매구분</td>
		                    <td class="th-0lax">
		                        <select id="sal_tp_cd" name="sal_tp_cd" style="width: 159px;"> 
		                            <option value="all" disabled selected >전체</option> 
		                            <option value="${CommonCd[5].dtl_cd}">${CommonCd[5].dtl_cd_nm}</option>
		                            <option disabled value="${CommonCd[4].dtl_cd}">${CommonCd[4].dtl_cd_nm}</option>
		                        </select>
		                    </td>
		                <tr style="height: 18px;">
		                    <td class="th-0lax"></td>
		                    <td class="th-0lax"></td>
		                    <td class="th-0lax"></td>
		                    <td class="th-0lax"></td>
		                </tr>
		                <tr>
		                    <td class="th-0lax required"><span class="number">고객번호</span></td>
		                    <td class="th-0lax">
		                        <input type="text" name="cust_no" id="customSearchInputNo">
		                        <button type="button" style="margin-left: -7px; width: 21px;" onclick="openCustom()">
									<i class="fas fa-search"></i>
								</button>
		                        <input type="text" name="cust_nm" id="customSearchInputName" readonly>
		                    </td>
		                    <td class="th-0lax"></td>
		                    <td class="th-0lax"></td>
		                </tr>
		               
		            </table>
	       	 	</div>

	       		<!--두번째 시작-->
		        <div class="secondBox">
		            <table class="th" style="margin-top: 3px;">
		                <tr>
		                    <td class="th-0lax" style="padding: 17px;">현금</td>
		                    <td class="th-0lax">
		                        <input type="number" min="0" name="csh_stlm_amt" id="csh_stlm_amt"  onblur="losFocus(1);" onKeyup="SetNum(this)">
		                    </td>
		                    <td class="th-0lax">카드금액</td>
		                    <td class="th-0lax">
		                        <input type="number" min="0" name="crd_stlm_amt" id="crd_stlm_amt"  >
		                    </td>
		                    <td class="th-0lax">유효일자</td>
		                    <td class="th-0lax">
		                    	<input type="text" name="vld_ym" id="vld_ym"  onchange="f_vld_ymchk(this)" onKeyup="SetNum(this)" placeholder="YYYYMM" maxlength="6">
		                    </td>
		                </tr>
		                <tr>
		                    <td class="th-0lax">카드회사</td>
		                    <td class="th-0lax">
		                        <select id="crd_co_cd" name="crd_co_cd" style="width: 159px;"> 
		                            <option value="0" disabled selected >선택</option> 
		                            <c:forEach var="CommonCd" items="${CommonCd}" begin="0" end="3">
		                            	<option value="${CommonCd.dtl_cd}">${CommonCd.dtl_cd_nm}</option> 
		                            </c:forEach>
		                        </select>
		                    </td>
		                    <td class="th-0lax">카드번호</td>
		                    <td class="th-0lax">
		                        <input type="hidden" name="crd_no" >
		                        <input type="text" min="0" maxlength="4" name="crd_no1" id="crd_no1" onKeyup="SetNum(this)">
		                    </td>
		                    <td class="th-0lax">
		                        <input type="text" min="0" maxlength="4" name="crd_no2" id="crd_no2"  onKeyup="SetNum(this)">
		                    </td>
		                    <td class="th-0lax">
		                        <input type="text" min="0" maxlength="4" name="crd_no3" id="crd_no3"  onKeyup="SetNum(this)">
		                    </td>
		                    <td class="th-0lax">
		                        <input type="text" min="0" maxlength="4" name="crd_no4" id="crd_no4"  onKeyup="SetNum(this)">
		                    </td>
		                </tr>
		            </table>
		        </div>
		      
		        <!--버튼 누르면 테이블 행 추가 삭제-->
		        <div id="adddeletBtn">
		            <button type='button' onclick='addRow()' style="width: 28px;">
		            	<i class="fas fa-plus"></i>
		            </button>
		            <button type='button' onclick='delRow()' style="width: 28px;">
		            	<i class="fas fa-minus"></i>
		            </button>
	        	</div>
	        	
	        	<!-- 추가되는 table -->
		        <div style="width:95%; height:378px; overflow-y:auto;overflow-x:hidden;">
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
				                	<input type="checkbox" name="checkbox">
				                </td>
				           		<td class="tg-0lax" >
				           			<span >1</span>
				           			<input type="hidden"  id="count1" value="1">
				           		</td>
				            	<td class="tg-0lax">
				            		<input type="text" name="prd_cd" id="prd_cd1"  onkeypress="show_enter(1)">
				            		<button type="button"  onclick="partnerInventory(1)" style="margin-left: -5px;">
				            			<i class="fas fa-search"></i>
				            		</button>
				            	</td>
					            <td class="tg-0lax">
					            	<input type="text" class="prd_nm" name="prd_nm"  id="prd_nm1"  readonly > 
					            	<!-- <label name="prd_nm" id="prd_nm1"></label> -->
					            </td>
					            <td class="tg-0lax">
					            	<input type="text" name="ivco_qty" id="ivco_qty1"  readonly>
					            	<!-- <label name="ivco_qty" id="ivco_qty1"></label> -->
					            </td>
					            <!-- 판매수량 -->
					            <td class="tg-0lax">
					            	<input type="number" min="0"  class="buy_sal hidecss" name="sal_qty" id="buy_sal1" onblur="losFocus(1);" onkeyup="enterkey(1)" onkeydown="return showKeyCode(event, id)">
					            	<!-- 단가 -->
			                		<input type="hidden" name="prd_csmr_upr" id="prd_csmr_upr1">
					            </td>
					            <td class="tg-0lax">
					            	<input type="text" class="tot_sal hidecss" id="tot_sal1"  readonly>
					            	<input type="hidden" name="sal_amt"  id="sal_amt1">
					            	
					           		<!--  <label id = 'tot_sal1'></label> -->
					            </td>
							</tr>
		                </tbody>
		            </table>
		        </div>
		        
		        <!-- 총합계 -->
		        <div class="totaldiv" style="width:94%; height:58px;">
		            <table class="tk">
		           		<thead>
			                <tr>
			                <td class="tk-0pky" colspan="5" style="width: 61%;">합계</td>
			                <td class="tk-0pky">
				                <label class="total" style="margin-right: -63px;">판매수량 </label> 
				                <input type="number" class ="hidecss" name="tot_sal_qty" id="tot_sal_qty"  readonly>
			                </td>
			                <td class="tk-0pky">
			                	<label class="total" style="margin-right: -67px;">판매금액</label>
			                	<input type="text" class ="hidecss" name="tot_sal_amt" id="tot_sal_amt"  readonly>
			                </td>
			                </tr>
		            	</thead>
		            </table>
		        </div>
		    </form>
    	</div>
    </section>
    <footer>
        <div class="closeDev">
            <input type="button" class="closeBtn" value="닫기" onclick="window.close()">
            <input type="button" class="submitBtn" value="적용" id="goStoreSalesReg" >
            </div>
    </footer>
</body>

<script>

	//초기화버튼
	function refreshPage(){
		location.href = "${pageContext.request.contextPath}/sales/customerSalesRegister";
	}

	///유효일자에서 호출하는 함수. 
	function f_vld_ymchk(obj){
		
	
		var vld_ym_year = $(obj).val().substr(0, 4); //yyyy
		var vld_ym_month = $(obj).val().substr($(obj).val().length-2); //mm
		console.log("vld_ym_month = " + vld_ym_month);
		var today = new Date();   
		var year = today.getFullYear(); // 년도
		var month = today.getMonth() + 1;  // 월
		var maxday = String(year) + String(month);
		
	
		
		//yyyymm -6자리
		if($(obj).val().length != '6'){
			alert("유효일자를 다시 확인해주세요.");
			$(obj).val('');
			return;
		}
	
		//년도는 이번년도보다 과거 X + 월은 1~12 제외 X
		if(vld_ym_year < year || $(obj).val() < maxday || 12 < vld_ym_month || vld_ym_month <= 00){
			alert("사용할 수 없는 카드입니다.");
			$(obj).val('');
			return;
		}

	}
	
	

  
	function losFocus(j) {
		
		if($("#prd_nm"+j).val() == '' ){
			alert("상품을 선택해주세요");
			$("#buy_sal"+j).val('');
			$("#prd_cd" + j).focus();
			return;
		}
	
		var buy_sal = document.getElementById('buy_sal'+j).value; //해당 수량컬럼의 값을 buy_sal+j 에 저장 
		var prd_csmr_upr = document.getElementById('prd_csmr_upr'+j).value; //해당 가격컬럼의 값을 prd_csmr_upr +j 에 저장 
		var ivco_qty = $("#ivco_qty" + j).val();
		var tot_sal = buy_sal.replace(",", "") * prd_csmr_upr.replace(",", ""); //수량, 또는 금액 값에 ","" 가 입력되있을 때 오류를 방지하기 위해 .replace 로 "," 제거 
		
		<!-- 총판매수량 & 총판매금액 -->
		var buy_sal_sum = Number('0');
		var tot_sal_sum = Number('0');
		var totalRowCnt  = $('#salTable > tbody tr').length;
		var row_tot_sal = '';
		var row_buy_sal = '';
	      
		
		
			//매장재고 넘었을때 -> 경고창 +  최대수량 + 최고수량 금액
			//parseInt -> 문자열을 정수형으로 변환
			if(parseInt(buy_sal) > parseInt(ivco_qty)){
				alert("해당 수량은 주문할 수 없습니다.");
	
				document.getElementById('buy_sal'+j).value= Number(ivco_qty);
				document.getElementById('tot_sal'+j).value= Number(ivco_qty) * prd_csmr_upr.replace(",", "");
	
				for(var l = 0; l < totalRowCnt; l++){
					
					if($(".buy_sal:eq(" + l +")").val() != '' ){
						row_buy_sal = Number($(".buy_sal:eq(" + l +")").val());	
						buy_sal_sum += row_buy_sal;
					}
					if($(".tot_sal:eq(" + l +")").val() != '' ){
						row_tot_sal = Number($(".tot_sal:eq(" + l +")").val().replace(/,/gi, ""));	
						tot_sal_sum += row_tot_sal;
					}			
				}
				
				document.getElementById('tot_sal_qty').value= buy_sal_sum;
				document.getElementById('tot_sal_amt').value= tot_sal_sum.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ",");
			
				return false;
				
			}else{
				document.getElementById('tot_sal'+j).value =  tot_sal.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ",");
				document.getElementById('sal_amt'+j).value =  tot_sal;
			}
	
			for(var l = 0; l < totalRowCnt; l++){
				
				if($(".buy_sal:eq(" + l +")").val() != '' ){
					row_buy_sal = Number($(".buy_sal:eq(" + l +")").val());	
					buy_sal_sum += row_buy_sal;
				}
				if($(".tot_sal:eq(" + l +")").val() != '' ){
					row_tot_sal = Number($(".tot_sal:eq(" + l +")").val().replace(/,/gi, ""));	
					tot_sal_sum += row_tot_sal;
				}			
			}
			document.getElementById('tot_sal_qty').value= buy_sal_sum;
			document.getElementById('tot_sal_amt').value= tot_sal_sum.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ",");


	}
	<!--판매수량에 따른 판매금액 구하기 -->
	function enterkey(j) { 
		
		if (window.event.keyCode == 13) {

			
			if($("#prd_nm"+j).val() == '' ){
				alert("상품을 선택해주세요");
				$("#buy_sal"+j).val('');
				$("#prd_cd" + j).focus();
				return;
			}
			
		
			var buy_sal = document.getElementById('buy_sal'+j).value; //해당 수량컬럼의 값을 buy_sal+j 에 저장 
			var prd_csmr_upr = document.getElementById('prd_csmr_upr'+j).value; //해당 가격컬럼의 값을 prd_csmr_upr +j 에 저장 
			var ivco_qty = $("#ivco_qty" + j).val();
			var tot_sal = buy_sal.replace(",", "") * prd_csmr_upr.replace(",", ""); //수량, 또는 금액 값에 ","" 가 입력되있을 때 오류를 방지하기 위해 .replace 로 "," 제거 
			
			<!-- 총판매수량 & 총판매금액 -->
			var buy_sal_sum = Number('0');
			var tot_sal_sum = Number('0');
			var totalRowCnt  = $('#salTable > tbody tr').length;
			var row_tot_sal = '';
			var row_buy_sal = '';
		      
			
				
				//매장재고 넘었을때 -> 경고창 +  최대수량 + 최고수량 금액
				//parseInt -> 문자열을 정수형으로 변환
				if(parseInt(buy_sal) > parseInt(ivco_qty)){
					alert("해당 수량은 주문할 수 없습니다.");
		
					document.getElementById('buy_sal'+j).value= Number(ivco_qty);
					document.getElementById('tot_sal'+j).value= Number(ivco_qty) * prd_csmr_upr.replace(",", "")
		
					for(var l = 0; l < totalRowCnt; l++){
						
						if($(".buy_sal:eq(" + l +")").val() != '' ){
							row_buy_sal = Number($(".buy_sal:eq(" + l +")").val());	
							buy_sal_sum += row_buy_sal;
						}
						if($(".tot_sal:eq(" + l +")").val() != '' ){
							row_tot_sal = Number($(".tot_sal:eq(" + l +")").val().replace(/,/gi, ""));	
							tot_sal_sum += row_tot_sal;
						}			
					}
					
					document.getElementById('tot_sal_qty').value= buy_sal_sum;
					document.getElementById('tot_sal_amt').value= tot_sal_sum.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ",");
				
					return false;
					
				}else{
					document.getElementById('tot_sal'+j).value =  tot_sal.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ",");
					document.getElementById('sal_amt'+j).value =  tot_sal;
				}
		
				for(var l = 0; l < totalRowCnt; l++){
					
					if($(".buy_sal:eq(" + l +")").val() != '' ){
						row_buy_sal = Number($(".buy_sal:eq(" + l +")").val());	
						buy_sal_sum += row_buy_sal;
					}
					if($(".tot_sal:eq(" + l +")").val() != '' ){
						row_tot_sal = Number($(".tot_sal:eq(" + l +")").val().replace(/,/gi, ""));	
						tot_sal_sum += row_tot_sal;
					}			
				}
				document.getElementById('tot_sal_qty').value= buy_sal_sum;
				document.getElementById('tot_sal_amt').value= tot_sal_sum.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ",");
				
				//수량 엔터칠시 addRow 행추가
				if($("#buy_sal"+j).val() != ''){
					addRow();
				}
		}
	} 
	
	//input값 숫자만 받도록
	function showKeyCode(event, id) { 
		event = event || window.event; 
		var keyID = (event.which) ? event.which : event.keyCode; 
		if ((keyID >= 48 && keyID <= 57) || (keyID >= 96 && keyID <= 105) || keyID == 8 || keyID == 46 || keyID == 37 || keyID == 39 || keyID == 188) {
			
			return; 
		} else { 
			
			return false; 
			} 
	}
	
	//숫자만
	function SetNum(obj) {
	 
		 if ((event.keyCode <= 27) || (event.keyCode >= 33 && event.keyCode <= 46) 
			|| (event.keyCode >= 91 && event.keyCode <= 93) || (event.keyCode >= 112 && event.keyCode <= 145)) {
		  return false;
		 }
		 
		 val=obj.value;
		 re=/[^0-9]/gi;
		 obj.value=val.replace(re,"");
	 
	}
	
	<!-- 결제수단 현금,카드 금액 계산 후 토탈비교-->
	//현금 카드 결제금액
	 $("#csh_stlm_amt, #crd_stlm_amt").keyup(function(){
		
		//총판매금액 < 현금
		if((Number($("#tot_sal_amt").val().replace(/,/gi, "")) < Number($("#csh_stlm_amt").val())) ||
		   (Number($("#tot_sal_amt").val().replace(/,/gi, "")) < Number($("#crd_stlm_amt").val()))){
			alert("총 판매금액을 넘었습니다.");
			$("#csh_stlm_amt").val('');
			$("#crd_stlm_amt").val('');
		}
		
			
		if(($("#crd_stlm_amt").val() != ''&& $("#csh_stlm_amt").val() != '')&& 
		Number($("#tot_sal_amt").val().replace(/,/gi, "")) < Number($("#csh_stlm_amt").val())+Number($("#crd_stlm_amt").val()) ){
			alert("현금+ 카드 금액이 총 판매금액을 넘었습니다.");
			$("#crd_stlm_amt").val('');
			$("#csh_stlm_amt").focus();
		}
		
		
	});
	
	//고객번호 keyup
	$("#customSearchInputNo").keyup(function(){
		$("#customSearchInputName").val($(this).val());
		$("#customSearchInputName").removeAttr("disabled");
		
	})
	
	<!-- 판매일자는 당일만 가능 -->
	//sal_dt = 현재날짜만
	document.getElementById('sal_dt').valueAsDate = new Date();
	

	<!-- 상품코드 or 상품명 검색 시 엔터키 누르면 함수 발동-->
	function show_enter(l){

		var totalRowCnt  = $('#salTable > tbody tr').length;
	    //현재 클릭  
		var prd_cd_l = '';
	    //1번부터 i번까지 검사할   
	    var prd_cd_j = '';
	       if(event.keyCode == 13){
	    	  //중복된게 있을때
	    	  for(var j = 1; j <= totalRowCnt; j++){

		    	  //현재 클릭된 val
		    	  prd_cd_l = $("#prd_cd" + l).val();
		    	  //검사할 val ->1번부터 시작
		    	  prd_cd_j = $("#prd_cd" + j).val();
		    	  //현재 클릭이 검사할꺼랑 다를때
	    		  if(l != j){

	    			  //쿨릭이랑 검사한게 같고, 상품명이 공백이 아닐때 -> alert 하고 리턴
	    			  if((prd_cd_l == prd_cd_j) && !($("#prd_nm" + j).val() == "")){
			    		  alert('중복된 정보입니다!');
			    		  return;
	    		  	  }
	    		  }
	    	  } 
	    	   //중복된 정보가 없을때
	    	   prdInventorySearch(l);
	       }
     }

	 <!-- 상품코드, 상품명 입력시 나오는 값들 -->
	function prdInventorySearch(l){
		var prd_cd = $("#prd_cd" + l).val();
		//매장코드
		var prt_cd = $("#prt_cd").val();
		$.ajax({
            url : "${pageContext.request.contextPath}/sales/prdInventorySearch",
            type :"POST",
            dataType : "json",
            data : {
            	"prt_cd" : prt_cd,
	        	"prd_cd" : prd_cd
            	
            },
            success : function(data){
           	 
					const $frm = $(salTabletbody);
					//상품명으로 search
					if(data.list){
						
						//상품이 여러개 존재할 경우
						if(1 <data.list.length){
							alert("해당상품의 결과가 많아 매장재고조회로 넘어갑니다.");
							partnerInventory(l);
							return false;
						}
						//상품이 존재하지 않을때
						if(data.list.length == 0){
							alert("해당상품은 존재하지 않습니다.");
							$frm.find($("#prd_nm" + l)).val('');
							$frm.find($("#ivco_qty" + l)).val('');
							$frm.find($("#prd_csmr_upr" + l)).val('');
							return false;
						}
						
						if(data.list[0].prd_ss_cd =='C'){
							alert("상품상태가 정상이 아닙니다");
							$frm.find($("#prd_nm" + l)).val('');
							$frm.find($("#ivco_qty" + l)).val('');
							$frm.find($("#prd_csmr_upr" + l)).val('');
							return false;
							
						} 
						if(data.list[0].prd_tp_cd =='20'){
							alert("판매할수 없는 상품입니다");
							$frm.find($("#prd_nm" + l)).val('');
							$frm.find($("#ivco_qty" + l)).val('');
							$frm.find($("#prd_csmr_upr" + l)).val('');
							
							return false;
							
						}
						if(data.list[0].ivco_qty =='0'){
							alert("상품의 재고가 없습니다.");
							$frm.find($("#prd_nm" + l)).val('');
							$frm.find($("#ivco_qty" + l)).val('');
							$frm.find($("#prd_csmr_upr" + l)).val('');
							
							return false;
							
						}
						if(data.list[0].prd_csmr_upr =='0'){
							alert("소비자단가가 없습니다.");
							$frm.find($("#prd_nm" + l)).val('');
							$frm.find($("#ivco_qty" + l)).val('');
							$frm.find($("#prd_csmr_upr" + l)).val('');
							
							return false;
							
						}
						
						$frm.find($("#prd_cd" + l)).val(data.list[0].prd_cd);
						$frm.find($("#prd_nm" + l)).val(data.list[0].prd_nm);
						$frm.find($("#ivco_qty" + l)).val(data.list[0].ivco_qty);
						$frm.find($("#prd_csmr_upr" + l)).val(data.list[0].prd_csmr_upr);
						
					}

					
            },
            error: function(xhr, status, error){
                alert("등록실패했습니다." + error);
            }
           
        });
	}

		var html = '';
 		var i =1;
 		
		<!-- 행추가 -->
		function addRow() {
			var totalRowCnt  = $('#salTable > tbody tr').length;
	     	html = '';
           	++i;
           	
	        if (totalRowCnt > 19) {
	        	 alert("최대 20개까지만 등록이 가능합니다.");
	        	 return;
	         }

         	// Cell에 텍스트 추가
		     $("#salTable").append(
		        '<tr><td><input type="checkbox" name="checkbox"></td>'
		            +'<td class="tg-0lax"><span class="number">'+ (totalRowCnt+1) + '</span><input type="hidden" value="'+ (totalRowCnt+1) +'"><input type="hidden" name="count" id="count'+i +'" value="'+ i +'"></td>'
		            +'<td class="tg-0lax"><input type="text" name="prd_cd"  id="prd_cd'+i+'" onkeypress="show_enter('+ i+ ')"><button type="button" onclick="partnerInventory(' + i + ')"><i class="fas fa-search"></i></button></td>'
		            +'<td class="tg-0lax"><input tupe="text" class="prd_nm hidecss" name="prd_nm" id="prd_nm' + i + '" readonly></td>'
		            +'<td class="tg-0lax"><input type="text" class ="hidecss" name="ivco_qty" id="ivco_qty' + i + '" readonly></td>'
		            +'<td class="tg-0lax"><input type="number" min="0" class="buy_sal hidecss" name="sal_qty" id="buy_sal' + i + '" onkeyup="enterkey(' + i + ');" onblur="losFocus(' + i + ');" onkeydown="return showKeyCode(event, id)"><input type="hidden" name="prd_csmr_upr" id="prd_csmr_upr' + i + '"></td>'
		            +'<td class="tg-0lax"><input type="text" class="tot_sal hidecss" id ="tot_sal' + i + '" readonly><input type="hidden" name="sal_amt"  id="sal_amt'+i+'"></td></tr>'
	
		    ); 

	  	};

       <!-- 행삭제 -->
       function delRow(){ 
		  //체크된 행이 없을 경우.
	        if($("input:checkbox[type=checkbox]").is(":checked") == false){  
	        
	              alert("삭제할 행을 선택하여 주십시오.");  
	            
	        } else {                  
	            
	        	$("input:checkbox[type=checkbox]:checked").each(function(index){               
	                    //체크박스를 포함하고 있는 행 제거 
	                    //tr
	                    var clickedRowTr = $(this).parent().parent(); 
	                    //td
	                    var clickedRowTd = clickedRowTr.children();
	                    //체크된 거의 번호랑 테이블행1번의 번호가 같으면 내용만 지우기
	                     
	                    //테이블전체에서 번호 찾기
	                    var first_row_number = $(salTable).find("td:eq(1)").text();
	                    //체크된행의 번호 찾기
	                    var clickedRow_number = clickedRowTr.children().eq(1).text();
	                   //체크된행의 수량
	                    var clicked_buy_sal = clickedRowTd.eq(5).children().val();
	 					//판매금액 tot_sal
	 					var clicked_tot_sal = clickedRowTd.eq(6).children().val();
	 					
	 					//총판매수량
	 					var tot_sal_qty = $("#tot_sal_qty").val();
	 					//총판매금액
	 					var tot_sal_amt = $("#tot_sal_amt").val();
	 					
	 					//총판매수량 - 지울 판매수량 뺴기
	 					var re_tot_sal_qty = tot_sal_qty - clicked_buy_sal;	
	 					var re_tot_sal_amt = tot_sal_amt.replace(/,/gi, "") - clicked_tot_sal.replace(/,/gi, "");
	
	 					document.getElementById('tot_sal_qty').value= re_tot_sal_qty;
	 					
	 					//총판매금액 - 지울 판매금액 빼기
	 					document.getElementById('tot_sal_amt').value= re_tot_sal_amt.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ",");
	 				
	 					//선택된행이 첫번쨰 행일떄
	 					if(clickedRow_number == first_row_number){
	 						$(salTable).find("#prd_cd1").val('');
	 						$(salTable).find("#prd_nm1").val('');
	 						$(salTable).find("#ivco_qty1").val('');
	 						$(salTable).find("#buy_sal1").val('');
	 						$(salTable).find("#tot_sal1").val('');
	 						$('input:checkbox[name=checkbox]').prop('checked', false);
	 						 
	                     }else{
	                     clickedRowTr.remove();
	                     }
						
					     var total = document.getElementById('tot_sal_qty').value;
						 var count = '';
						 var buy_sal = '';
						 var m = 0;
		        		 var totalRowCnt  = $('#salTable > tbody tr').length;     
		        		 for(var l = 1; l <= totalRowCnt; l++){
	
							 count = $(".number:eq(" + l +")");
							 m = l+1;
	
							 count.text(m);
		        		 	 count.html(m);
	
		        		 }
		        		 document.getElementById('tot_sal_qty').value = total;
	                             
	              });                    
	         }            
	
       }
       

		//매장팝업
		function partnerInventory(countNo){
		
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
			
			var totalRowCnt  = $('#salTable > tbody tr').length;
			
			if($('#customSearchInputName').val()==''){
				alert("고객을 검색해주세요.");
				return false;
				
			}
			if($('#sal_tp_cd option:selected').val()=='all'){
				alert("판매구분을 선택해주세요.");
				return false;
				
			}
			
			//prd_cd, prd_nm ivco_qty sal_qty sal_amt
			if($('#prd_cd1').val()=='' || $('#prd_nm1').val()==''|| $('#ivco_qty1').val()==''
				|| $('#buy_sal1').val()=='' || $('#sal_amt1').val()==''){
				alert("상품을 선택해주세요");
				$('#prd_cd1').focus();
				return false;
				
			}

	 		if($('#tot_sal_amt').val() !='' && ($('#csh_stlm_amt').val() == '' && $('#crd_stlm_amt').val() == '')){
				alert("현금이나 카드금액을 확인해주세요.");
				return false;
				
			}
		
			//현금카드 금액이 토탈과 같지 않으면,
			//현금만 있는데 토탈과 같지 않으면
			//카드만 있는데 토탈과 같지 않으면
	 		//현금만 있는데 토탈과 같지 않으면
	 		if (Number($("#crd_stlm_amt").val()) == '' && 
			  (Number($("#tot_sal_amt").val().replace(/,/gi, "")) != Number($("#csh_stlm_amt").val()))){
				alert("금액을 다시 확인해주세요(현금)");
				$("#csh_stlm_amt").val('');
				$("#csh_stlm_amt").focus();
				return false;
			}
			//카드만 있는데 토탈과 같지 않으면
			if(Number($("#csh_stlm_amt").val()) == '' && 
			  (Number($("#tot_sal_amt").val().replace(/,/gi, "")) != Number($("#crd_stlm_amt").val()))){
				alert("금액을 다시 확인해주세요(카드)");
				$("#crd_stlm_amt").val('');
				$("#crd_stlm_amt").focus();
				return false;
			}	
			if(($("#crd_stlm_amt").val() != ''&& $("#csh_stlm_amt").val() != '')&& 
				Number($("#tot_sal_amt").val().replace(/,/gi, "")) > Number($("#csh_stlm_amt").val())+Number($("#crd_stlm_amt").val()) ){
					alert("현금+ 카드 금액이 총 판매금액 보다 작습니다.");
					$("#crd_stlm_amt").val('');
					$("#csh_stlm_amt").focus();
					return false;
			}
			
			//카드금액에 값이 있고, 유효일자가 없을때
			if($('#crd_stlm_amt').val() !='' && $('#vld_ym').val() == ''){
				alert("유효일자를 확인해주세요.");
				$('#vld_ym').focus();
				return false;
				
			}
			//카드금액에 값이 있고, 카드회사가 없을때
			if($('#crd_stlm_amt').val() !='' && $('#crd_co_cd option:selected').val() == '0'){
				alert("카드회사를 확인해주세요.");
				$('#crd_stlm_amt').focus();
				return false;
				
			}
			//카드금액에 값이 있는데 카드번호가 없을때
	 		if($("#crd_stlm_amt").val() != '' && 
	 			($("#crd_no1").val() == '' || $("#crd_no2").val() == '' || $("#crd_no3").val() == '' || $("#crd_no4").val() == '')){
	 			alert("카드번호를 입력해주세요");
	 			$("#crd_no1").focus();
	 			return false;
	 		}
			if($("#crd_stlm_amt").val() != '' &&
				($("#crd_no1").val().length != 4 || $("#crd_no2").val().length != 4 
						|| $("#crd_no3").val().length != 4 || $("#crd_no4").val().length != 4)){
				alert("카드번호는 4자리씩 입력해주세요");
	 			$("#crd_no1").focus();
	 			return false;
			}
			
			for(var s = 1; s <= totalRowCnt; s++){
			
				if($('#buy_sal'+s).val() == '0'|| $('#tot_sal'+s).val()=='0'){
					alert("상품금액을 확인해주세요");
					$('#buy_sal'+s).focus();
					return false;
				}
				
			}
	

	 		//salesRegister
	 		var salesRegister = $("#salesRegisterFrm").serialize();
	 		
	 		if(confirm("판매수금등록 하시겠습니까?")){
				$.ajax({
		            url : "${pageContext.request.contextPath}/sales/salesRegisterEnroll",
		            type :"POST",
		            dataType : "text",
		            data : 
		            	//$('#salesRegisterFrm :input[value!=""]').serialize(), 
							$("#salesRegisterFrm :input")
							    .filter(function(index, element) {
							        return $(element).val() != '';
							    })
							    .serialize(),
		            success : function(data){
						alert("판매수금등록 완료하였습니다.");
		                window.close();
		           	 
		            },
		            error: function(xhr, status, error){
		                alert("등록실패했습니다.(구매재고 및 수량을 다시 확인해주세요)" + error);
		            }
		           
		        });
	 		}
	 		else { 
	 			return false; 
	 		}

		
		});
</script>

</html>