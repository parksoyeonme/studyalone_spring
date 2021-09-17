<%@page import="com.dowell.edu.vo.member.MemberVO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
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
  <div class="first-tool">
    <table class="tf" id="tool-table">
      <thead>
        <tr>
          <td class="tg-0lax" >고객번호</td>
          <td class="tg-0lax">
            <input type="text" id="customSearchInputNo">
            <button class="custSearchBtn" onclick="openCustom()">
              <i class="fas fa-search"></i>
            </button>
          </td>
          <td class="tg-0lax">
            <input type="text" id="customSearchInputName" readonly style="background-color:#e4e3e3;">
          </td>
        </tr>
      </thead>
      </table>
      <div class="searchBtn">
        <button onclick="custInfoBtn()">
        	<i class="fas fa-search fa-2x"></i>
        </button>
      </div>
  </div>

    <h4>고객기본정보</h4>
    <div class="detail01">
    <form id="custUpdateFrm" name="custUpdateFrm" action="/customer/custUpdate" method="post">
      <table class="tg">
        <tbody id="custUpdateFrm_tbody">
          <tr style=" border-left: 1px solid #cec9c6; border-top: 1px solid #cec9c6; 
                      border-right:1px solid #cec9c6;">
            <th class="tg-0lax required" >고객명</th>
            <th class="tg-0lax">
              <input type="text" value="${listBtn[0].cust_nm}" name="cust_nm" id="cust_nm" style="width: 72px;">
            </th>
            <th class="tg-0lax required" >생년월일</th>
            <th class="tg-0lax">
             <input type="text" id="brdy_dt" name="brdy_dt" required>
            </th>
            <th class="tg-0lax">성별</th>
            <th class="tg-0lax">
              <input type="radio" name="sex_cd" value="${commCd[13].dtl_cd}" id="sexF" checked>${commCd[13].dtl_cd_nm}
		      <input type="radio" name="sex_cd" value="${commCd[14].dtl_cd}" id="sexM"> ${commCd[14].dtl_cd_nm}
            </th>
          </tr>
          <tr style=" border-left: 1px solid #cec9c6; border-right: 1px solid #cec9c6;">
            <td class="tg-0lax" >생일</td>
            <td class="tg-0lax">
              <input type="radio" name="scal_yn" id="solar" value="0" checked>양력
              <input type="radio" name="scal_yn" id="lunar" value="1" style="margin-left: 33px;">음력
            </td>
            <td class="tg-0lax">결혼기념일</td>
            <td class="tg-0lax">
              <input type="text" id="mrrg_dt" name="mrrg_dt">
            </td>
            <td class="tg-0lax required">직업코드</td>
            <td class="tg-0lax">
              <select id="poc_cd" name="poc_cd" style="width: 144px"> 
	              <option value="" disabled selected hidden></option> 
	              <c:forEach var="commCd" items="${commCd}" begin="3" end="10">
	              		<option value="${commCd.dtl_cd}">${commCd.dtl_cd_nm}</option> 
	               </c:forEach>
	           </select>
            </td>
          </tr>
          <tr style=" border-left: 1px solid #cec9c6; border-right: 1px solid #cec9c6;">
            <td class="tg-0lax required">휴대폰번호</td>
            <td class="tg-0lax">
              <input type="text" name="mbl_no_first" id="mbl_no_first" style="width: 90px;">
              <input type="text" name="mbl_no_middle" id="mbl_no_middle" style="width: 90px;">
              <input type="text" name="mbl_no_end" id="mbl_no_end" style="width: 90px;">
              <button type="button">변경</button>
            </td>
            <td class="tg-0lax" ></td>
            <td class="tg-0lax" colspan="3"></td>
          </tr>
          <tr style=" border-left: 1px solid #cec9c6; border-right:1px solid #cec9c6;">
            <td class="tg-0lax">우편물수령</td>
            <td class="tg-0lax">
              <!-- <input type="radio" id="집" name="집" checked>자택
              <input type="radio" id="회사" name="회사" style="margin-left: 33px;">직장 -->
              <input type="radio" name="psmt_grc_cd" value="${commCd[11].dtl_cd}" id="home" checked >${commCd[11].dtl_cd_nm}
		      <input type="radio" name="psmt_grc_cd" value="${commCd[12].dtl_cd}" id="office">${commCd[12].dtl_cd_nm}
            </td>
            <td class="tg-0lax">이메일</td>
            <td class="tg-0lax">
              <input type="text" id="email_first" name="email_first" style="width: 84px;">@ 
              <input type="text" id="email_end" name="email_end" >
            </td>
            <td class="tg-0lax">휴먼전환일자</td>
            <td class="tg-0lax">
              <input type="text" name="stp_dt" id="stp_dt" disabled>
            </td>
          </tr>
          <tr style=" border-left: 1px solid #cec9c6; border-right: 1px solid #cec9c6;">
            <td class="tg-0lax" >주소</td>
            <td class="tg-0lax" colspan='5'>
              <input type="text" id="zip_cd" name="zip_cd">
              <button type="button">
                <i class="fas fa-search"></i>
              </button>
              <input type="text" style="width: 524px;" id="addr" name="addr">
              <input type="text" id="addr_dtl" name="addr_dtl" placeholder="직접입력">
            </td>
          </tr>
          <tr style=" border-left: 1px solid #cec9c6; border-right: 1px solid #cec9c6;">
            <td class="tg-0lax required">고객상태</td>
            <td class="tg-0lax">
              <input type="radio" name="status" value="${commCd[0].dtl_cd}" id="normal" checked>${commCd[0].dtl_cd_nm}
              <input type="radio" name="status" value="${commCd[1].dtl_cd}" id="stop">${commCd[1].dtl_cd_nm}
              <input type="radio" name="status" value="${commCd[2].dtl_cd}" id="terminate">${commCd[2].dtl_cd_nm}
            </td>
            <td class="tg-0lax required">매장</td>
            <td class="tg-0lax">
              <input type="text" id="partnerSearchInputCd" name="partnerSearchInputCd" style="width: 120px;">
              <button>
                <i class="fas fa-search"></i>
              </button>
              <input type="text" id="partnerSearchInputName" name="jn_prt_cd" style="width: 120px;" disabled>
            </td>
            <td class="tg-0lax">가입일자</td>
            <td class="tg-0lax">
              <input type="text" name="js_dt" id="js_dt" disabled>
            </td>
          </tr>
          <tr style="border-left: 1px solid #cec9c6; border-right: 1px solid #cec9c6;
                      border-bottom: 1px solid #cec9c6;">
            <td class="tg-0lax" colspan='5' style="text-align: right;" >
              <p style="margin-right: 40px">최초가입일자</p>
            </td>
            <td class="tg-0lax">
              <input type="text" name="fst_js_dt" id="fst_js_dt" disabled>
            </td>
          </tr>
          <tr>
            <td class="tg-0lax" colspan='6'><h4 style="margin-left: 2px;">구매</h4></td>
          </tr>
          <tr style=" border-left:1px solid #cec9c6; border-top: 1px solid #cec9c6; 
                      border-bottom: 1px solid #cec9c6; border-right: 1px solid #cec9c6;">
            <td class="tg-0lax">총구매금액</td>
            <td class="tg-0lax">
              <input type="text" name="" id="" value="0" style="text-align: right;" disabled>
            </td>
            <td class="tg-0lax">당월구매금액</td>
            <td class="tg-0lax">
              <input type="text" name="" id="" value="0" style="text-align: right;" disabled>
            </td>
            <td class="tg-0lax">최종구매일</td>
            <td class="tg-0lax">
              <input type="text" name="" id="" value="0" style="text-align: right;" disabled>
            </td>
          </tr>
          <tr>
            <td class="tg-0lax" colspan='6'><h4 style="margin-left: 2px;">수신동의(통합)</h4></td>
          </tr>
          <tr style=" border-left:1px solid #cec9c6; border-top: 1px solid #cec9c6; 
          border-bottom: 1px solid #cec9c6; border-right: 1px solid #cec9c6;">
            <td class="tg-0lax required">이메일수신동의</td>
            <td class="tg-0lax">
              <input type="radio"  name="email_rcv_yn" id="emailY" value="Y" >예
              <input type="radio" name="email_rcv_yn" id="emailN" value="N" style="margin-left: 53px;" checked>아니오
            </td>
            <td class="tg-0lax required">SMS수신동의</td>
            <td class="tg-0lax">
              <input type="radio" name="sms_rcv_yn"  id="smsY" value="Y" >예
              <input type="radio" name="sms_rcv_yn" id="smsN" value="N"  style="margin-left: 53px;" checked>아니오
            </td>
            <td class="tg-0lax required">DM수신동의</td>
            <td class="tg-0lax">
              <input type="radio" name="dm_rcv_yn" id="dmY" value="Y">예
              <input type="radio" name="dm_rcv_yn" id="dmN" value="N" style="margin-left: 53px;" checked>아니오
            </td>
          </tr>
        </tbody>
      </table>
     </form>
    </div>
    <div class="btndiv">
      <button id="storeBtn">저장</button>
    </div>
     </section>
     <aside>
    	<%@include file="/WEB-INF/views/common/nav.jsp" %>
     </aside>
