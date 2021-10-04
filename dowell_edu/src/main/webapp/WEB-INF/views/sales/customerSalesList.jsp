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
				    
            
				    	<button type="button" id="allSearchBtnNull" tabindex="9" >
							<i class="fas fa-search fa-3x"></i>
						</button>
					  
				    </td>
				  </tr>
				  <tr>
				 
				    <td class="th-0lax"><span>고객번호</span></td>
             <td class="th-0lax">
               <input type="text" id="customSearchInputNo"  value= "">
                 <button type="button" style="margin-left: -7px; width: 21px;" onclick="openCustom()">
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
	        <div style="width:82%; height:501px; overflow:auto">
             <table class="tg">
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
               <tbody>
                 <tr>
                   <td class="tg-0lax">2021-08-12</td>
                   <td class="tg-0lax">100000001</td>
                   <td class="tg-0lax">홍길동</td>
                   <td class="tg-0lax">1</td>
                   <td class="tg-0lax">
                     <input type="button" id="custDetail"  value="상세" onclick="" />
                   </td>
                   <td class="tg-0lax">1</td>
                   <td class="tg-0lax">10</td>
                   <td class="tg-0lax">10000</td>
                   <td class="tg-0lax">1</td>
                   <td class="tg-0lax">1000</td>
                   <td class="tg-0lax">lee.jy</td>
                   <td class="tg-0lax">2021-08-05</td>
                 </tr>
               </tbody>
             </table>
            </div>
            <div class="totaldiv" style="width:82%; height:58px;">
		        <table class="tk">
		          <thead>
		            <tr>
		              <td class="tk-0pky">합계</td>
		              <td class="tk-0pky">판매수량</td>
		              <td class="tk-0pky">판매금액</td>
		              <td class="tk-0pky">현금 </td>
		              <td class="tk-0pky">카드</td>
		              <td class="tk-0lax">포인트</td>
		            </tr>
		          </thead>
		        </table>
		     </div>
     	</div>
    </section>
  	<aside>
    
    </aside>
</body>
<script type="text/javascript">
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
  
  //판매등록
  function salesRegister(){
	  window.name = "salesRegisterForm";
		 var custInquiryUrl = "${pageContext.request.contextPath}/sales/customerSalesRegister"
		 
		 window.open(custInquiryUrl,
	         "childsalesRegisterForm", "width=1165, height=790, resizable = no, scrollbars = no");

  }
</script>
</html>