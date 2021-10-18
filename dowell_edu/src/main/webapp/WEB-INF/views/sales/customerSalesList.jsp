<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>고객판매관리</title>
<link rel="icon" href="data:;base64,iVBORw0KGgo=">
<script src="https://kit.fontawesome.com/108adcc263.js" crossorigin="anonymous"></script>
<script type="text/javascript" src="http://code.jquery.com/jquery-latest.js"></script>
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/customerSalesList.css" />
<!--달력 jquery-->
<script src="https://code.jquery.com/jquery-1.12.4.js"></script>
<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
<link rel="stylesheet" href="http://code.jquery.com/ui/1.8.18/themes/base/jquery-ui.css">
</head>
<body>
	<section>
		<div class="container" id="container">
			<span class="mainTitle">고객판매관리</span>
			<button type="button" id="btn_reset" onclick="refreshPage()">
				<i  class="fas fa-redo fa-1x"></i>
			</button>
	        <div class="firtBox">
	           <table class="th" style="margin-top: 3px;">
				  <tr>
				    <td class="th-0lax required">판매일자</td>
                    <td class="th-0lax">
						<input type="text" name="fromDate" id="fromDate">
                      	<input type="text" name="toDate" id="toDate">
				    </td>
				    <td class="th-0lax required">매장</td>
             		<td class="th-0lax">
						<input type="text" id="partnerSearchInputCd" readonly>
						<input type="text" id="partnerSearchInputName">
						<button type="button" onclick="openStore()">
							<i class="far fa-newspaper"></i>
       					</button>
             		</td>
				    <td class="th-0lax">
				    	<button type="button" id="allSearchBtn" onclick="custSearchAllListBtn()" tabindex="9" >
							<i class="fas fa-search fa-3x"></i>
						</button>
				    </td>
				  </tr>
				  <tr>
				    <td class="th-0lax"><span>고객번호</span></td>
             		<td class="th-0lax">
               			<input type="text" id="customSearchInputNo"  value= "">
                 		<button type="button" style="margin-left: -7px; width: 21px; " onclick="openCustom()">
                   			<i class="fas fa-search"></i>
                 		</button>
               			<input type="text" id="customSearchInputName" readonly>
            		</td>
				    <td class="th-0lax" ></td>
				    <td class="th-0lax"></td>
				    <td class="th-0lax"></td>
				  </tr>
				</table>
			</div>
	        <button id="newCust" onclick="salesRegister();">판매등록</button>
	        <div style="width: 82%; float:left; height: 701px; overflow-y:auto;overflow-x:hidden;">
				<table class="tg" id="salseListTtable">
              		<thead>
	                	<tr>
	                   		<th class="tg-0pky" rowspan="2">판매일자</th>
	                   		<th class="tg-0pky" rowspan="2">고객번호</th>
	                   		<th class="tg-0pky" rowspan="2">고객명</th>
	                   		<th class="tg-0pky" colspan="2" rowspan="2">판매번호</th>
	                   		<th class="tg-0pky" colspan="2">판매</th>
	                   		<th class="tg-0pky" colspan="3">수금</th>
	                   		<th class="tg-0pky" rowspan="2">등록자</th>
	                   		<th class="tg-0lax" rowspan="2">등록시간</th>
	                 	</tr>
                 		<tr>
	                   		<th class="tg-0pky">수량</th>
	                   		<th class="tg-0pky">금액</th>
	                   		<th class="tg-0pky">현금</th>
	                   		<th class="tg-0pky">카드</th>
	                   		<th class="tg-0pky">포인트</th>
                 		</tr>
               		</thead>
               		<tbody id="salseListTBody" style="overflow-y:auto;overflow-x:hidden;">
               		</tbody>
             	</table>
             	
				<table class="tk" id="totalAmount">
					<thead id="totalAmountThead">
		          	</thead>
		        </table>
			 </div> 
     	</div>
    </section>
  	<aside>
    	<%@include file="/WEB-INF/views/common/nav.jsp" %>
    </aside>