</body>
<script>
	
	//초기화버튼
	function refreshPage(){
	    window.location.reload();
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
	        yearRange: 'c-100:c+0',
	        maxDate: new Date()
	
		});
	
			 //결혼기념일
	    $("#mrrg_dt").datepicker({
	        showOn: "both",                   
	        buttonImage: "http://jqueryui.com/resources/demos/datepicker/images/calendar.gif", 
	        dateFormat: "yy-mm-dd",             
	        changeMonth: true,
	        changeYear: true,
	        yearRange: 'c-100:c+0',
	        maxDate: new Date()
	
	    
	    });
			
	    
	});
	
	//고객번호 keyup
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
	
	//페이진전체조회버튼클릭
	function custInfoBtn(){
		 var cust_no = $("#customSearchInputNo").val();
		
		 console.log("###보내기####" +cust_no);
		$.ajax({
			type:"GET",
	        url:"${pageContext.request.contextPath}/customer/customerDetailList?cust_no=" + cust_no
			 			, dataType: "json",
	         
	         success : function(data){
	        	alert("성공!");
	        	
	        	console.log(data);
	        	console.log(data.list);
	        	const $frm = $(custUpdateFrm);
	        

		       		//고객명
		       		$frm.find($("#cust_nm")).val(data.list[0].cust_nm);
		       		//생년월일
		      		  	$frm.find($("#brdy_dt")).val(data.list[0].brdy_dt);
		      		  	//성별
		           	if(data.list[0].sex_cd == 'M'){
		           		$frm.find($('input[id="sexM"]')).val(data.list[0].sex_cd).prop("checked", true);
		           	}
		           	else{
		           		$frm.find($('input[id="sexF"]')).val(data.list[0].sex_cd).prop("checked", true);
		           		
		           	}
		           		
		      		  	//생일양력음력
		      		  	if(data.list[0].scal_yn == '0'){
		               		$frm.find($('input[id="solar"]')).val(data.list[0].scal_yn).prop("checked", true);
		               	}
		               	else{
		               		$frm.find($('input[id="lunar"]')).val(data.list[0].scal_yn).prop("checked", true);
		               		
		               	}
		      		  	//생일
		      		  	$frm.find($("#mrrg_dt")).val(data.list[0].mrrg_dt);
		      		  	//직업
		      		  	$frm.find($("#poc_cd")).val(data.list[0].poc_cd);
		      		  	//핸드폰
		      		  	$frm.find($("#mbl_no_first")).val(data.list[0].mbl_no_first);
		      		  	$frm.find($("#mbl_no_middle")).val(data.list[0].mbl_no_middle);
		      		  	$frm.find($("#mbl_no_end")).val(data.list[0].mbl_no_end);
		      		  	
		      		  	//우편물수령
		      		  	if(data.list[0].psmt_grc_cd == 'H'){
		               		$frm.find($('input[id="home"]')).val(data.list[0].psmt_grc_cd).prop("checked", true);
		               	}
		               	else{
		               		$frm.find($('input[id="office"]')).val(data.list[0].psmt_grc_cd).prop("checked", true);
		               		
		               	}
		      		  	//이메일
		      		  	$frm.find($("#email_first")).val(data.list[0].email_start);
		      		  	$frm.find($("#email_end")).val(data.list[0].email_end);
		      		  	//휴먼전환일자
		      		  	$frm.find($("#stp_dt")).val(data.list[0].stp_dt);
		      		  	//주소
		      		  	$frm.find($("#zip_cd")).val(data.list[0].zip_cd);
		      		  	$frm.find($("#addr")).val(data.list[0].addr);
		      		  	$frm.find($("#addr_dtl")).val(data.list[0].addr_dtl);
		      		  	//고객상태
		      		  	if(data.list[0].cust_ss_cd =='${commCd[0].dtl_cd}'){
		               		$frm.find($('input[id="normal"]')).val(data.list[0].cust_ss_cd).prop("checked", true);
		               	}
		               	else if(data.list[0].cust_ss_cd == '${commCd[1].dtl_cd}'){
		               		$frm.find($('input[id="stop"]')).val(data.list[0].cust_ss_cd).prop("checked", true);
		               		
		               	}else{
		               		$frm.find($('input[id="terminate"]')).val(data.list[0].cust_ss_cd).prop("checked", true);
		               	}
		      		  	//매장
		      		  	$frm.find($("#partnerSearchInputCd")).val(data.list[0].jn_prt_cd);
		      		  	$frm.find($("#partnerSearchInputName")).val(data.list[0].prt_nm);
		      		  	//가입일자
		      		  	$frm.find($("#js_dt")).val(data.list[0].js_dt);
		      		  	//최초가입일자
		      		  	$frm.find($("#fst_js_dt")).val(data.list[0].fst_js_dt);
		      		  	//이메일 수신
		      		  	if(data.list[0].email_rcv_yn == 'Y'){
		               		$frm.find($('input[id="emailY"]')).val(data.list[0].email_rcv_yn).prop("checked", true);
		               	}
		               	else{
		               		$frm.find($('input[id="emailN"]')).val(data.list[0].email_rcv_yn).prop("checked", true);
		               		
		               	}
		      		  	//sms수신
		      		  	if(data.list[0].sms_rcv_yn == 'Y'){
		               		$frm.find($('input[id="smsY"]')).val(data.list[0].sms_rcv_yn).prop("checked", true);
		               	}
		               	else{
		               		$frm.find($('input[id="smsN"]')).val(data.list[0].sms_rcv_yn).prop("checked", true);
		               		
		               	}
		      		  	//dm수신
		      		  	if(data.list[0].dm_rcv_yn == 'Y'){
		               		$frm.find($('input[id="dmY"]')).val(data.list[0].dm_rcv_yn).prop("checked", true);
		               	}
		               	else{
		               		$frm.find($('input[id="dmN"]')).val(data.list[0].dm_rcv_yn).prop("checked", true);
		               		
		               	}
	         },
	         error(xhr, status, err){
   			  	console.log(xhr, status, err);
   			  	
		      }
	        
			});

	
		
		
	}

</script>
</html>