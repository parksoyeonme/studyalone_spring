<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>고객조회</title>
<link rel="icon" href="data:;base64,iVBORw0KGgo=">
<script src="https://kit.fontawesome.com/108adcc263.js" crossorigin="anonymous"></script>
<script type="text/javascript" src="http://code.jquery.com/jquery-latest.js"></script>
<!--달력 jquery-->
<script src="https://code.jquery.com/jquery-1.12.4.js"></script>
<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
<link rel="stylesheet" href="http://code.jquery.com/ui/1.8.18/themes/base/jquery-ui.css">
</head>
<style>
body{
    width:100%;
    height: 768px;
    overflow: auto;
  }
  *{
    font-family: 'Noto Sans KR', sans-serif;
    list-style:none;
    text-decoration: none;
    border-collapse: collapse;
    margin: 0px;
    padding:0px;
    color:#000;
    
}
.mainTitle{
	margin-left: 43px; 
	font-size: 19px; 
	font-weight: bold;
}
.firtBox {
    border: 2px solid silver;
    background: rgb(173, 190, 238);
    width: 80%;
    height: 100px;
    margin-left: 38px;
   	margin-top: 20px;
}
.prtForm{
	width: 98%; 
	height: 50%;
}
.tg {
    border-collapse: collapse;
    border-spacing: 0;
    margin-left: 44px;
    width: 80%;
    height:100px;
    margin-top: 14px;
}
.tg td {
    border-color: black;
    border-style: solid;
    border-width: 1px;
    overflow: hidden;
    padding: 10px 5px;
    word-break: normal;
}
.tg th {
    border-color: black;
    border-style: solid;
    border-width: 1px;
    overflow: hidden;
    padding: 10px 5px;
    word-break: normal;
    background-color: #cfcdcd;
}
.tg .tg-0pky {
    border-color: inherit;
    text-align: center;
    vertical-align: top
}
#prtSearchBtnImg{
	width: 12PX;
	height: 15px;
	border :none;

}
#custSearchBtn{
	width: 20PX;
	height: 13px;
	border :none;
}
#allSearchBtn{
	width: 55px;
	height: 50px;
	float:right;
	margin-top : 4px;
	margin-right: 10px;
	
}
.required:before {
	content: "*";
	display:inline-block;
	color: red;
	margin-left:-4px;
}
#btn_reset{
	border: none;
    background: white;
}
#partnerSearchInputCd{
    background: #dfdddd;
}
#customSearchInputName{
	background: #dfdddd;
}
.th{
	margin-top: -8px;
	width: 100%;
	margin-left: 5px;
	padding-left: 27px;
}
#newCust{
	float: right;
	margin-top: 6px;
	width: 171px;
	height: 33px;
	margin-right: 391px;
	
}
aside{
	float: right;
    height: 204px;
    margin-right: 75px;
    margin-top: -843px;
    width: 10%;
}
#custDetail{
    float: right;
    width: 64px;
    margin-left: 8px;
}
</style>

	<body>
		<section>
			<div class="container" id="container">
				<span class="mainTitle">고객조회</span>
				<button type="button" id="btn_reset" onclick="refreshPage()">
					<i  class="fas fa-redo fa-1x"></i>
				</button>
		        <div class="firtBox">
		           <table class="th" style="margin-top: 3px;">
					  <tr>
					    <td class="th-0lax">매장
		                            <input type="text" id="partnerSearchInputCd" readonly>
		                            <input type="text" id="partnerSearchInputName" autofocus tabindex="1">
		                            <button type="button" onclick="openStore()">
										<!-- <img src="/resources/images/prtBtn.PNG" alt="btnImages"  id="prtSearchBtnImg" > -->
										<i class="far fa-newspaper"></i>
									</button>
					    </td>
					    <td class="th-0lax">고객번호
					    	<input type="text" id="customSearchInputNo"  value= "" tabindex="2">
                            <button type="button" style="margin-left: -7px;" onclick="openCustom()">
								<i class="fas fa-search"></i>
								<!-- <img src="/resources/images/search_btn.jpeg" alt="btnImages"  id="custSearchBtn"" > -->
							</button>
                            <input type="text" id="customSearchInputName" readonly>
					    </td>
					    <td class="th-0lax">
					    	<button type="button" id="allSearchBtn" onclick="custSearchAllListBtn()"tabindex="9" >
								<i class="fas fa-search fa-3x"></i>
								<!-- <img src="/resources/images/search_btn.jpeg" alt="btnImages"  id="custSearchBtn"" > -->
							</button>
					    </td>
					  </tr>
					  <tr>
					 
					    <td class="th-0lax"><span class="required">고객상태</span>
					    	<input type="radio" id="allStatus" name="status" value="" checked tabindex="3">전체
                            <input type="radio" id="nomalStatus" name="status" value="${custSsCd[0].dtl_cd }" tabindex="4" >정상
                            <input type="radio" id="stopStatus" name="status" value="${custSsCd[1].dtl_cd }" tabindex="5" >중지
                            <input type="radio" id="doneStatus" name="status" value="${custSsCd[2].dtl_cd }" tabindex="6" >해지
					  
					    </td>
					    <td class="th-0lax" ><span class="required">가입날짜</span>
					    	 <input type="text" name="fromDate" id="fromDate" value="" tabindex="7">
		                     <input type="text"  name="toDate" id="toDate" value= "" tabindex="8">
					    </td>
					    <td class="th-0lax"></td>
					  </tr>
					
					</table>
				</div>
		        <button id="newCust" onclick="custRegister();" tabindex="10">신규등록</button>
		        <div style="width:100%; height:701px; overflow:auto">
		            <table class="tg" id="tableForm">
		                <thead>
		                    <tr>
		                        <th class="tg-0pky" style="width: 204px;">고객번호</th>
		                        <th class="tg-0pky" style="width: 132px;">고객이름</th>
		                        <th class="tg-0pky">휴대폰번호</th>
		                        <th class="tg-0pky">고객상태</th>
		                        <th class="tg-0pky" >가입일자</th>
		                        <th class="tg-0pky">가입매장</th>
		                        <th class="tg-0pky">등록자</th>
		                        <th class="tg-0pky">수정일자</th>
		                    </tr>
		                </thead>
		                <tbody id="custListTBody">
		                </tbody>
		            </table>
	            </div>
	     	</div>
	    </section>
	  	 <aside>
	    	<%@include file="/WEB-INF/views/common/nav.jsp" %>
	    </aside>
	</body>
	
