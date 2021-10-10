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
<title>판매실적조회(팝업)</title>
<link rel="icon" href="data:;base64,iVBORw0KGgo=">
<script src="https://kit.fontawesome.com/108adcc263.js" crossorigin="anonymous"></script>
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/salesHistory.css" />
<link rel="shortcut icon" href="/favicon.ico" type="image/x-icon">
<link rel="icon" href="/favicon.ico" type="image/x-icon">
<script type="text/javascript" src="http://code.jquery.com/jquery-latest.js"></script>
</head>
<body>
	<section>
		<div class="container">
			<div class="infocontainer">
				<table class="tk">
					<tbody>
						
							  <tr>
								<th class="tk-0lax">매장 :</th>
								<th class="tk-0lax">
									<span>${listHead[0].prt_cd}</span>
									<span>${listHead[0].prt_nm}</span>
								</th>
								<th class="tk-0lax">고객번호 :</th>
								<th class="tk-0lax">
									<span>${listHead[0].cust_no}</span>
									<span>${listHead[0].cust_nm}</span>
								</th>
								<th class="tk-0lax">
									<input type="hidden" id="cust_no" value="${listHead[0].cust_no}">
									<input type="hidden" id="sal_dt" value="${listHead[0].sal_dt}">
									<input type="hidden" id="prt_cd" value="${listHead[0].prt_cd}">
									<input type="hidden" id="sal_no" value="${listHead[0].sal_no}">
									<input type="hidden" id="user_id" value="${member.user_id}">
								</th>
								<th class="tk-0lax"></th>
								<th class="tk-0lax"></th>
								<th class="tk-0lax"></th>
							  </tr>
							  <tr>
								<td class="tk-0lax">판매수량 :</td>
								<td class="tk-0lax">
									<span>${listHead[0].tot_sal_qty}</span>
								</td>
								<td class="tk-0lax">판매금액 :</td>
								<td class="tk-0lax">${listHead[0].tot_sal_amt}</td>
								<td class="tk-0lax">현금 :</td>
								<td class="tk-0lax">${listHead[0].csh_stlm_amt}</td>
								<td class="tk-0lax">카드 :</td>
								<td class="tk-0lax">${listHead[0].crd_stlm_amt}</td>
							  </tr>
						 
					</tbody>
					</table>
			</div>
			<div style="margin-top: 15px; width:100%; height:386px; overflow:auto">
				<form id="salesReturnFrm" name="salesReturnFrm">
					<table class="tg">
						<thead>
							<tr>
								<th class="tg-0lax">번호</th>
								<th class="tg-0lax">판매일자</th>
								<th class="tg-0lax">상품코드</th>
								<th class="tg-0lax">상품명</th>
								<th class="tg-0lax">판매수량</th>
								<th class="tg-0lax">판매금액</th>
							</tr>
						</thead>
						<tbody id="salesHistoryListTBody">
						 <c:forEach var="list" items="${list}">
							<tr>
								<td class="tg-0lax">
									<input type="text" name="sal_no" value="${list.sal_no}">
									 <input type="hidden" name="sal_tp_cd" id="sal_tp_cd" value="${list.sal_tp_cd}"> 
								</td>
								<td class="tg-0lax">
									<input type="text" name="sal_dt" value="${list.sal_dt}">
									<%-- <input type="hidden" name="cust_no" id="cust_no" value="${list.cust_no}"> --%>
								</td>
								<td class="tg-0lax">
									<input type="text" name="prd_cd" value="${list.prd_cd}">
									<%-- <input type="hidden" name="prt_cd" id="prt_cd" value="${list.prt_cd}"> --%>
								</td>
								<td class="tg-0lax">
								<input type="text" name="prd_nm" value="${list.prd_nm}">
									
								<td class="tg-0lax">
								<input type="text" name="sal_qty" value="${list.sal_qty}">
									
								<td class="tg-0lax">
								<input type="text" name="sal_amt" value="${list.sal_amt}">
									
							</tr>
						 </c:forEach>
						</tbody>
					</table>
				</form>
			</div>
		</div>
	</section>
	<footer>
		
		<div class="closeDev">
	            <input type="button" class="closeBtn" value="닫기" onclick="window.close()">
	            <input type="button" class="submitBtn" value="반품" id="goSalesReturn" >
       	 	</div>
	</footer>
</body>
<script>

	$("#goSalesReturn").on("click", function(){
		var sal_tp_cd = $("#sal_tp_cd").val();
		
		var cust_no = $("#cust_no").val();
		var sal_dt = $("#sal_dt").val();
		var prt_cd = $("#prt_cd").val();
		var sal_no = $("#sal_no").val();
		var user_id = $("#user_id").val();
		
		if(sal_tp_cd != 'SAL'){
			alert("이미 반품된 상품입니다.");
			return false;
		}
	
		/* var salesReturnFrm = $("form[name=salesReturnFrm]").serialize(); */
	//$("#salesReturnFrm").serialize()
		console.log("여깁니다 =" ,salesReturnFrm);
	     $.ajax({
	        url : "${pageContext.request.contextPath}/sales/salesReturn",
	        type :"POST",
	        dataType : "json",
	        data : {
	        	
	        	"cust_no" : cust_no,
	        	"sal_dt" : sal_dt,
	        	"prt_cd" : prt_cd,
	        	"sal_no" : sal_no,
	        	"user_id" : user_id
	        	
	        },
	        success : function(data){
	       	 
					alert("반품되었습니다.")
				
	            window.close();
	       	 
	        },
	        error: function(xhr, status, error){
	            alert("반품실패했습니다." + error);
	        }
	       
	    }); 
	    
	});
</script>

</html>