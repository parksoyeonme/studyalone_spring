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
<title>고객조회</title>
<link rel="icon" href="data:;base64,iVBORw0KGgo=">
<script src="https://kit.fontawesome.com/108adcc263.js" crossorigin="anonymous"></script>
<script type="text/javascript" src="http://code.jquery.com/jquery-latest.js"></script>
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/customerSalesRegister.css" />
<!--달력 jquery-->
<script src="https://code.jquery.com/jquery-1.12.4.js"></script>
<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
<link rel="stylesheet" href="http://code.jquery.com/ui/1.8.18/themes/base/jquery-ui.css">
</head>
<body>
    <section>
        <div class="container" id="container">
            <span class="mainTitle">고객판매수금등록</span>
            <button type="button" id="btn_reset" onclick="refreshPage()">
                <i class="fas fa-redo fa-1x"></i>
            </button>
        <div class="firtBox">
            <table class="th" style="margin-top: 3px;">
                <tr>
                    <td class="th-0lax required">판매일자</td>
                    <td class="th-0lax">
                    	<input type="date" id="now_date" readonly>
                    </td>
                    <td class="th-0lax required">판매구분</td>
                    <td class="th-0lax">
                        <select id="" name="" style="width: 159px;"> 
                            <option value="" disabled selected >전체</option> 
                            <option value="${SaltpCd[1].dtl_cd}">${SaltpCd[1].dtl_cd_nm}</option>
                            <option disabled value="${SaltpCd[0].dtl_cd}">${SaltpCd[0].dtl_cd_nm}</option>
                        </select>
                    </td>
                    <td class="th-0lax">
                    <c:if test="${member != null}">
                        <button type="button" id="allSearchBtn" onclick="custSearchAllListBtn()">
                        <i class="fas fa-search fa-3x"></i>
                        </button>
                    </c:if>
                    <c:if test="${member == null}">
                        <button type="button" id="allSearchBtnNull" tabindex="9">
                        <i class="fas fa-search fa-3x"></i>
                        </button>
                    </c:if>
                    </td>
                </tr>
                <tr>
                    <td class="th-0lax required"><span>고객번호</span></td>
                    <td class="th-0lax">
                        <input type="text" id="customSearchInputNo" value="">
                        <button type="button" style="margin-left: -7px; width: 21px;" onclick="openCustom()">
							<i class="fas fa-search"></i>
						</button>
                        <input type="text" id="customSearchInputName" readonly>
                    </td>
                    <td class="th-0lax"></td>
                    <td class="th-0lax"></td>
                    <td class="th-0lax"></td>
                </tr>

            </table>
        </div>
        <!--두번째 시작-->
        <div class="secondBox">
            <table class="th" style="margin-top: 3px;">
                <tr>
                    <td class="th-0lax" style="padding: 17px;">현금</td>
                    <td class="th-0lax">
                        <input type="text" name="" id="">
                    </td>
                    <td class="th-0lax">카드금액</td>
                    <td class="th-0lax">
                        <input type="text" name="" id="">
                    </td>
                    <td class="th-0lax">유효일자</td>
                    <td class="th-0lax">
                        <input type="text" name="" id="">
                    </td>
                </tr>
                <tr>
                    <td class="th-0lax">카드회사</td>
                    <td class="th-0lax">
                        <select id="" name="" style="width: 159px;"> 
                            <option value="" disabled selected >선택</option> 
                            <option value="">가</option>
                            <option value="">나</option>
                            <option value="">다</option>
                            <option value="">라</option>
                        </select>
                    </td>
                    <td class="th-0lax">카드번호</td>
                    <td class="th-0lax">
                        <input type="text" name="" id="">
                    </td>
                    <td class="th-0lax">
                        <input type="text" name="" id="">
                    </td>
                    <td class="th-0lax">
                        <input type="text" name="" id="">
                    </td>
                    <td class="th-0lax">
                        <input type="text" name="" id="">
                    </td>
                </tr>
            </table>
        </div>
        <!--버튼 누르면 테이블 행 추가 삭제-->
        <div id="adddeletBtn">
            <input type='button' value='행추가' id="addRow" onclick='addRow()'/>
            <input type='button' value='행삭제' onclick='delRow()'/>
           
        </div>
        <div style="margin-top: 15px; width:95%; height:301px; overflow-y:auto;overflow-x:hidden;">
            <table class="tg" id="salTable">
                <thead>
                    <tr class="title">
                        <th class="tg-0lax">선택</th>
                        <th class="tg-0lax">번호</th>
                        <th class="tg-0lax">상품코드</th>
                        <th class="tg-0lax">상품명</th>
                        <th class="tg-0lax">매장재고</th>
                        <th class="tg-0lax">판매수량</th>
                        <th class="tg-0lax">판매금액</th>
                    </tr>
                </thead>
                <tbody id="salTabletbody">
                <tr>
	                <td>
	                	<input type="checkbox">
	                </td>

	           		<td class="tg-0lax" id="count">1
	           		</td>
	            	<td class="tg-0lax">
	            		<input type="text" name="prd_cd" id="prd_cd">
	            		<button type="button" onclick="partnerInventory()">
	            			<i class="fas fa-search"></i>
	            		</button>
	            	</td>
		            <td class="tg-0lax">상품명</td>
		            <td class="tg-0lax">100</td>
		            <td class="tg-0lax">
		            	<input type="text" name="" id="">
		            </td>
		            <td class="tg-0lax">100000</td></tr>
                </tbody>
                
            </table>
        </div>
        
         <div class="totaldiv" style="width:94%; height:58px;">
            <table class="tk">
            <thead>
                <tr>
                <td class="tk-0pky" colspan="4" style="width: 46%;">합계</td>
                <td class="tk-0pky">판매수량</td>
                <td class="tk-0lax">판매금액</td>
                </tr>
            </thead>
            </table>
        </div> 
    </div>
    </section>
    <aside>
    </aside>
    <footer>
        <div class="closeDev">
            <input type="button" class="closeBtn" value="닫기" onclick="window.close()">
            <input type="button" class="submitBtn" value="적용" onclick="goStoreText()">
            </div>
    </footer>
