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

<script type="text/javascript" src="http://code.jquery.com/jquery-latest.js"></script>
<!--달력 jquery-->
<script src="https://code.jquery.com/jquery-1.12.4.js"></script>
<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
<link rel="stylesheet" href="http://code.jquery.com/ui/1.8.18/themes/base/jquery-ui.css">
</head>
<style>
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
    margin-top: 44px;
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
	background: url( "https://bit.ly/2JASsV0" )no-repeat;
	width: 20PX;
	height: 18px;
	border :none;
}
#allSearchBtn{
	background: url( "https://bit.ly/2JASsV0" )no-repeat;
	width: 46px;
	height: 50px;
	border:none;
	float:right;
	margin-top : 15px;
}
.required:before {
	content: "*";
	display:inline-block;
	color: red;
	margin-left:-4px;
}
#btn_reset{
	width: 16px;
}
#partnerSearchInputCd{
    background: #dfdddd;
}
#customSearchInputName{
	background: #dfdddd;
}
</style>
<script>

	var i = 0;
	
	//제이쿼리 달력  
	$(function() {
	
       //시작일.
       $('#fromDate').datepicker({
           showOn: "both",                     // 달력을 표시할 타이밍 (both: focus or button)
           buttonImage: "http://jqueryui.com/resources/demos/datepicker/images/calendar.gif", // 버튼 이미지
           //buttonImageOnly : true,             // 버튼 이미지만 표시할지 여부
           //buttonText: "날짜선택",             // 버튼의 대체 텍스트
           dateFormat: "yy-mm-dd",             // 날짜의 형식
           changeMonth: true,
           // 월을 이동하기 위한 선택상자 표시여부
           changeYear: true,
           yearRange: 'c-30:c+50',
           //-30 현제 년도에서 30년전 +10 현재년도 10년후
           //minDate: 0,
           //maxDate: maxDate,
           //maxDate: +7,// 선택할수있는 최소날짜, ( 0 : 오늘 이전 날짜 선택 불가)
          onSelect: function (date) {
        	  
			var toDate = $('#toDate');
			var fromDate = $(this).datepicker('getDate');
			var minDate = $(this).datepicker('getDate');
			toDate.datepicker('setDate', minDate);
			fromDate.setDate(fromDate.getDate() + 7);
			toDate.datepicker('option', 'maxDate', fromDate);
			toDate.datepicker('option', 'minDate', minDate);
			
	        }     
       
	     });
	
         //종료일
          $('#toDate').datepicker({
             showOn: "both", 
             buttonImage: "http://jqueryui.com/resources/demos/datepicker/images/calendar.gif", 
             //buttonImageOnly : true,
             //buttonText: "날짜선택",
             dateFormat: "yy-mm-dd",
             changeMonth: true,
             changeYear: true,
             yearRange: 'c-100:c+10'
             //maxDate: 0,
             //minDate: minDate, // 오늘 이전 날짜 선택 불가
             //onClose: function( selectedDate ) {
                 // 종료일(toDate) datepicker가 닫힐때
                 // 시작일(fromDate)의 선택할수있는 최대 날짜(maxDate)를 선택한 종료일로 지정 
               //  $("#fromDate").datepicker( "option", "maxDate", "minDate", selectedDate );
            // }
         
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

	console.log("jn_prt_cd" + jn_prt_cd);
	console.log("cust_ss_cd" + cust_ss_cd);
	console.log("cust_no" + cust_no);
	console.log("fromDate" + fromDate);
	console.log("toDate" + toDate);
	console.log("타입" + typeof toDate);
	
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
        	//$("#custAllSearchForm").serialize();
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
	        		 tbodyHtml += '<td class="tg-0pky" style="text-align: left;"><div style="float: left;">' + data.list[i].cust_no + '</div></p><input type="button" style="width: 71px;" value="변경이력" onclick="custHistory(' + i + ')" tabindex="11"></td>';
	        		 tbodyHtml += '<input type="hidden" id="cust_no_history' + i +'" value="'+ data.list[i].cust_no+'">';
	        		 tbodyHtml += '<input type="hidden" id="cust_nm_history" value="'+ data.list[i].cust_nm+'">';
	        		 tbodyHtml += '<input type="hidden" id="cust_nm_real' + i + '" value="'+ data.list[i].cust_nm_real+'">'
	        		 tbodyHtml += '<td class="tg-0pky" style="text-align: left;"><div style="float: left;">' + data.list[i].cust_nm + '</div><input type="button" style="width: 64px; margin-left: 8px;" value="상세" tabindex="12"></input></td>';
	        		 tbodyHtml += '<td class="tg-0pky">' + data.list[i].mbl_no + '</td>';
	        		 tbodyHtml += '<td class="tg-0pky">' + data.list[i].cust_ss_cd + '</td>';
	        		 tbodyHtml += '<td class="tg-0pky">' + data.list[i].fst_js_dt + '</td>';
	        		 tbodyHtml += '<td class="tg-0pky" style="text-align: left;">' + data.list[i].partnerVO[0].prt_nm + '</td>';
	        		 tbodyHtml += '<input type="hidden" id="prt_nm" value="'+data.list[i].partnerVO[0].prt_nm +'">'; 
	        		 tbodyHtml += '<td class="tg-0pky" style="text-align: left;">' + data.list[i].lst_upd_id  + '</td>';
	        		 tbodyHtml += '<td class="tg-0pky">' + data.list[i].lst_upd_dt_time + '</td>';
	        		 tbodyHtml += ' </tr>';
	        	 }
				 }
	        	 tbody.append(tbodyHtml);
	        	 
	         },
	         
	         
	         error : function(){
	             alert("에러납니다");
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
       		"childForm", "width=650, height=650, resizable = no, scrollbars = no");    
      }
  
  //고객번호팝업
  function openCustom(){
		 // window.name = "부모창 이름"; 
		 window.name = "CustomPopForm";
		 var custInquiryUrl = "${pageContext.request.contextPath}/customer/customerInquiry"
		 // window.open("open할 window", "자식창 이름", "팝업창 옵션");
		 window.open(custInquiryUrl,
		         "childForm", "width=780, height=650, resizable = no, scrollbars = no");

     }
  
  
	//고객변경이력버튼
  	function custHistory(i){

  		
	   var cust_no_history = $("#cust_no_history" + i).val();  
	  // var cust_nm_history = $("#cust_nm_history").val();
	   var cust_nm_real = $("#cust_nm_real" + i).val();

	   	i = i + 1;
	   
	  	 // window.name = "부모창 이름"; 
	  	 window.name = "HistoryPopForm";
	      var custHistoryUrl = "${pageContext.request.contextPath}/customer/customerHistory?cust_no=" + cust_no_history + "&cust_nm=" + cust_nm_real;
	      // window.open("open할 window", "자식창 이름", "팝업창 옵션");
	      window.open(custHistoryUrl,
	              "childForm", "width=780, height=550, resizable = no, scrollbars = no");

	   
  	}
	
  	function refreshPage(){
  	    window.location.reload();
  	} 

