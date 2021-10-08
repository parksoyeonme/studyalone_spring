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
						<c:forEach var="listHead" items="${listHead}">
							  <tr>
								<th class="tk-0lax">매장 :</th>
								<th class="tk-0lax">
									<span>${listHead.prt_cd}</span>
									<span>${listHead.prt_nm}</span>
								</th>
								<th class="tk-0lax">고객번호 :</th>
								<th class="tk-0lax">
									<span>${listHead.cust_no}</span>
									<span>${listHead.cust_nm}</span>
								</th>
								<th class="tk-0lax"></th>
								<th class="tk-0lax"></th>
								<th class="tk-0lax"></th>
								<th class="tk-0lax"></th>
							  </tr>
							  <tr>
								<td class="tk-0lax">판매수량 :</td>
								<td class="tk-0lax">
									<span>${listHead.tot_sal_qty}</span>
								</td>
								<td class="tk-0lax">판매금액 :</td>
								<td class="tk-0lax">${listHead.tot_sal_amt}</td>
								<td class="tk-0lax">현금 :</td>
								<td class="tk-0lax">${listHead.csh_stlm_amt}</td>
								<td class="tk-0lax">카드 :</td>
								<td class="tk-0lax">${listHead.crd_stlm_amt}</td>
							  </tr>
						 </c:forEach>
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
								<td class="tg-0lax">${list.sal_no}
								<input type="hidden" id="sal_tp_cd" value="${list.sal_tp_cd}">
								</td>
								<td class="tg-0lax">${list.sal_dt}</td>
								<td class="tg-0lax">${list.prd_cd}</td>
								<td class="tg-0lax">${list.prd_nm}</td>
								<td class="tg-0lax">${list.sal_qty}</td>
								<td class="tg-0lax">${list.sal_amt}</td>
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
	            <input type="button" class="submitBtn" value="반품" id="goSalesReturn" onclick="goSalesReturn()">
       	 	</div>
	</footer>
</body>
<script>

	$("#goSalesReturn").on("click", function(){
		var sal_tp_cd = $("#sal_tp_cd").val();
		
		if(sal_tp_cd != 'SAL'){
			alert("이미 반품된 상품입니다.");
			return false;
		}
		
		var salesReturnFrm = $("form[name=salesReturnFrm]").serialize() ;
		console.log("여깁니다 =" + salesReturnFrm);
	     $.ajax({
	        url : "${pageContext.request.contextPath}/sales/salesReturn",
	        type :"POST",
	        dataType : "json",
	        data : salesReturnFrm,
	        success : function(data){
	       	 
					alert("반품되었습니다.")
				
	            //window.close();
	       	 
	        },
	        error: function(xhr, status, error){
	            alert("반품실패했습니다." + error);
	        }
	       
	    }); 
	    
	});
</script>

</html>