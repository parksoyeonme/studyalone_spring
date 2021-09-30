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
<html lang="en">

<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>고객정보조회 update</title>
  <link rel="icon" href="data:;base64,iVBORw0KGgo=">
  <script src="https://kit.fontawesome.com/108adcc263.js" crossorigin="anonymous"></script>
  <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/customerDetail.css" />
   <!--달력 jquery-->
   <script src="https://code.jquery.com/jquery-1.12.4.js"></script>
   <script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
   <link rel="stylesheet" href="http://code.jquery.com/ui/1.8.18/themes/base/jquery-ui.css">
</head>

<body>
	<section>
		<span class="mainTitle">고객조회</span>
		  
		<button type="button" id="btn_reset" onclick="refreshPage()">
			<i  class="fas fa-redo fa-1x"></i>
		</button>
		
		<!-- 고객검색 부분  -->
  		<div class="first-tool">
  			<form id="detailSearchFrm" name="detailSearchFrm" action="/customer/customerDetail"  method="post">
				<table class="tf" id="tool-table">
					<thead>
					    <tr>
					      <td class="tg-0lax" >고객번호</td>
					      <td class="tg-0lax">
					        <input type="text" value="${list[0].cust_no}" id="customSearchInputNo" name="cust_no">
					        <button class="custSearchBtn" onclick="openCustom()">
					          <i class="fas fa-search"></i>
					        </button>
					      </td>
					      <td class="tg-0lax" >
					        <input type="text" id="customSearchInputName" value="${list[0].cust_nm}" name="cust_nm" readonly style="background-color:#e4e3e3;">
					      </td>
					      <td>
					      </td>
					    </tr>
					</thead>
				</table>
				<div class="searchBtn">
					<button>
						<i class="fas fa-search fa-2x"></i>
					</button>
      			</div> 
      		</form>
		</div>
		
		<h4>고객기본정보</h4>
		
		<!-- 고객정보조회 LIST 부분 -->
    	<div class="detail01">
			<form id="custUpdateFrm" name="custUpdateFrm" >
				<table class="tg ">
					<tbody id="custUpdateFrm_tbody">
          				<tr style=" border-left: 1px solid #cec9c6; border-top: 1px solid #cec9c6; border-right:1px solid #cec9c6;">
            				<th class="tg-0lax required" >고객명</th>
            				<th class="tg-0lax">
              					<input type="text" value="${list[0].cust_nm}" name="cust_nm" id="cust_nm" maxlength="10" style="width: 72px;">
				            	<input type="hidden" name="user_id" value="${member.user_id}">
				            	<input type="hidden" id="cust_no" name="cust_no" value="${list[0].cust_no}">
           			 		</th>
            				<th class="tg-0lax required" >생년월일</th>
            				<th class="tg-0lax">
            		 			<input type="text" value="${list[0].brdy_dt}" id="brdy_dt" name="brdy_dt" required>
            				</th>
				            <th class="tg-0lax">성별</th>
				            <th class="tg-0lax">
								<input type="radio" name="sex_cd" value="${commCd[13].dtl_cd}" id="sexF" checked
								<c:if test ="${list[0].sex_cd eq commCd[13].dtl_cd}">checked="checked"</c:if>  >
								<label for="sexF">${commCd[13].dtl_cd_nm}</label>
		      					
		      					<input type="radio" name="sex_cd" value="${commCd[14].dtl_cd}" id="sexM" 
		      					<c:if test ="${list[0].sex_cd eq commCd[14].dtl_cd}">checked="checked"</c:if> >
		      					<label for="sexM">${commCd[14].dtl_cd_nm}</label>
            				</th>
						</tr>
						<tr style=" border-left: 1px solid #cec9c6; border-right: 1px solid #cec9c6;">
							<td class="tg-0lax" >생일</td>
						  	<td class="tg-0lax">
							    <input type="radio" name="scal_yn" id="solar" value="0" checked
						    	<c:if test ="${list[0].scal_yn eq 0}">checked="checked"</c:if>>
						    	<label for="solar">양력</label>
						    	
						    	<input type="radio" name="scal_yn" id="lunar" value="1" style="margin-left: 33px;"
						    	<c:if test ="${list[0].scal_yn eq 1}">checked="checked"</c:if>>
						    	<label for="lunar">음력</label>
						  	</td>
							<td class="tg-0lax">결혼기념일</td>
							<td class="tg-0lax">
							  <input type="text" id="mrrg_dt" name="mrrg_dt" value="${list[0].mrrg_dt}">
							</td>
						  	<td class="tg-0lax required">직업코드</td>
						  	<td class="tg-0lax">
						    	<select id="poc_cd" name="poc_cd" style="width: 144px" > 
						     		<option value="" disabled selected>선택</option> 
					     			<c:forEach var="commCd" items="${commCd}" begin="3" end="10">
						     			<option value="${commCd.dtl_cd}"
						     			<c:if test ="${list[0].poc_cd eq commCd.dtl_cd}">selected="selected"</c:if>>${commCd.dtl_cd_nm}</option> 
						      		</c:forEach>
						  		</select>
						  	</td>
						</tr>
						<tr style=" border-left: 1px solid #cec9c6; border-right: 1px solid #cec9c6;">
							<td class="tg-0lax required">휴대폰번호</td>
						  	<td class="tg-0lax">
						    	<input type="text" name="mbl_no_first" id="mbl_no_first" value="${list[0].mbl_no_first}" maxlength="3" onKeyup="SetNum(this)" style="width: 90px;">
						    	<input type="text" name="mbl_no_middle" id="mbl_no_middle" value="${list[0].mbl_no_middle}" maxlength="4" onKeyup="SetNum(this)" style="width: 90px;">
						    	<input type="text" name="mbl_no_end" id="mbl_no_end" value="${list[0].mbl_no_end}" maxlength="4" onKeyup="SetNum(this)" style="width: 90px;">
						    	<button type="button" id="mblcheck" onclick="mbl_check()" value="0">변경</button>
						  	</td>
							<td class="tg-0lax" ></td>
							<td class="tg-0lax" colspan="1"></td>
							<td class="tg-0lax">해지일자</td>
							<td class="tg-0lax">
								<input type="text" name="cncl_dt" id="cncl_dt" value="${list[0].cncl_dt}" placeholder="YYYY-MM-DD" disabled>
						  	</td>
						</tr>
						<tr style=" border-left: 1px solid #cec9c6; border-right:1px solid #cec9c6;">
							<td class="tg-0lax">우편물수령</td>
						  	<td class="tg-0lax">
						    	<input type="radio" name="psmt_grc_cd" value="${commCd[11].dtl_cd}" id="home" checked 
								<c:if test ="${list[0].psmt_grc_cd eq commCd[11].dtl_cd}">checked="checked"</c:if>>
								<label for="home">${commCd[11].dtl_cd_nm}</label>
								<input type="radio" name="psmt_grc_cd" value="${commCd[12].dtl_cd}" id="office"
								<c:if test ="${list[0].psmt_grc_cd eq commCd[12].dtl_cd}">checked="checked"</c:if>>
								<label for="office">${commCd[12].dtl_cd_nm}</label>
							</td>
							<td class="tg-0lax">이메일</td>
							<td class="tg-0lax">
							  	<input type="text" id="email_first" name="email_first" value="${list[0].email_start}" style="width: 84px;">@ 
							  	<input type="text" id="email_end" name="email_end" value="${list[0].email_end}" >
							  	<input type="hidden" id = "emailcheck" value="0">
							</td>
							<td class="tg-0lax">중지일자</td>
							<td class="tg-0lax">
						    		<input type="text" name="stp_dt" id="stp_dt" value="${list[0].stp_dt}" placeholder="YYYY-MM-DD" disabled>
							</td>
						</tr>
						<tr style=" border-left: 1px solid #cec9c6; border-right: 1px solid #cec9c6;">
							<td class="tg-0lax" >주소</td>
						  	<td class="tg-0lax" colspan='5'>
						    	<input type="text" id="zip_cd" name="zip_cd" value="${list[0].zip_cd}">
						    	<button type="button">
						      		<i class="fas fa-search"></i>
						    	</button>
						    	<input type="text" style="width: 524px;" id="addr" name="addr" value="${list[0].addr}">
						    	<input type="text" id="addr_dtl" name="addr_dtl" value="${list[0].addr_dtl}" placeholder="직접입력">
						  	</td>
						</tr>
						<tr style=" border-left: 1px solid #cec9c6; border-right: 1px solid #cec9c6;">
							<td class="tg-0lax required">고객상태</td>
						  	<td class="tg-0lax">
							    <input type="radio" name="cust_ss_cd" value="${commCd[0].dtl_cd}" id="normal" checked
							    <c:if test ="${list[0].cust_ss_cd eq commCd[0].dtl_cd}">checked="checked"</c:if>>
							    <label for="normal">${commCd[0].dtl_cd_nm}</label>
							    
							    <input type="radio" name="cust_ss_cd" value="${commCd[1].dtl_cd}" id="stop"
							    <c:if test ="${list[0].cust_ss_cd eq commCd[1].dtl_cd}">checked="checked"</c:if>>
							    <label for="stop">${commCd[1].dtl_cd_nm}</label>
							    
							    <input type="radio" name="cust_ss_cd" value="${commCd[2].dtl_cd}" id="terminate"
							    <c:if test ="${list[0].cust_ss_cd eq commCd[2].dtl_cd}">checked="checked"</c:if>>
							    <label for="terminate">${commCd[2].dtl_cd_nm}</label>
						  	</td>
						  	<td class="tg-0lax required">매장</td>
						  	<td class="tg-0lax">
						    	<input type="text" id="partnerSearchInputCd" name="prt_nm" value="${list[0].prt_nm}"  style="width: 93px;">
						    	<button type="button" onclick="openStore()">
						     		<i class="fas fa-search"></i>
						    	</button>
						    	<input type="text" id="partnerSearchInputName" name="jn_prt_cd" value="${list[0].jn_prt_cd}" style="width: 120px;" readonly>
						  	</td>
							<td class="tg-0lax">가입일자</td>
							<td class="tg-0lax">
								<c:if test="${list[0].cust_ss_cd eq commCd[0].dtl_cd}">
						    		<input type="text" name="js_dt" id="js_dt" value="${list[0].js_dt}" disabled>
						    	</c:if>
						    	<c:if test="${list[0].cust_ss_cd ne commCd[0].dtl_cd}">
						    		<input type="text" name="js_dt" id="js_dt" value="" placeholder="YYYY-MM-DD" disabled>
						    	</c:if>
							</td>
						</tr>
						<tr style="border-left: 1px solid #cec9c6; border-right: 1px solid #cec9c6; border-bottom: 1px solid #cec9c6;">
						  	<td class="tg-0lax" colspan='5' style="text-align: right;" >
						    	<p style="margin-right: 40px">최초가입일자</p>
						  	</td>
						  	<td class="tg-0lax">
						    	<input type="text" name="fst_js_dt" id="fst_js_dt" value="${list[0].fst_js_dt}" placeholder="YYYY-MM-DD" disabled>
						  	</td>
						</tr>
						<tr>
						  	<td class="tg-0lax" colspan='6'><h4 style="margin-left: 2px;">구매</h4></td>
						</tr>
						<tr style=" border-left:1px solid #cec9c6; border-top: 1px solid #cec9c6; border-bottom: 1px solid #cec9c6; border-right: 1px solid #cec9c6;">
						  	<td class="tg-0lax">총구매금액</td>
						  	<td class="tg-0lax">
						    	<input type="text" name="" id="" value="${list[0].tot_pur_amt}"  style="text-align: right;" placeholder="0" disabled>
						  	</td>
						  	<td class="tg-0lax">당월구매금액</td>
						  	<td class="tg-0lax">
						    	<input type="text" name="" id="" value="${list[0].tot_pur_mm_amt}"  style="text-align: right;" placeholder="0" disabled>
						  	</td>
						  	<td class="tg-0lax">최종구매일</td>
						  	<td class="tg-0lax">
						    	<input type="text" name="" id="" value="${list[0].tot_pur_dt}"  style="text-align: right;" placeholder="0" disabled>
						  	</td>
						</tr>
						<tr>
						  	<td class="tg-0lax" colspan='6'><h4 style="margin-left: 2px;">수신동의(통합)</h4></td>
						</tr>
 
						<tr style=" border-left:1px solid #cec9c6; border-top: 1px solid #cec9c6; border-bottom: 1px solid #cec9c6; border-right: 1px solid #cec9c6;">
						  	<td class="tg-0lax required">이메일수신동의</td>
						  	<td class="tg-0lax">
						    	<input type="radio"  name="email_rcv_yn" id="emailY" value="Y"  
						    	<c:if test ="${list[0].email_rcv_yn eq 'Y'}">checked="checked"</c:if>>
						    	<label for="emailY">예</label>
						    	
						    	<input type="radio" name="email_rcv_yn" id="emailN" value="N" style="margin-left: 53px;" 
								<c:if test ="${list[0].email_rcv_yn eq 'N'}">checked="checked"</c:if>>
								<label for="emailN">아니오</label>
						  	</td>
						  	<td class="tg-0lax required">SMS수신동의</td>
						  	<td class="tg-0lax">
						    	<input type="radio" name="sms_rcv_yn"  id="smsY" value="Y" 
						     	<c:if test ="${list[0].sms_rcv_yn eq 'Y'}">checked="checked"</c:if>>
						     	<label for="smsY">예</label>
						    	
						    	<input type="radio" name="sms_rcv_yn" id="smsN" value="N"  style="margin-left: 53px;"
						     	<c:if test ="${list[0].sms_rcv_yn eq 'N'}">checked="checked"</c:if>>
						     	<label for="smsN">아니오</label>
						  	</td>
						  	<td class="tg-0lax required">DM수신동의</td>
						  	<td class="tg-0lax">
						    	<input type="radio" name="dm_rcv_yn" id="dmY" value="Y"
						     	<c:if test ="${list[0].dm_rcv_yn eq 'Y'}">checked="checked"</c:if>>
						     	<label for="dmY">예</label>
						    	<input type="radio" name="dm_rcv_yn" id="dmN" value="N" style="margin-left: 53px;"
						    	<c:if test ="${list[0].dm_rcv_yn eq 'N'}">checked="checked"</c:if>>
						    	<label for="dmN">아니오</label>
						  	</td>
						</tr>
        			</tbody>
      			</table>
				<div class="btndiv">
					<button type="button" id="detailChgBtn">저장</button>
				</div>
     		</form>
    	</div>
  	
	</section>
	
	<!-- nav바 시작 -->
	<aside>
    	<%@include file="/WEB-INF/views/common/nav.jsp" %>
     </aside>
