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
 
<title>신규고객등록</title>
<link rel="icon" href="data:;base64,iVBORw0KGgo=">
<script src="https://kit.fontawesome.com/108adcc263.js" crossorigin="anonymous"></script>
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/customerRegister.css" />
<!--달력 jquery-->
    <script src="https://code.jquery.com/jquery-1.12.4.js"></script>
    <script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
    <link rel="stylesheet" href="http://code.jquery.com/ui/1.8.18/themes/base/jquery-ui.css">
</head>
    <body>
	    <div class="container">
	        <div class="infocontainer">
	            <h3>신규고객등록</h3>
	            <p class="topTitle">고객기본정보</p>
	        </div>
	      	<c:if test="${member.user_id != null}">
	        	<div class="infoTool">
		         	<form id="registerFrm" name="registerFrm" action="/customer/custRegister" method="post">
		              <table class="tg">
		                  <tbody>
		                       <tr>
		                           <td class="tg-0lax">
		                               <span class="required" style="margin-right: 41px; padding-right: 10px;" >고객명</span>
		                               <input type="text" id="cust_nm" name="cust_nm" maxlength="10" value="" autofocus tabindex="1" required>
		                               <input type="hidden" name="user_id" value="${member.user_id}">
		                           </td>
		                           <td class="tg-0lax">
		                               <span class="required" style="margin-right: 41px;">직업코드</span>
		                               <select id="poc_cd" name="poc_cd"> 
			                               <option value="" disabled selected hidden></option> 
			                               <c:forEach var="codeCd" items="${codeCd}" begin="0" end="7">
			                               		<option value="${codeCd.dtl_cd}">${codeCd.dtl_cd_nm}</option> 
			                                </c:forEach>
		                                </select>
		                           </td>
		                       </tr>
		                       <tr>
		                           <td class="tg-0lax">
		                               <span class="required" style="margin-right: 9px; ">생년월일</span>
		                               <input type="text" id="brdy_dt" name="brdy_dt" required>
		                           </td>
		                           <td class="tg-0lax">
		                               <span style="margin-right: -7px; padding-right: 21px;">성별</span>
		                               <input type="radio" name="sex_cd" value="${codeCd[8].dtl_cd}" id="sexF" checked>${codeCd[8].dtl_cd_nm}
		                               <input type="radio" name="sex_cd" value="${codeCd[9].dtl_cd}" id="sexM">${codeCd[9].dtl_cd_nm} 
		                           </td>
		                       </tr>
		                       <tr>
		                           <td class="tg-0lax">
		                               <span class="required" style="padding-left: 30px; margin-right: 12px;">휴대폰번호</span>
		                                   <input type="hidden" name="mbl_no" id="mbl_no">
		                                   <input type="text" name="mbl_no_first" id="mbl_no_first" maxlength="3" onKeyup="SetNum(this)" style="width: 47px; margin-left: 10px;" required>
		                                   <input type="text" name="mbl_no_middle" id="mbl_no_middle" maxlength="4" onKeyup="SetNum(this)" style="width: 59px;" required>
		                                   <input type="text" name="mbl_no_end" id="mbl_no_end" maxlength="4" onKeyup="SetNum(this)" style="width: 50px;" required>
		                               <br/>
		                               <span id = "mblcheck" style="margin-left: 121px;"></span>
		                           </td>
		                           <td class="tg-0lax">
		                               <span style="margin-right: -7px; padding-right: 21px;">생일</span>
		                               <input type="radio" name="scal_yn" value="0" style="margin-left: 61px;" checked>양력
		                               <input type="radio" name="scal_yn" value="1" style="margin-left: 27px;"> 음력
		                           </td>
		                       </tr>
		                       <tr>
		                           <td class="tg-0lax">
		                               <span class="required" style="margin-left: -11px;">우편물수령</span>
		                               <input type="radio" name="psmt_grc_cd" style="margin-left: 40px;" value="H" checked required>자택
		                               <input type="radio" name="psmt_grc_cd" style="margin-left: 36px;" value="O" required> 직장
		                           </td>
		                           <td class="tg-0lax">
		                               <p style="padding-left: 49px; float:left; margin-top: 1px;">이메일</p>
		                               <input type="text" id="email_first" name="email_first" style="margin-left: 51px; width: 45px;">@ 
		                               <input type="text" id="email_end" name="email_end" style="width: 112px;">
		                               <br/>
		                               <p id = "emailcheck" style="margin-top: 2px; height: 1px;"></p>
		                           </td>
		                       </tr>
		                       <tr>
									<td class="tg-0lax" colspan='2'>
		                               <p style="float:left; margin-top: 6px; margin-left: 46px;">주소</p>
		                               <input type="text" id="zip_cd" name="zip_cd" style="width: 63px; margin-left: 52px; background-color: #f0e9e9;">
		                               <button type="button" style="width: 33px;">
		                               		<i class="fas fa-search"></i>
		                                   <!-- <img src="/resources/images/search_btn.jpeg" alt="btnImages" style="width: 16px;"> -->
		                               </button>
		                               <input type="text" id="addr" name="addr" style="width: 235px; background-color: #f0e9e9;">
		                               <input type="text" id="addr_dtl" name="addr_dtl" placeholder="직접입력">
		                           </td>
		                       </tr>
		                       <tr>
		                           <td class="tg-0lax">
		                               <span style="margin-right: -29px;">결혼기념일</span>
		                               <input type="text" id="mrrg_dt" name="mrrg_dt">
		                            </td>
		                           <td class="tg-0lax">
		                               <p class="required" style="float: left; margin-left: 58px; margin-top: 4px;">매장</p>
		                               <input type="text" style="width: 56px; margin-left: 53px; background-color: #f0e9e9;" id="partnerSearchInputCd" name="partnerSearchInputCd">
		                               <button type="button" style="width: 33px;" onclick="prtBtn()">
		                               		<i class="fas fa-search"></i>
		                                   <!-- <img src="/resources/images/search_btn.jpeg" alt="btnImages" style="width: 16px;"> -->
		                               </button>
		                               <input type="text" style="width: 78px; background-color: #f0e9e9;" id="partnerSearchInputName" name="jn_prt_cd">
		                           </td>
		                       </tr>
		                   </tbody>
		               </table>
		               <p class="topTitle">수신동의</p>
		               <div style="border: 1px solid #b7afaf; height: 79px;">
		               		<table class="tg">
								<tbody>
								  <tr>
								    <td class="tg-0lax">
		                               <span class="required" style="margin-right: 22px;">이메일수신동의</span>
		                               <input type="radio" name="email_rcv_yn" value="Y" required>예
		                               <input type="radio" name="email_rcv_yn" value="N"  required style="margin-left: 43px;" checked> 아니오
		                            </td>
		                            <td class="tg-0lax">
		                               <span class="required" style="margin-right: 33px">SMS수신동의</span>
		                               <input type="radio" name="sms_rcv_yn"  value="Y" >예
		                               <input type="radio" name="sms_rcv_yn" value="N" style="margin-left: 37px;" checked> 아니요
		                            </td>
								  </tr>
								  <tr>
								    <td class="tg-0lax"></td>
		                            <td class="tg-0lax">
		                               <span class="required" style="margin-right: 38px">DM수신동의</span>
		                               <input type="radio" name="dm_rcv_yn" value="Y">예
		                               <input type="radio" name="dm_rcv_yn" value="N" style="margin-left: 37px;" checked> 아니요
		                            </td>
								  </tr>
								</tbody>
							</table>
						</div>
		              	<input type="button" class="submitBtn" id="goNewRegBtn"  value="등록">
		          	</form>
	             <!-- <input type="submit" class="submitBtn" id="goNewRegBtn" onclick="goNewRegBtn()" value="등록"> -->
	        	</div>
			</c:if>
			<c:if test="${member.user_id == null}">
				<p>로그인 후에 작성하실 수 있습니다.</p>
			</c:if>
			<footer>
		      <div class="closeDev">
		          <input type="button" class="closeBtn" value="닫기" onclick="window.close()">
		      </div>
		   </footer>
	 	</div>

    </body>
    <script>
  
    //신규등록고객 폼(goNewRegBtn) 제출
     $("#goNewRegBtn").on("click", function(){
    	 var cust_nm = $("#cust_nm").val();
    	 var mbl_no_fist = $("#mbl_no_first").val();
    	 var mbl_no_middle = $("#mbl_no_middle").val();
    	 var mbl_no_end = $("#mbl_no_end").val();
    	 var email_first = $("#email_first").val();
    	 var jn_prt_no = $("#partnerSearchInputName").val();
    	 var brdy_dt= $("#brdy_dt").val();
    	 var poc_cd = $("#poc_cd option:selected").val();
    
			if(cust_nm == "" || cust_nm.length < 2  ){
				alert("이름을 입력해주세요.");
				$("#ucust_nm").focus();
				return false;
			}
			if( poc_cd == ""){
				alert("직업을 입력해주세요");
				$("#poc_cd").focus();
				return false;
			}
			if( brdy_dt == ""){
				alert("생년월일을 입력해주세요");
				$("#brdy_dt").focus();
				return false;
			}
			
			if(mbl_no_fist == "" || mbl_no_fist.length <3 ){
				alert("핸드폰번호(앞3자리)를 입력해주세요.");
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
			if( $('#mblcheck').css('color','red')){
				alert("사용할 수 없는 번호입니다.");
				$("#mbl_no_end").focus();
				return false;
			}
			
			if($('#emailcheck').css('color','red')){
				alert("사용할 수 없는 이메일입니다.");
				$("#email_first").focus();
				return false;
			}
			
			if( jn_prt_no  == ""){
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
			
			 
			else {
				alert("신규등록진행합니다.")
				$("#registerFrm").submit();
				 
			}
			
		});
	

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
        
        
        //매장팝업
        function prtBtn(){
        	
 	       window.name = "storePopForm";
 	       var storeSearchUrl = "${pageContext.request.contextPath}/common/partnerInquiry";

 	       window.open(storeSearchUrl,
 	       		"childStorePopForm", "width=650, height=650, resizable = no, scrollbars = no");    
 	   
        }
		
        //이메일 중복체크 - keyup이벤트
		$(function(){
	   		$("#email_first, #email_end").on('keyup',emailcheck);
	    }) 
	    
	    //이메일중복체크
	    function emailcheck(){
		    var email_first = $("#email_first").val();
		    var email_end = $("#email_end").val();
		    
		    //console.log(email_first);
		    //console.log(email_end);
		 
	 		if(!(email_first != ""  && email_end != "")){
		    	
		    	$('#emailcheck').html("")
		    	return;
		    
		    }
		    	
		    
		    $.ajax({
		        method : 'POST',
		        url : '/customer/emailCheck',
		        data : {
		        	"email_first" : email_first,
		        	"email_end" : email_end
		    	},
		        success : function(resp){
		            if(resp=='fail'){
		                $('#emailcheck').css('color','red')
		                $('#emailcheck').html("사용할 수 없는 이메일입니다.")
		                flag=false;
		  
		            }else{
		                $('#emailcheck').css('color','blue')
		                $('#emailcheck').html("사용할 수 있는 이메일입니다.")
		                flag=true;
		            }
		         }
		    })	
		} 
		
	    //이메일 중복체크 - keyup이벤트
		$(function(){
	   		$("#mbl_no_first, #mbl_no_middle, #mbl_no_end").on('keyup',mblcheck);
	    }) 
    
	    //이메일중복체크
	    function mblcheck(){
		    var mbl_no_first = $("#mbl_no_first").val();
		    var mbl_no_middle = $("#mbl_no_middle").val();
		    var mbl_no_end = $("#mbl_no_end").val();
		    
		    //console.log(mbl_no_first);
		    //console.log(mbl_no_middle);
		    //console.log(mbl_no_end);
		 
	 		if(!(mbl_no_first != ""  && mbl_no_middle != "" && mbl_no_end != "")){
		    	
		    	$('#mblcheck').html("")
		    	return;
		    
		    }
		    	
		    
		    $.ajax({
		        method : 'POST',
		        url : '/customer/mblCheck',
		        data : {
		        	"mbl_no_first" : mbl_no_first,
		        	"mbl_no_middle" : mbl_no_middle,
		        	"mbl_no_end" : mbl_no_end
		    	},
		        success : function(resp){
		            if(resp=='fail'){
		                $('#mblcheck').css('color','red')
		                $('#mblcheck').html("사용할 수 없는 휴대폰번호입니다.")
		                flag=false;
		  
		            }else{
		                $('#mblcheck').css('color','blue')
		                $('#mblcheck').html("사용할 수 있는 휴대폰번호입니다.")
		                flag=true;
		            }
		          }
		    })	
		} 
		 
		<!-- 밸리데이션 체크 -->
		
		/* 숫자만 되도록 */
		function SetNum(obj) {
		 
		 if ((event.keyCode <= 27) || (event.keyCode >= 33 && event.keyCode <= 46) 
			|| (event.keyCode >= 91 && event.keyCode <= 93) || (event.keyCode >= 112 && event.keyCode <= 145)) {
		  return false;
		 }
		 
		 val=obj.value;
		 re=/[^0-9]/gi;
		 obj.value=val.replace(re,"");
		 
		}
		
		 
		 <!--고객명 한글만입력 -->
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
		 
		<!-- 이메일 영문, 숫자 입력-->
		/*  /^[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*$/i; */
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

	
    </script>
</html>