<script>
	
	
	//제이쿼리 달력  
	$(function() {
       //시작일.
       $('#fromDate').datepicker({
           showOn: "both",                   
           buttonImage: "http://jqueryui.com/resources/demos/datepicker/images/calendar.gif", 
           dateFormat: "yy-mm-dd",             
           changeMonth: true,
           changeYear: true,
           yearRange: 'c-30:c+50',
           //-30 현제 년도에서 30년전 +50 현재년도 50년후
           onClose: function( selectedDate ) {
                if ($( "#toDate" ).val() < selectedDate)
                {
                    $( "#toDate" ).val(selectedDate);
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
             onClose: function( selectedDate ) {
                 if ($("#fromDate" ).val() > selectedDate)
                 {
                     $("#fromDate" ).val(selectedDate);
                 }
             }
         
         	});
         
          //초기값을 오늘 날짜로 설정
          $('#fromDate').datepicker('setDate', '-7D');
          $('#toDate').datepicker('setDate', 'today');
	       
          
          
     });
  
  
		//전체조회
	  function custSearchAllListBtn(){
	   
	   var jn_prt_cd = $("#partnerSearchInputName").val();
	   var cust_ss_cd = $('input:radio[name="status"]:checked').val();
	   var cust_no = $("#customSearchInputNo").val();
	   var fromDate = $("#fromDate").val();
	   var toDate = $("#toDate").val();
	
	   $.ajax({
		   url: "<c:url value='/customer/custAllSearchList'/>",
			 type: 'POST',
			 dataType: "json",
	         data : {
	       	
	        	"jn_prt_cd" : jn_prt_cd,
	        	"cust_ss_cd" : cust_ss_cd,
	        	"cust_no" : cust_no,
	        	"fromDate" : fromDate,
	        	"toDate" : toDate
	        	
	         },
	         success : function(data){
	        	 var tbody = $('#custListTBody');
					tbody.empty();
					console.log(data);
					
					var tbodyHtml = '';
					 if (data.list.length == 0) {
						
					 }else{
			        	 for(var i =0; i < data.list.length; i++){
			        		 console.log(i);
		
			        		 tbodyHtml += ' <tr>';
			        		 tbodyHtml += '<td class="tg-0pky" style="text-align: left;"><div style="float: left;">' + data.list[i].cust_no + '</div><input type="button" style="width: 71px; margin-left: 20px;" value="변경이력" onclick="custHistory('+ data.list[i].cust_no +')" tabindex="11"></td>';
			        	
			        		 tbodyHtml += '<td class="tg-0pky" style="text-align: left;"><div style="float: left;">' + data.list[i].cust_nm + '</div><input type="button" id="custDetail"  value="상세" onclick="custDetail('+ data.list[i].cust_no +')" tabindex="12"></input></td>';
			        		 tbodyHtml += '<td class="tg-0pky">' + data.list[i].mbl_no + '</td>';
			        		 tbodyHtml += '<td class="tg-0pky">' + data.list[i].cust_ss_cd + '</td>';
			        		 tbodyHtml += '<td class="tg-0pky">' + data.list[i].fst_js_dt + '</td>';
			        		 tbodyHtml += '<td class="tg-0pky" style="text-align: left;">' + data.list[i].partnerVO[0].prt_nm + '</td>';
			        		 tbodyHtml += '<input type="hidden" id="prt_nm" value="'+data.list[i].partnerVO[0].prt_nm +'">'; 
			        		 tbodyHtml += '<td class="tg-0pky" style="text-align: left;">' + data.list[i].lst_upd_id +' / '+ data.list[i].user_nm +  '</td>';
			        		 tbodyHtml += '<td class="tg-0pky">' + data.list[i].lst_upd_dt_time + '</td>';
			        		 tbodyHtml += ' </tr>';
			        	 }
					 }
		        	 tbody.append(tbodyHtml);
		        	 
		         },
		         error(xhr, status, err){
	    			  console.log(xhr, status, err);
		         }
	   		});
	   
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
	  	
	  

		//고객변경이력버튼
	  	function custHistory(cust_no){
			
			var cust_no = cust_no;
	  		
		  	 window.name = "HistoryPopForm";
		  	 var custHistoryUrl = "${pageContext.request.contextPath}/customer/customerHistory?cust_no=" + cust_no;
		  	 window.open(custHistoryUrl,
		              "childForm", "width=780, height=702, resizable = no, scrollbars = no");
	
		}
		
		//초기화버튼
	  	function refreshPage(){
	  	    window.location.reload();
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
		
		//신규등록팝업
		function custRegister(){
			 window.name = "newCustPopForm";
			 var custInquiryUrl = "${pageContext.request.contextPath}/customer/customerRegister"
			 
			 window.open(custInquiryUrl,
		         "childNewCustomPopForm", "width=815, height=800, resizable = no, scrollbars = no");

		}
		
		
		//고객정보조회(상세버튼)
	  	function custDetail(cust_no){
	  		var cust_no = cust_no;
	  		
	  		location.href = "${pageContext.request.contextPath}/customer/customerDetail?cust_no=" + cust_no;
		}
	  	
</script>   
</html>