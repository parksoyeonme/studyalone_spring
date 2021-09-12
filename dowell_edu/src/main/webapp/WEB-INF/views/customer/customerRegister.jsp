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
 
<title>신규고객등록</title>
<!--달력 jquery-->
    <script src="https://code.jquery.com/jquery-1.12.4.js"></script>
    <script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
    <link rel="stylesheet" href="http://code.jquery.com/ui/1.8.18/themes/base/jquery-ui.css">
</head>
<style>

.infocontainer {

	width: 94%;
	height: 86px;
	margin-left: 20px;

}

.topTitle{
    font-weight: bold;
    color: gray;
    
    
}
.infoTool{
    margin-top: 13px;
    width: 785px; 
    height:319px;
    border: 1px solid #b7afaf;
   
}
.required:before {
	content: "*";
	display:inline-block;
	color: red;
	margin-left:-4px;
}

.tg {
    border-collapse: collapse;
    border-spacing: 0;
    margin-left: 19px;
    width: 700px;
    border: 2px solid white;
    
}
.tg td {
    border-color: black;
    border-style: solid;
    border-width: 1px;
    font-size: 13px;
    overflow: hidden;
    padding: 10px 5px;
    word-break: normal;
    text-align: center;
    width: 50%;
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
    
.tg .tg-0lax {
    border-color: inherit;
    
    vertical-align: top;
}
.closeDev{
    border: 1px solid rgb(179, 171, 171);
    background-color: rgb(228 219 219);
    width: 783px;
    height: 63px;

    margin-top: 239px;
}
.submitBtn{
    margin-top: 112px;
    width: 90px;
    height: 41px;
    float: right;
    margin-right: 12px;
}
.closeBtn{
    margin-top: 5px;
    margin-right: 10px;
	width: 90px;
    height: 41px;
    float: right;
}
#cust_nm{
    width: 110px;
    margin-right: 29px;

}
#poc_cd{
    width: 151px;   
}
#brdy_dt{
    width: 108px;
    margin-left: 53px;
}
#sexF{
    margin-left: 61px;
}
#sexM{
    margin-left: 27px;
}
#email-start{
    width: 63px;
    margin-left: 20px;

}
#mrrg_dt{
    width: 108px;
    margin-left: 53px;
}