</body>
<script type="text/javascript">
	//초기화버튼
	function refreshPage(){
		location.href = "${pageContext.request.contextPath}/sales/customerSalesList";
	} 
	  
	//제이쿼리 달력  
	$(function () {
	    //시작일.
	    $('#fromDate').datepicker({
	      showOn: "both",
	      buttonImage: "http://jqueryui.com/resources/demos/datepicker/images/calendar.gif",
	      dateFormat: "yy-mm-dd",
	      changeMonth: true,
	      changeYear: true,
	      yearRange: 'c-30:c+50',
	      //-30 현제 년도에서 30년전 +50 현재년도 50년후
	      onClose: function (selectedDate) {
	        if ($("#toDate").val() < selectedDate) {
	          $("#toDate").val(selectedDate);
	        }
	      }
	    });
	    //종료일
	    $('#toDate').datepicker({
	      showOn: "both",
	      buttonImage: "http://jqueryui.com/resources/demos/datepicker/images/calendar.gif",
	      dateFormat: "yy-mm-dd",
	      changeMonth: true,
	      changeYear: true,
	      yearRange: 'c-100:c+10',
	      onClose: function (selectedDate) {
	        if ($("#fromDate").val() > selectedDate) {
	          $("#fromDate").val(selectedDate);
	        }
	      }
	    });
	    //초기값을 오늘 날짜로 설정
	    $('#fromDate').datepicker('setDate', '-7D');
	    $('#toDate').datepicker('setDate', 'today');
	  });
  
  	//고객판매수금등록
	function salesRegister(){
	 	window.name = "salesRegisterForm";
	 	var custInquiryUrl = "${pageContext.request.contextPath}/sales/customerSalesRegister"
	 
	 	window.open(custInquiryUrl,
	        "childsalesRegisterForm", "width=1165, height=800, resizable = no, scrollbars = no");
	
	}
	  
	//매장팝업
	function openStore(){
	
	    // window.name = "부모창 이름"; 
	    window.name = "storePopForm";
	    var storeSearchUrl = "${pageContext.request.contextPath}/common/partnerInquiry";
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
	
	//고객번호 keyup
	$("#customSearchInputNo").keyup(function(){
		$("#customSearchInputName").val($(this).val());
		$("#customSearchInputName").removeAttr("disabled");
		
	})
	//매장 keyup
	$("#partnerSearchInputName").keyup(function(){
		$("#partnerSearchInputCd").val($(this).val());
		$("#partnerSearchInputCd").removeAttr("disabled");
		
	})
	
	//전체조회
	  function custSearchAllListBtn(){
	   
	   var jn_prt_cd = $("#partnerSearchInputName").val();
	   var cust_no = $("#customSearchInputNo").val();
	   var fromDate = $("#fromDate").val();
	   var toDate = $("#toDate").val();
	
	   if(jn_prt_cd == ''){
		   alert("매장을 선택해주세요");
		   return false;
	   }
	   $.ajax({
		   url: "<c:url value='/sales/salesAllSearchList'/>",
			 type: 'POST',
			 dataType: "json",
	         data : {
	        	"jn_prt_cd" : jn_prt_cd,
	        	"cust_no" : cust_no,
	        	"fromDate" : fromDate,
	        	"toDate" : toDate
	         },
	         success : function(data){
	        	 var tot_sal_qty = 0;
	        	 var tot_sal_amt = 0;
	        	 var csh_stlm_amt = 0;
	        	 var crd_stlm_amt = 0;
	        	 var pnt_stlm_amt = 0;
	        	
	        	 var $amount = $('#totalAmountThead');
	        	 $amount.empty();
	        	 var amountHtml = '';
	        	 
	        	 var tbody = $('#salseListTBody');
					tbody.empty();
					console.log(data);
					
					var tbodyHtml = '';
					 if (data.list.length == 0) {
						
					 }else{
			        	 for(var i =0; i < data.list.length; i++){
			        		 console.log(i);
			        		 tbodyHtml += ' <tr class="tableTr">';
			        		 tbodyHtml += '<td class="tg-0lax" style="text-align: center;">' + data.list[i].sal_dt  +'<input type="hidden" id="sal_dt" value="'+data.list[i].sal_dt+'"></td>';
			        		 tbodyHtml += '<td class="tg-0lax" style="text-align: center;">' + data.list[i].cust_no + '</td>';
			        		 tbodyHtml += '<td class="tg-0lax" style="text-align: left; ">'+ data.list[i].cust_nm + '<input type="hidden" id="prt_cd" value="'+data.list[i].prt_cd+'"></td>';
			        		 tbodyHtml += '<td class="tg-0lax" style="border-right: 1px solid #ffffff; text-align: left;">' + data.list[i].sal_no + '<input type="hidden" id="sal_no" value="' + data.list[i].sal_no + '"></td>';
			        		 tbodyHtml += '<td class="tg-0lax" style="text-align: right; width: 5px;"><input type="button" style="width: 39px;" id="salesDetail"  value="상세" onclick="salesDetail('+ data.list[i].sal_no +','+'\''+ data.list[i].cust_no +'\''+','+'\''+ data.list[i].sal_dt +'\''+','+'\''+ data.list[i].prt_cd +'\''+','+'\''+ data.list[i].tot_sal_qty.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ",")+'\''+','+'\''+data.list[i].tot_sal_amt.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ",")+'\''+','+'\''+ data.list[i].csh_stlm_amt.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ",")+'\''+','+'\''+data.list[i].crd_stlm_amt.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ",")+'\''+','+'\''+data.list[i].prt_nm+'\')" /></td>';
			        		 tbodyHtml += '<td class="tg-0lax" style="text-align: right;">'+ data.list[i].tot_sal_qty.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ",") +'<input type="hidden" id="ht_tot_sal_qty" value="data.list[i].tot_sal_qty"></td>';
			        		 tbodyHtml += '<td class="tg-0lax" style="text-align: right;">'+ data.list[i].tot_sal_amt.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ",") +'<input type="hidden" id="ht_tot_sal_amt" value="data.list[i].tot_sal_amt"></td>';
			        		 tbodyHtml += '<td class="tg-0lax" style="text-align: right;">'+ data.list[i].csh_stlm_amt.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ",") +'<input type="hidden" id="ht_csh_stlm_amt" value="data.list[i].csh_stlm_amt"></td>';
			        		 tbodyHtml += '<td class="tg-0lax" style="text-align: right;">'+ data.list[i].crd_stlm_amt.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ",") +'<input type="hidden" id="ht_crd_stlm_amt" value="data.list[i].crd_stlm_amt"></td>';
			        		 tbodyHtml += '<td class="tg-0lax" style="text-align: right;">'+ data.list[i].pnt_stlm_amt.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ",") +'<input type="hidden" id="ht_pnt_stlm_amt" value="data.list[i].pnt_stlm_amt"></td>';
			        		 tbodyHtml += '<td class="tg-0lax" style="text-align: left;">'+ data.list[i].user_nm +'</td>';
			        		 tbodyHtml += '<td class="tg-0lax" style="text-align: center;">'+ data.list[i].lst_upd_dt_time +'</td>';
			        		 tbodyHtml += '</tr>';
			        		 
			        		 tot_sal_qty += data.list[i].tot_sal_qty;
			        		 tot_sal_amt += data.list[i].tot_sal_amt;
				        	 csh_stlm_amt += data.list[i].csh_stlm_amt;
				        	 crd_stlm_amt += data.list[i].crd_stlm_amt;
				        	 pnt_stlm_amt += data.list[i].pnt_stlm_amt;
			        	 }
			        	 console.log("$$$$$$$$$$$ =" + tot_sal_qty);
			        	 console.log("$$$$$$$$$$$ =" + tot_sal_amt);
			        	 console.log("$$$$$$$$$$$ =" + csh_stlm_amt);
			        	 console.log("$$$$$$$$$$$ =" + crd_stlm_amt);
			        	 console.log("$$$$$$$$$$$ =" + pnt_stlm_amt);
			        	 
					 }
		        	 tbody.append(tbodyHtml);
		        	
		        	  amountHtml += ' <tr>';
		        	  amountHtml += '<td class="tk-0pky" style="width: 514px; text-align: center;">합계</td>';
		        	  amountHtml += '<td class="tk-0pky" style="width: 65px;">' + tot_sal_qty.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ",") + '</td>';
		        	  amountHtml += '<td class="tk-0pky" style="width: 134px;"> ' + tot_sal_amt.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ",") + '</td>';
		        	  amountHtml += '<td class="tk-0pky" style="width: 135px;">' + csh_stlm_amt.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ",") + '</td>';
		        	  amountHtml += '<td class="tk-0pky" style="width: 133px;">' + crd_stlm_amt.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ",") + '</td>';
		        	  amountHtml += '<td class="tk-0pky" style="width: 90px;">' + pnt_stlm_amt.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ",") + '</td>';
		        	  amountHtml += '<td class="tk-0pky"></td>';

		        	  amountHtml += '</tr>'; 
		        	  $amount.append(amountHtml);
		         },
		         error(xhr, status, err){
	    			  console.log(xhr, status, err);
		         }
	   		});
	   
	  	}
	
	
	//salesDetail
	//고객정보조회(상세버튼)
   	function salesDetail(sal_no,cust_no,sal_dt,prt_cd,tot_sal_qty,tot_sal_amt,csh_stlm_amt,crd_stlm_amt,prt_nm){
  		
  		 
  		 window.name = "salesHistoryPopForm";
           var custHistoryUrl = "${pageContext.request.contextPath}/sales/salesHistory?sal_no="+sal_no+"&cust_no=" +cust_no+"&sal_dt="+sal_dt+"&prt_cd="+prt_cd+"&tot_sal_qty="+tot_sal_qty+"&tot_sal_amt="+tot_sal_amt+"&csh_stlm_amt="+csh_stlm_amt+"&crd_stlm_amt="+crd_stlm_amt+"&prt_nm="+prt_nm;
	  	 window.open(custHistoryUrl,
	             "childForm", "width=780, height=600, resizable = no, scrollbars = no");
	}
	
	
	
</script>
</html>