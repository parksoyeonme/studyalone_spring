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
   <!--달력 jquery-->
   <script src="https://code.jquery.com/jquery-1.12.4.js"></script>
   <script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
   <link rel="stylesheet" href="http://code.jquery.com/ui/1.8.18/themes/base/jquery-ui.css">
  <style type="text/css">
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
    .tg {
      border-collapse: collapse;
      border-spacing: 0;
      width: 82%;
      
    }

    .tg td {
     
      font-family: Arial, sans-serif;
      font-size: 14px;
      overflow: hidden;
      padding: 10px 5px;
      word-break: normal;
    }

    .tg th {
    
      font-family: Arial, sans-serif;
      font-size: 14px;
      font-weight: normal;
      overflow: hidden;
      padding: 10px 5px;
      word-break: normal;
    }

    .tg .tg-0lax {
      text-align: left;
      vertical-align: top
    }
    .first-tool {
      border: 2px solid silver;
      background: rgb(173, 190, 238);
      width: 80%;
      height: 80px;
      margin-left: 38px;
      margin-top: 19px;
    }
    #tool-table{
      margin-left: 15px;
      margin-top: 25px;
      text-align: center;
      float: left;
    }
    #tool-table input{
      height: 26px;
      width: 138px;
      margin-top: -4px;
      margin-left: 19px;
    }
    .custSearchBtn{
      width: 36px;
      height: 32px;
      margin-top: -5px;
      margin-left: -4px;
    }
    .searchBtn{
      float: right;
    }
    .searchBtn button{
      width: 67px;
      height: 60px;
      margin-top: 8px;
    }
    h4{
      margin-top: 14px;
      margin-left: 38px;
      color: gray;
    }
    .detail01 {
      margin-left: 38px;
      margin-top: 10px;
    }
    .detail02{
      margin-left: 38px;
      margin-top: 10px;
    }
    .detail03{
      margin-left: 38px;
      margin-top: 10px;
    }
    .btndiv{
      margin-top: 13px;
      margin-left: 42px;
      width: 80%;
    }
    #storeBtn{
      float: right;
      width: 196px;
      height: 40px;
  }
  button{
    width: 33px;
  }
  aside{
	float: right;
    height: 204px;
    margin-right: -417px;
    margin-top: -604px;
    width: 10%;
}
.required:before {
	content: "*";
	display:inline-block;
	color: red;
	margin-left:-4px;
}
  </style>
</head>