</script>

<body>

	<section>
		<div class="container" id="container">
			<span class="mainTitle">고객조회</span>
			<button type="button"  onclick="refreshPage()">
				<img src="/resources/images/reset_btn.png" alt="btnImages" id="btn_reset">
			</button>
		       <div class="firtBox">
		            <div style="width: 87%; height: 100%; float: left;">
		                <div style=" width: 50%; height: 100%; float: left;">
		                		
		                		<!-- 매장 -->
		                		<p style="float: left; margin-left: 35px;">매장</p>
		                    <div id="prtForm">
		                        <div style="margin-top: 2%; margin-left: 19%;">
		                            <input type="text" id="partnerSearchInputCd"  value= "" readonly>
		                            <input type="text" id="partnerSearchInputName" autofocus tabindex="1">
		                            <button type="button" style="margin-left: 5px;" onclick="openStore()">
										<img src="/resources/images/prtBtn.PNG" alt="btnImages"  id="prtSearchBtnImg" >
									</button>
		                        </div>
		                    </div>
		                    
		                    <!-- 고객상태 -->
		                    
		                    <div style="width: 100%; height: 50%; margin-top: 42px;">
		                        <p class="required" style="float: left; margin-left: 27px; margin-top: -2px;">고객상태</p>
		                        <div id="cusStsRadion" style="margin-top: -3%; margin-left: 18%;">
		                            <input type="radio" id="allStatus" name="status" value="0" checked tabindex="3">전체
		                            <input type="radio" id="nomalStatus" name="status" value="10" tabindex="4" >정상
		                            <input type="radio" id="stopStatus" name="status" value="80" tabindex="5" >중지
		                            <input type="radio" id="doneStatus" name="status" value="90" tabindex="6" >해지
		                        </div>
		                    </div>
		                </div>
		                
		                <div style="width: 50%; height: 100%; margin-left: 50%;">
		                
		                		<!--  고객번호 -->
		                    <div id="custFrom" style="width: 100%; height: 50%;">
		                        <p style="float: left; margin-left: 20px; margin-top: 6px;">고객번호</p>
		                        <div style="margin-top: 2%; margin-left: 19%;">
		                            <input type="text" id="customSearchInputNo"  value= "" tabindex="2">
		                            <button type="button" style="margin-left: -7px;" onclick="openCustom()">
										<img src="/resources/images/search_btn.jpeg" alt="btnImages"  id="custSearchBtn"" >
									</button>
		                            <input type="text" id="customSearchInputName" readonly>
		                        </div>
		                    </div>
		                    
		                    <!-- 가입날짜 -->
		                    <div style="width: 100%; height: 50%;">
		                        <p class="required" style="float: left; margin-left: 18px; margin-top: 1px;">가입날짜</p>
		                        <div style="margin-top: 2px; margin-left: 99px;">
		                            <input type="text" name="fromDate" id="fromDate" value="" tabindex="7">
		                            <input type="text"  name="toDate" id="toDate" value= "" tabindex="8">
		                        </div>
		                    </div>
		                </div>
		            </div>
		
		          
		           <!-- 전체 조회버튼 -->
		            
		             	<input type="button" id="allSearchBtn" onclick="custSearchAllListBtn()" tabindex="9"/>   
		            
		       </div>
		       
		       <button style="float: right; margin-top: 6px; width: 171px; height: 33px; margin-right: 391px;" tabindex="10">신규등록</button>
		       
		           <table class="tg" id="tableForm">
		                <thead>
		                    <tr>
		                        <th class="tg-0pky">고객번호</th>
		                        <th class="tg-0pky">고객이름</th>
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
    </section>
</body>

    
</html>