</body>
<script>
	
	console.log("${list[0]}");
	
	$(document).ready(function(){
		 
	    /*고객상태변경 정상 -> 중지
	  			   정상 <- 중지 -> 해지
	  			   정상 <- 해지
	    */
	        if($("input[name=cust_ss_cd]:checked").val() == ${commCd[0].dtl_cd}){
	            $("#terminate").attr("disabled",true);
	        }
	    	if($("input[name=cust_ss_cd]:checked").val() == ${commCd[2].dtl_cd}){
	              $("#stop").attr("disabled",true);
	        }
	});


	//초기화버튼
	function refreshPage(){
		location.href = "${pageContext.request.contextPath}/customer/CustomerDetail";
	} 
	
	//datepicker 달력
	$(function(){
		//생년월일
		$("#brdy_dt").datepicker({
	        showOn: "both",                   
	        buttonImage: "http://jqueryui.com/resources/demos/datepicker/images/calendar.gif", 
	        dateFormat: "yy-mm-dd",             
	        changeMonth: true,
	        changeYear: true,
	        yearRange: 'c-100:c+100',
	        maxDate: new Date()
	
		});
	
		//결혼기념일
	    $("#mrrg_dt").datepicker({
	        showOn: "both",                   
	        buttonImage: "http://jqueryui.com/resources/demos/datepicker/images/calendar.gif", 
	        dateFormat: "yy-mm-dd",             
	        changeMonth: true,
	        changeYear: true,
	        yearRange: 'c-100:c+100',
	        maxDate: new Date()
	
	    
	    });
			
	    
	});
	
	//고객번호 keyup이벤트
	$("#customSearchInputNo").keyup(function(){
		$("#customSearchInputName").val($(this).val());
		$("#customSearchInputName").removeAttr("disabled");
		
	})
	
	//고객번호팝업
	function openCustom(){
		 
		 window.name = "CustomPopForm";
		 var custInquiryUrl = "${pageContext.request.contextPath}/customer/customerInquiry"
		 
		 window.open(custInquiryUrl,
	         "childCustomPopForm", "width=700, height=650, resizable = no, scrollbars = no");
	
	}
	
	//매장팝업
  	function openStore(){
      
       window.name = "storePopForm";
       var storeSearchUrl = "${pageContext.request.contextPath}/common/partnerInquiry";
       
       window.open(storeSearchUrl,
       		"childStorePopForm", "width=650, height=650, resizable = no, scrollbars = no");    
      }
	
  	<!-- 휴대폰번호 중복체크 -->
  	
	//휴대폰 번호 keyup 이벤트 : 한번이라도 휴대폰번호 수정시 다시 중복검사
	
    $('#mbl_no_first, #mbl_no_middle, #mbl_no_end').keyup(function (mblcheck) {
    	
   			$('#mblcheck').val(0);
   		
	});
  	//휴대폰중복체크
    function mbl_check(){
    	var cust_no = $("#cust_no").val();
	    var mbl_no_first = $("#mbl_no_first").val();
	    var mbl_no_middle = $("#mbl_no_middle").val();
	    var mbl_no_end = $("#mbl_no_end").val();
	    
	    if(!(mbl_no_first != ""  && mbl_no_middle != "" && mbl_no_end != "")){
	    	
	    	$('#mblcheck').html("")
	    	return;
	    
	    }
	    
	    $.ajax({
	        method : 'POST',
	        url : '/customer/mblCheckDetail',
	        data : {
	        	"mbl_no_first" : mbl_no_first,
	        	"mbl_no_middle" : mbl_no_middle,
	        	"mbl_no_end" : mbl_no_end,
	        	"cust_no" : cust_no
	    	},
	        success : function(resp){
	            if(resp=='fail'){
	            	alert("이미 존재하는 번호 입니다.");
	                $('#mblcheck').val(0);
	                flag=false;
	  
	            }else{
	            	alert("사용 가능한 번호 입니다.");
	                $('#mblcheck').val(1);
	                flag=true;
	            }
	        }
	    })
    
	} 
	
	<!-- 이메일 중복체크 -->
 	//이메일 중복체크 - keyup이벤트
	$(function(){
   		$("#email_first, #email_end").on('keyup',emailcheck);
    }) 
   
    //이메일중복체크
    function emailcheck(){
		var cust_no = $("#cust_no").val();
	    var email_first = $("#email_first").val();
	    var email_end = $("#email_end").val();
	    
	 
 		if(!(email_first != ""  && email_end != "")){
	    	
	    	$('#emailcheck').html("")
	    	return;
	    
	    }
	    	
	    
	    $.ajax({
	        method : 'POST',
	        url : '/customer/emailCheckDetail',
	        data : {
	        	"email_first" : email_first,
	        	"email_end" : email_end,
	        	"cust_no" : cust_no
	    	},
	        success : function(resp){
	            if(resp=='fail'){
	                alert("이미 존재하는 이메일 입니다.")
	                $('#emailcheck').val(0);
	                flag=false;
	  
	            }else{
	            	//alert("사용할 수 있는 이메일 입니다.")
	                $('#emailcheck').val(1);
	                flag=true;
	            }
	        }
	    })	
	} 
  
	<!-- 밸리데이션 체크 -->
	
	//숫자만 체크
	function SetNum(obj) {
	 
	 if ((event.keyCode <= 27) || (event.keyCode >= 33 && event.keyCode <= 46) 
		|| (event.keyCode >= 91 && event.keyCode <= 93) || (event.keyCode >= 112 && event.keyCode <= 145)) {
	  return false;
	 }
	 
	 val=obj.value;
	 re=/[^0-9]/gi;
	 obj.value=val.replace(re,"");
	 
	}
	
	 //고객명 -한글입력
	 $(function(){
	       $("#cust_nm").keyup(function (event) {
	            regexp = /[a-z0-9]|[ \[\]{}()<>?|`~!@#$%^&*-_+=,.;:\"'\\]/g;
	            v = $(this).val();
	            if (regexp.test(v)) {
	                alert("한글만 입력가능 합니다.");
	                $(this).val(v.replace(regexp, ''));
	            }
	        });
	       
	      
	});
	//이메일 - 영문, 숫자 입력
	 var email_fregexp = /[0-9a-zA-Z]([-_\.]?[0-9a-zA-Z])*\$/i;
	 var email_eregexp =/[0-9a-zA-Z.]([-_\.]?[0-9a-zA-Z])*\$/i;
	 
	 $(function(){
	       $("#email_first").keyup(function (event) {
	            v = $(this).val();
	            if (!email_fregexp.test(v)) {
	                alert("영문/숫자만 사용 가능합니다.");
	                $(this).val("");
	            }
	        });
	   
	});
	 
	 $(function(){
	       $("#email_end").keyup(function (event) {
	            v = $(this).val();
	            if (!email_eregexp.test(v)) {
	                alert("영문/숫자/, 만 사용 가능합니다.");
	                $(this).val("");
	            }
	        });
	   
	});
	
	 <!-- 수정사항 전송 -->
	 
	 $("#detailChgBtn").on("click", function(){
		 //var cncl_cust_ss_cd = $("#cncl_cust_ss_cd").val();
		 //var cncl =$('input[id="terminate"]').is(':checked')
		 var cust_nm = $("#cust_nm").val();
		 var brdy_dt= $("#brdy_dt").val();
		 var mbl_no_fist = $("#mbl_no_first").val();
		 var mbl_no_middle = $("#mbl_no_middle").val();
		 var mbl_no_end = $("#mbl_no_end").val();
		 var email_first = $("#email_first").val();
		 var jn_prt_cd = $("#partnerSearchInputName").val();
		 var cust_ss_cd = $('input[name="cust_ss_cd"]:checked').val();
		 var poc_cd = $("#poc_cd option:selected").val();
		 var mblcheck= $("#mblcheck").val();
		 var emailcheck= $("#emailcheck").val();
		 var email_first= $("#email_first").val();
		 var emailcheck= $("#emailcheck").val();
		 var cncl_cust_ss_cd = '${list[0].cust_ss_cd}';
			
			
			if(cust_nm == "" || cust_nm.length < 2  ){
				alert("이름을 입력해주세요.");
				$("#cust_nm").focus();
				return false;
			}
			if( brdy_dt == ""){
				alert("생년월일을 입력해주세요");
				$("#brdy_dt").focus();
				return false;
			}
			if( poc_cd == ""){
				alert("직업을 입력해주세요");
				$("#poc_cd").focus();
				return false;
			}
			 if( cncl_cust_ss_cd == ${commCd[2].dtl_cd} && cncl_cust_ss_cd == cust_ss_cd){
				alert("고객상태를 확인해주세요.");
				$('input:radio[id="normal"]').prop("checked", true);
				$('input:radio[id="terminate"]').prop("checked", false);
				return false;
				
			} 
			if(mbl_no_fist == "" || mbl_no_fist.length <3 ){
				alert("핸드폰번호(앞3자리)를 입력해주세요.");
				$("#mbl_no_first").focus();
				return false;
			}
			if( mbl_no_fist == '010'
				|| mbl_no_fist == '011' || mbl_no_fist == '017'|| mbl_no_fist == '019'){
			alert("010, 011, 017,019는 사용하실 수 없는 번호입니다.");
			$("#mbl_no_first").focus();
			return false;
			}
			if( mbl_no_middle == "" ||  mbl_no_middle.length <= 2){
				alert("핸드폰번호(가운데3-4자리)를 입력해주세요.");
				$("#mbl_no_middle").focus();
				return false;
			} 
			if( mbl_no_end == "" || mbl_no_end.length <4 ){
				alert("핸드폰번호(뒤4자리)를 입력해주세요.");
				$("#mbl_no_end").focus();
				return false;
			}
			
			if(mblcheck == '0'){
				alert("휴대폰 중복 확인이 필요합니다.");
				$("#mblcheck").focus();
				return false;
			}
			
			if( !$('input[name="cust_ss_cd"]').is(':checked')){
				alert("고객상태를 확인해주세요");
				$("#cust_ss_cd").focus();
				return false;
			}
			if( jn_prt_cd  == ""){
				alert("매장을 입력해주세요");
				$("#partnerSearchInputName ").focus();
				return false;
			}
			if( !$('input[name="email_rcv_yn"]').is(':checked')){
				alert("이메일수신동의 확인해주세요");
				$("#email_rcv_yn").focus();
				return false;
			}
			if(!$('input[name="sms_rcv_yn"]').is(':checked')){
				alert("SMS수신동의 확인해주세요");
				$("#sms_rcv_yn").focus();
				return false;
			}
			if(!$('input[name="dm_rcv_yn"]').is(':checked')){
				alert("DM수신동의 확인해주세요");
				$("#dm_rcv_yn").focus();
				return false;
			}
			
			
			/* else {
				alert("수정합니다.")
				$("#custUpdateFrm").submit();
			} */
			
			  $.ajax({
		             url : "${pageContext.request.contextPath}/customer/updatecustomerDetail",
		            
		             type :"POST",
		             dataType : "text",
		             data : $("#custUpdateFrm").serialize(),
		             success : function(data){
		            	 
							alert("회원정보수정 성공했습니다.")
						
							location.href = "${pageContext.request.contextPath}/customer/CustomerDetail";
		            	 
		             },
		             error: function(xhr, status, error){
		                 alert("회정보수정 실패했습니다." + error);
		             }
		            
		         });
		});

	 
</script>
</html>