<body>
 <section>
  <h2 style="margin-left: 31px;">고객정보조회</h2>
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
        <button onclick="custInfoBtn"><i class="fas fa-search fa-2x"></i></button>
      </div>
  </div>

    <h4>고객기본정보</h4>
    <div class="detail01">
      <table class="tg">
        <tbody>
          <tr style=" border-left: 1px solid #cec9c6; border-top: 1px solid #cec9c6; 
                      border-right:1px solid #cec9c6;">
            <th class="tg-0lax required" >고객명</th>
            <th class="tg-0lax">
              <input type="text" style="width: 72px;">
            </th>
            <th class="tg-0lax required" >생년월일</th>
            <th class="tg-0lax">
             <input type="text" id="brdy_dt" name="brdy_dt" required>
            </th>
            <th class="tg-0lax">성별</th>
            <th class="tg-0lax">
              <input type="radio" id="여" name="여" value="1" checked>여
              <input type="radio" id="남" name="남" value="2" style="margin-left: 53px;">남
            </th>
          </tr>
          <tr style=" border-left: 1px solid #cec9c6; border-right: 1px solid #cec9c6;">
            <td class="tg-0lax" >생일</td>
            <td class="tg-0lax">
              <input type="radio" id="양" name="양" value="1" checked>양력
              <input type="radio" id="음" name="음" value="1" style="margin-left: 33px;">음력
            </td>
            <td class="tg-0lax">결혼기념일</td>
            <td class="tg-0lax">
              <input type="text" id="mrrg_dt" name="mrrg_dt">
            </td>
            <td class="tg-0lax required">직업코드</td>
            <td class="tg-0lax">
              <select name="직업코드" style="width: 144px;">
                <option value="" disabled selected hidden></option>
                <option value="">학생</option>
                <option value="">회사원</option>
                <option value="">공무원</option>
                <option value="">전문직</option>
                <option value="">주부</option>
                <option value="">연예인</option>
                <option value="">기타</option>
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
            <td class="tg-0lax" >전화번호</td>
            <td class="tg-0lax" colspan="3">
              <input type="text" name="phn_no_first" id="phn_no_first" style="width: 84px;">
              <input type="text" name="phn_no_middle" id="phn_no_middle" style="width: 73px;">
              <input type="text" name="phn_no_end" id="phn_no_end" style="width: 77px;">
            </td>
          </tr>
          <tr style=" border-left: 1px solid #cec9c6; border-right:1px solid #cec9c6;">
            <td class="tg-0lax">우편물수령</td>
            <td class="tg-0lax">
              <input type="radio" id="집" name="집" checked>자택
              <input type="radio" id="회사" name="회사" style="margin-left: 33px;">직장
            </td>
            <td class="tg-0lax">이메일</td>
            <td class="tg-0lax">
              <input type="text" id="email_first" name="email_first" style="width: 84px;">@ 
              <input type="text" id="email_end" name="email_end" >
            </td>
            <td class="tg-0lax">휴먼전환일자</td>
            <td class="tg-0lax">
              <input type="text" name="휴먼일자" id="휴먼일자" disabled>
            </td>
          </tr>
          <tr style=" border-left: 1px solid #cec9c6; border-right: 1px solid #cec9c6;">
            <td class="tg-0lax" >주소</td>
            <td class="tg-0lax" colspan='5'>
              <input type="text">
              <button type="button">
                <i class="fas fa-search"></i>
              </button>
              <input type="text" style="width: 524px;">
              <input type="text" placeholder="직접입력">
            </td>
          </tr>
          <tr style=" border-left: 1px solid #cec9c6; border-right: 1px solid #cec9c6;">
            <td class="tg-0lax required">고객상태</td>
            <td class="tg-0lax">
              <input type="radio" id="정" name="정" value="1" checked>정상
              <input type="radio" id="중" name="중" value="2" style="margin-left: 33px;">중지
            </td>
            <td class="tg-0lax required">매장</td>
            <td class="tg-0lax">
              <input type="text" name="매장" id="매장" style="width: 120px;">
              <button>
                <i class="fas fa-search"></i>
              </button>
              <input type="text" name="매장" id="매장" style="width: 120px;" disabled>
            </td>
            <td class="tg-0lax">가입일자</td>
            <td class="tg-0lax">
              <input type="text" name="가입일자" id="가입일자" disabled>
            </td>
          </tr>
          <tr style="border-left: 1px solid #cec9c6; border-right: 1px solid #cec9c6;
                      border-bottom: 1px solid #cec9c6;">
            <td class="tg-0lax" colspan='5' style="text-align: right;" >
              <p style="margin-right: 40px">최초가입일자</p>
            </td>
            <td class="tg-0lax">
              <input type="text" name="최초가입일자" id="최초가입일자" disabled>
            </td>
          </tr>
          <tr>
            <td class="tg-0lax" colspan='6'><h4>구매</h4></td>
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
            <td class="tg-0lax" colspan='6'><h4>수신동의(통합)</h4></td>
          </tr>
          <tr style=" border-left:1px solid #cec9c6; border-top: 1px solid #cec9c6; 
          border-bottom: 1px solid #cec9c6; border-right: 1px solid #cec9c6;">
            <td class="tg-0lax required">이메일수신동의</td>
            <td class="tg-0lax">
              <input type="radio" name="" id="">예
              <input type="radio" name="" id="" style="margin-left: 53px;">아니오
            </td>
            <td class="tg-0lax required">SMS수신동의</td>
            <td class="tg-0lax">
              <input type="radio" name="" id="">예
              <input type="radio" name="" id="" style="margin-left: 53px;">아니오
            </td>
            <td class="tg-0lax required">DM수신동의</td>
            <td class="tg-0lax">
              <input type="radio" name="" id="">예
              <input type="radio" name="" id="" style="margin-left: 53px;">아니오
            </td>
          </tr>
        </tbody>
        </table>
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

</script>
</html>