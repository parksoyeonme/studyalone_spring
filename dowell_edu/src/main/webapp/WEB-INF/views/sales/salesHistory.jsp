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
									<span>${param.prt_cd}</span>
									<span>${param.prt_nm}</span>
								</th>
								<th class="tk-0lax">고객번호 :</th>
								<th class="tk-0lax">
									<span>${param.cust_no}</span>
									<span>${param.cust_nm}</span>
								</th>
								<th class="tk-0lax">
									<input type="hidden" id="cust_no" value="${param.cust_no}">
									<input type="hidden" id="sal_dt" value="${param.sal_dt}">
									<input type="hidden" id="prt_cd" value="${param.prt_cd}">
									<input type="hidden" id="sal_no" value="${param.sal_no}">
									<input type="hidden" id="user_id" value="${member.user_id}">
									<input type="hidden" id="member_prt_cd" value="${member.prt_cd}">
								</th>
								<th class="tk-0lax"></th>
								<th class="tk-0lax"></th>
								<th class="tk-0lax"></th>
							  </tr>
							  <tr>
								<td class="tk-0lax">판매수량 :</td>
								<td class="tk-0lax">
									<span>${param.tot_sal_qty}</span>
								</td>
								<td class="tk-0lax">판매금액 :</td>
								<td class="tk-0lax">${param.tot_sal_amt}</td>
								<td class="tk-0lax">현금 :</td>
								<td class="tk-0lax">${param.csh_stlm_amt}</td>
								<td class="tk-0lax">카드 :</td>
								<td class="tk-0lax">${param.crd_stlm_amt}</td>
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
									<input type="text" class="history" name="sal_no" value="${list.sal_seq}" style="width: 30px;" readonly>
									<input type="hidden" id="sal_tp_cd" value="${list.sal_tp_cd}"> 
								</td>
								<td class="tg-0lax">
									<input type="text"  class="history" name="sal_dt" value="${list.sal_dt}" readonly>
								</td>
								<td class="tg-0lax">
									<input type="text"  class="history" name="prd_cd" value="${list.prd_cd}" readonly>
								</td>
								<td class="tg-0lax">
								<input type="text"   class="history"name="prd_nm" value="${list.prd_nm}"  style="width: 183px;" readonly>
									
								<td class="tg-0lax">
								<input type="text"   class="history"name="sal_qty" value="${list.sal_qty}" style="text-align: right;" readonly>
									
								<td class="tg-0lax">
								<input type="text"  class="history" name="sal_amt" value="${list.sal_amt}" style="text-align: right; width: 144px;" readonly>
									
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
            <c:if test="${(member.prt_cd == list[0].prt_cd) and (list[0].sal_tp_cd == 'SAL') }">
            	<input type="button" class="submitBtn" value="반품" id="goSalesReturn" >
            </c:if>
            
       	</div>
	</footer>
</body>
<script>
function getParameter(name) {
    name = name.replace(/[\[]/, "\\[").replace(/[\]]/, "\\]");
    var regex = new RegExp("[\\?&]" + name + "=([^&#]*)"),
        results = regex.exec(location.search);
    return results === null ? "" : decodeURIComponent(results[1].replace(/\+/g, " "));
}
var prt_cd = getParameter("prt_cd");
var prt_nm = getParameter("prt_nm");
var cust_no = getParameter("cust_no");
var cust_nm = getParameter("cust_nm");
var tot_sal_qty = getParameter("tot_sal_qty");
var tot_sal_amt = getParameter("tot_sal_amt");
var csh_stlm_amt = getParameter("csh_stlm_amt");
var crd_stlm_amt = getParameter("crd_stlm_amt");


	$("#goSalesReturn").on("click", function(){
		var sal_tp_cd = $("#sal_tp_cd").val();
		
		var cust_no = $("#cust_no").val();
		var sal_dt = $("#sal_dt").val();
		var prt_cd = $("#prt_cd").val();
		var member_prt_cd =$("#member_prt_cd").val();
		var sal_no = $("#sal_no").val();
		var user_id = $("#user_id").val();
		console.log("member_prt_cd = " + member_prt_cd);
		console.log("prt_cd = " + prt_cd);
		 if(sal_tp_cd != 'SAL'){
			alert("이미 반품된 상품입니다.");
			return false;
		} 
		 
		 if(member_prt_cd != prt_cd){
				alert("해당매장 사용자만 반품이 가능합니다.");
				return false;
		}
	
		 if(confirm("반품 하시겠습니까?")){
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
		       	 	alert("반품을 성공적으로 완료하였습니다.");
		            window.close();
		       	 
		        },
		        error: function(xhr, status, error){
		            alert("반품실패했습니다." + error);
		        }
		       
		    }); 
		 }
	     else { 
	 			return false; 
	 		}
	});
</script>

</html>