</body>

<script>

	//현재날짜
	document.getElementById('now_date').valueAsDate = new Date();

	
	  //function addRow() {
		  
	    // table element 찾기
	    //const table = document.getElementById('tableAddDelete');
	    
	    // 새 행(Row) 추가
	   // const newRow = table.insertRow();
		var i = 1;
		var html = '';
		   
		function addRow() {
		
	    
	     html = '';
         ++i;
         if (i > 10) {
        	 alert("최대 10개까지만 등록이 가능합니다.");
        	 return;
         }
	    // Cell에 텍스트 추가
	     $("#salTable").append(
	        '<tr><td><input type="checkbox"></td>'
	            +'<td class="tg-0lax" id=count' + i + '>' + i +'</td>'
	            +'<td class="tg-0lax"><input type="text" name="prd_cd" id="prd_cd"><button type="button" onclick="partnerInventory()"><i class="fas fa-search"></i></button></td>'
	            +'<td class="tg-0lax">상품명</td>'
	            +'<td class="tg-0lax">100</td>'
	            +'<td class="tg-0lax"><input type="text" name="" id=""></td>'
	            +'<td class="tg-0lax">100000</td></tr>'

	    ) 
	   
	  }

	  function delRow(){
	    $("#salTable > tbody:last >tr:not(:first):last ").remove();
	   
	
	  }
	  
		//매장팝업
		function partnerInventory(){
	
	     // window.name = "부모창 이름"; 
	     window.name = "storePopForm";
	     var storeSearchUrl = "${pageContext.request.contextPath}/sales/partnerInventoryInquiry";
	     // window.open("open할 window", "자식창 이름", "팝업창 옵션");
	     window.open(storeSearchUrl,
	     		"childStorePopForm", "width=650, height=650, resizable = no, scrollbars = no");    
	    }
	
		//고객번호팝업
		function openCustom(){
			 
			 window.name = "CustomPopForm";
			 var custInquiryUrl = "${pageContext.request.contextPath}/customer/customerInquiry"
			 
			 window.open(custInquiryUrl,
		         "childCustomPopForm", "width=700, height=650, resizable = no, scrollbars = no");
		
		}

</script>

</html>