</style>

    <body>
        
            <div class="container">
                <div class="infocontainer">
                        <h3>신규고객등록</h3>
                        <p class="topTitle">고객기본정보</p>
                </div>
              
                	<div class="infoTool">
	                	<form id="registerFrm" name="registerFrm" action="/customer/custRegister" method="post">
		                    <c:if test="${member.user_id != null}">
		                    <table class="tg">
		                        <tbody>
			                        
			                            <tr>
			                                <td class="tg-0lax">
			                                    <span class="required" style="margin-right: 41px; padding-right: 10px;" >고객명</span>
			                                    <input type="text" id="cust_nm" name="cust_nm" maxlength="6" value="" required>
			                                     <input type="hidden" name="session_id" value="${member.user_id}">
			                                </td>
			                                <td class="tg-0lax">
			                                    <span class="required" style="margin-right: 41px;">직업코드</span>
			                                   
			                                    <select id="poc_cd" name="poc_cd"> 
			                                    	<c:forEach var="codeCd" items="${codeCd}" begin="2" end="9">

			                                        <option value="${codeCd.dtl_cd}">${codeCd.dtl_cd_nm}</option> 
			                                     	</c:forEach>
			                                     </select>
			                                </td>
			                            </tr>
			                            <tr>
			                                <td class="tg-0lax">
			                                    <span class="required" style="margin-right: -26px; padding-right: 11px; ">생년월일</span>
			                                    <input type="text" id="brdy_dt" name="brdy_dt" required>
			                                </td>
			                                <td class="tg-0lax">
			                                    <span style="margin-right: -7px; padding-right: 21px;">성별</span>
			                                    <input type="radio" name="sex_cd" value="${codeCd[0].dtl_cd}" id="sexF" checked>여성
			                                    <input type="radio" name="sex_cd" value="${codeCd[1].dtl_cd}" id="sexM"> 남성 
			                                </td>
			                            </tr>
			                            <tr>
			                                <td class="tg-0lax">
			                                    <span class="required" style="padding-left: 30px; margin-right: 12px;">휴대폰번호</span>
			                                        <input type="hidden" name="mbl_no" id="mbl_no">
			                                        <input type="text" name="mbl_no_first" id="mbl_no_first" maxlength="3" onKeyup="SetNum(this)" style="width: 47px; margin-left: 9px;" required>
			                                        <input type="text" name="mbl_no_middle" id="mbl_no_middle" maxlength="4" onKeyup="SetNum(this)" style="width: 50px;" required>
			                                        <input type="text" name="mbl_no_end" id="mbl_no_end" maxlength="4" onKeyup="SetNum(this)" style="width: 50px;" required>
			                                        <br/><span id = "mblcheck" style="margin-left: 121px;"></span>
			                                </td>
			                                <td class="tg-0lax">
			                                    <span style="margin-right: -7px; padding-right: 21px;">생일</span>
			                                    <input type="radio" name="scal_yn" value="0" style="margin-left: 61px;" checked>양력
			                                    <input type="radio" name="scal_yn" value="1" style="margin-left: 27px;"> 음력
			                                </td>
			                            </tr>
			                            <tr>
			                                <td class="tg-0lax">
			                                    <span class="required" >우편물수령</span>
			                                    <input type="radio" name="psmt_grc_cd" style="margin-left: 43px;" value="H" checked required>자택
			                                    <input type="radio" name="psmt_grc_cd" style="margin-left: 36px;" value="O" required> 직장
			                                </td>
			                                <td class="tg-0lax">
			                                    <p style="padding-left: 49px; float:left; margin-top: 1px;">이메일</p>
			                                    <input type="text" id="email_first" name="email_first" style="margin-left: 51px; width: 45px;">@ 
			                                    <input type="text" id="email_end" name="email_end" style="width: 112px;">
			                                    <br/><p id = "emailcheck" style="margin-top: 2px; height: 1px;"></p>
			                                </td>
			                            </tr>
			                            <tr>
			                                <td class="tg-0lax" colspan='2'>
			                                    <p style="float:left; margin-top: 6px; margin-left: 51px;">주소</p>
			                                   
			                                    <input type="text" id="zip_cd" name="zip_cd" style="width: 75px; margin-left: 25px;">
			                                    <button type="button" style="width: 33px;">
			                                        <img src="/resources/images/search_btn.jpeg" alt="btnImages" style="width: 16px;">
			                                    </button>
			                                    <input type="text" id="addr" name="addr" style="width: 256px;">
			                                    <input type="text" id="addr_dtl" name="addr_dtl" placeholder="직접입력">
			                                    
			                                </td>
			                           	 </tr>
			                            <tr>
			                                <td class="tg-0lax">
			                                    <span style="margin-right: -26px;">결혼기념일</span>
			                                    <input type="text" id="mrrg_dt" name="mrrg_dt">
			                                 </td>
			                                <td class="tg-0lax">
			                                    <p style="float: left; margin-left: 58px; margin-top: 4px;">매장</p>
			                                    <input type="text" style="width: 56px; margin-left: 53px;" id="partnerSearchInputCd" name="partnerSearchInputCd">
			                                    <button type="button" style="width: 33px;" onclick="prtBtn()">
			                                        <img src="/resources/images/search_btn.jpeg" alt="btnImages" style="width: 16px;">
			                                    </button>
			                                    <input type="text" style="width: 78px;" id="partnerSearchInputName" name="jn_prt_cd">
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
			                                    <span class="required">이메일수신동의</span>
			                                    <input type="radio" name="email_rcv_yn" value="Y" required>예
			                                    <input type="radio" name="email_rcv_yn" value="N"  required> 아니오
			                                </td>
			                                <td class="tg-0lax">
			                                    <span class="required">SMS수신동의</span>
			                                    <input type="radio" name="sms_rcv_yn"  value="Y" >예
			                                    <input type="radio" name="sms_rcv_yn" value="N" > 아니요
			                                </td>
										  </tr>
										  <tr>
										    <td class="tg-0lax">
										    	<span class="required">TM수신동의</span>
			                                    <input type="radio" name="tm_rcv_yn" value="Y" required>예
			                                    <input type="radio" name="tm_rcv_yn" value="N"  required> 아니오
										    </td>
			                                <td class="tg-0lax">
			                                    <span class="required">DM수신동의</span>
			                                    <input type="radio" name="dm_rcv_yn" value="Y">예
			                                    <input type="radio" name="dm_rcv_yn" value="N" > 아니요
			                                </td>
										  </tr>
										 
										</tbody>
									</table>
								</div>
		                    	<input type="submit" class="submitBtn" id="goNewRegBtn"  value="등록">
		                	</c:if>
							<c:if test="${member.user_id == null}">
								<p>로그인 후에 작성하실 수 있습니다.</p>
							</c:if>
		                </form>
	                    <!-- <input type="submit" class="submitBtn" id="goNewRegBtn" onclick="goNewRegBtn()" value="등록"> -->
                	</div>
                
                <footer>
		            <div class="closeDev">
		                
		                <input type="button" class="closeBtn" value="닫기" onclick="window.close()">
		 
		            </div>
		        </footer>
        	</div>
        
        
    </body>
    <script>
    
    //제이쿼리 달력
        
        $(function(){
       		 //생년월일
        	$("#brdy_dt").datepicker({
	            showOn: "both",                   
	            buttonImage: "http://jqueryui.com/resources/demos/datepicker/images/calendar.gif", 
	            dateFormat: "yy-mm-dd",             
	            changeMonth: true,
	            changeYear: true,
	            yearRange: 'c-100:c+50',

        
        	});

       		 //결혼기념일
	        $("#mrrg_dt").datepicker({
	            showOn: "both",                   
	            buttonImage: "http://jqueryui.com/resources/demos/datepicker/images/calendar.gif", 
	            dateFormat: "yy-mm-dd",             
	            changeMonth: true,
	            changeYear: true,
	            yearRange: 'c-100:c+50',
	
	        
	        });
            
        });
        
        
        //매장팝업
        function prtBtn(){
        	
 	       window.name = "storePopForm";
 	       var storeSearchUrl = "${pageContext.request.contextPath}/common/partnerInquiry";

 	       window.open(storeSearchUrl,
 	       		"childStorePopForm", "width=650, height=650, resizable = no, scrollbars = no");    
 	   
        }
        
         /* $(function(){
        	$("#email_first").on('keyup',emailcheck);
        })
        
        function emailcheck(){
		    var email = $("#email_first").val();
		    var sendData = {"email":email}
		    $.ajax({
		        method : 'POST',
		        url : '/customer/emailCheck',
		        data : sendData,
		        success : function(resp){
		            if(resp=='fail'){
		                $('#emailcheck').css('color','red')
		                $('#emailcheck').html("사용할 수 없는 이메일입니다.")
		                flag=false;
		  
		            }else{
		                $('#emailcheck').css('color','blue')
		                $('#emailcheck').html("사용할 수 있는 이메일입니다.")
		                flag=true;
		            }}
		    })	
		}  */
		 
		
        //이메일 중복체크 - keyup이벤트
		$(function(){
    		$("#email_first, #email_end").on('keyup',emailcheck);
    }) 
    
    //이메일중복체크
    function emailcheck(){
	    var email_first = $("#email_first").val();
	    var email_end = $("#email_end").val();
	    
	    console.log(email_first);
	    console.log(email_end);
	 
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
	            }}
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
	    
	    console.log(mbl_no_first);
	    console.log(mbl_no_middle);
	    console.log(mbl_no_end);
	 
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
	                $('#mblcheck').html("존재하는 휴대폰번호입니다.")
	                flag=false;
	  
	            }else{
	                $('#mblcheck').css('color','blue')
	                $('#mblcheck').html("사용할 수 있는 휴대폰번호입니다.")
	                flag=true;
	            }
	          }
	    })	
	} 
		 
		 
		
		/* 숫자만 되도록 */
		function SetNum(obj) {
		 
		 if ((event.keyCode <= 27) || (event.keyCode >= 33 && event.keyCode <= 46) || (event.keyCode >= 91 && event.keyCode <= 93) || (event.keyCode >= 112 && event.keyCode <= 145)) {
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
	
        /* function goNewRegBtn(){
        	var cust_nm = $("#cust_nm").val();
        	var poc_cd = $("#poc_cd option:selected").val();
        	var brdy_dt= $("#brdy_dt").val();
        	var sex_cd = $('input:radio[name="sex_cd"]:checked').val();
        	var mbl_no = $("#mbl_no_fisrt ").val() + $("#mbl_no_middle").val() + $("#mbl_no_end").val();
        	var scal_yn = $('input:radio[name="scal_yn"]:checked').val();
        	var post_grc_cd = $('input:radio[name="post_grc_cd"]:checked').val();
        	var email = $("#email_start").val() + '@' + $("#email_end").val();
        	var addr  = $("#addr_first").val() + ' ' + $("#addr_middle").val() + ', ' + $("#addr_end").val();
        	var mrrg_dt  = $("#mrrg_dt").val();
        	var jn_prt_no = $("#partnerSearchInputName").val();
        	var email_rcv_yn  = $('input:radio[name="email_rcv_yn "]:checked').val();
        	var sms_rcv_yn = $('input:radio[name="sms_rcv_yn"]:checked').val();
        	var dm_rcv_yn  = $('input:radio[name="dm_rcv_yn "]:checked').val();
        	
        	console.log("cust_nm =" + cust_nm);
        	console.log("poc_cd =" + poc_cd);
        	console.log("brdy_dt =" + brdy_dt);
        	console.log("sex_cd =" + sex_cd);
        	console.log("mbl_no =" + mbl_no);
        	console.log("scal_yn =" + scal_yn);
        	console.log("post_grc_cd =" + post_grc_cd);
        	console.log("email =" + email);
        	console.log("addr =" + addr);
        	console.log("mrrg_dt =" + mrrg_dt);
        	console.log("jn_prt_no =" + jn_prt_no);
        	console.log("email_rcv_yn =" + email_rcv_yn);
        	console.log("sms_rcv_yn =" + sms_rcv_yn);
        	console.log("dm_rcv_yn =" + dm_rcv_yn);
        	
        	$.ajax({
     		   url: "<c:url value='/customer/custRegister'/>",
     			 type: 'POST',
     			 dataType: "json",
     	         data : {
     	       	
     	        	"cust_nm" : cust_nm,
     	        	"poc_cd" : poc_cd,
     	        	"brdy_dt" : brdy_dt,
     	        	"sex_cd" : sex_cd,
     	        	"mbl_no" : mbl_no,
     	        	"scal_yn" : scal_yn,
     	        	"post_grc_cd" : post_grc_cd,
     	        	"email" : email,
     	        	"addr" : addr,
     	        	"mrrg_dt" : mrrg_dt,
     	        	"jn_prt_no" : jn_prt_no,
     	        	"email_rcv_yn" : email_rcv_yn,
     	        	"sms_rcv_yn" : sms_rcv_yn,
     	        	"dm_rcv_yn" : dm_rcv_yn
     	        	
     	         },
     	         success : function(data){
     	        	
     	        	alert("신규고객 등록에 성공하였습니다.");
     		         },
     		         error(xhr, status, err){
     	    			  console.log(xhr, status, err);
     	    			 alert("신규고객 등록에 실패하였습니다.");
     		         }
     	   		});
        }  */
       
       
    </script>
</html>