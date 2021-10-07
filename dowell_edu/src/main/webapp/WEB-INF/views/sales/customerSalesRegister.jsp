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
                            <option value="${CommonCd[5].dtl_cd}">${CommonCd[5].dtl_cd_nm}</option>
                            <option disabled value="${CommonCd[4].dtl_cd}">${CommonCd[4].dtl_cd_nm}</option>
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
                            <c:forEach var="CommonCd" items="${CommonCd}" begin="0" end="3">
                            	<option value="${CommonCd.dtl_cd}">${CommonCd.dtl_cd_nm}</option> 
                            </c:forEach>
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
            <button type='button' value='' id="addRow" onclick='addRow()'>
            	<i class="fas fa-plus"></i>
            </button>
            <button type='button' value='' id="delRow" onclick='delRow()'>
            	<i class="fas fa-minus"></i>
            </button>
        </div>
        <div style="width:95%; height:301px; overflow-y:auto;overflow-x:hidden;">
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
		           		<td class="tg-0lax" id="count1">1</td>
		            	<td class="tg-0lax">
		            		<input type="text" name="prd_cd1" id="prd_cd1" value="" onkeypress="show_enter()">
		            		<input type="hidden" name="prt_cd" id="prt_cd" value="${member.prt_cd}">
		            		<button type="button" id="partnerInventory" onclick="partnerInventory(1)">
		            			<i class="fas fa-search"></i>
		            		</button>
		            	</td>
			            <td class="tg-0lax">
			            	<input type="text" name="prd_nm1" id="prd_nm1" value=""  >
			            </td>
			            <td class="tg-0lax">
			            	<input type="text" name="ivco_qty1" id="ivco_qty1" value="">
			            </td>
			            <td class="tg-0lax">
			            	<input type="number" min="0"  name="tot_sal1" id="tot_sal1" value="">
			            </td>
			            <td class="tg-0lax">금액넣어야</td>
					</tr>
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

	//max(this)
	/* function myFunction(val) {
		var max = $("#ivco_qty1").val();
		//$("#cust_nm").val();
		
		if(val > $("#ivco_qty1").val()){
			alert("매장재고 값을 문제.");
		}else if(val< 0){
			alert("매장재고값을 확인해주세요.");
		}
		  
	} */
	
	/* $('#tot_sal1').keyup(function () {
		 var tot_sal1 = $("#tot_sal1").val();
		 var max = $("#ivco_qty1").val(); 
		    //활성화
			
		 if(tot_sal1 > max){
				alert("매장재고 값을 문제.");
			}else if(tot_sal1< 0){
				alert("매장재고값을 확인해주세요.");
			}
				
			
	}); */
	 function show_enter(){
		 //var prd_cd = document.getElementById("prd_cd1").value;
		 //var prt_nm = document.getElementById("prt_cd").value;
	       
	       if(event.keyCode == 13){
	    	   //alert("성공")
	    	   prdInventorySearch();
	    	   //console.log("나와아아아ㅏ" + prd_cd);
	       }
	    }

	function prdInventorySearch(){
		var prd_cd = $("#prd_cd" + i).val();
		var prt_cd = $("#prt_cd").val();
		console.log(prd_cd);
		
		$.ajax({
            url : "${pageContext.request.contextPath}/sales/prdInventorySearch",
            type :"POST",
            dataType : "json",
            data : {
            	"prt_cd" : prt_cd,
	        	"prd_cd" : prd_cd
            	
            },
            success : function(data){
           	 
					//alert("성공?.");
					//console.log(data);
					const $frm = $(salTabletbody);
					
					if(data.listnm){
						 if(data.listnm.length == 0){
							alert("해당상품은 존재하지 않습니다.");
						} 
						if(data.listnm[0].prd_ss_cd =='C' || data.listnm[0].prd_tp_cd =='20' ||data.listnm[0].ivco_qty =='0'){
							alert("상품상태가 정상이 아닙니다.")
							return false;
						}
						$frm.find($("#prd_cd" + i)).val(data.listnm[0].prd_cd);
						$frm.find($("#prd_nm" + i)).val(data.listnm[0].prd_nm);
						$frm.find($("#ivco_qty" + i)).val(data.listnm[0].ivco_qty);
						
					}
					if(data.list){
						if(data.list.length == 0){
							alert("해당상품은 존재하지 않습니다.");
						}
						if(data.list[0].prd_ss_cd =='C' || data.list[0].prd_tp_cd =='20' ||data.list[0].ivco_qty =='0'){
							alert("상품상태가 정상이 아닙니다.")
							return false;
						}
						$frm.find($("#prd_cd" + i)).val(data.list[0].prd_cd);
						$frm.find($("#prd_nm" + i)).val(data.list[0].prd_nm);
						$frm.find($("#ivco_qty" + i)).val(data.list[0].ivco_qty);
						
					}
					
					
           	 
            },
            error: function(xhr, status, error){
                alert("등록실패했습니다." + error);
            }
           
        });
	}
	  //function addRow() {
		  
	    // table element 찾기
	    //const table = document.getElementById('tableAddDelete');
	    
	    // 새 행(Row) 추가
	   // const newRow = table.insertRow();
		var i = 1;
		//var j = 1;
		var html = '';
		   
		function addRow() {
		
		//var max = $("#ivco_qty'+ i + '").val();
	     html = '';
         ++i;
         if (i > 10) {
        	 alert("최대 10개까지만 등록이 가능합니다.");
        	 return;
         }
        // var j = i.length;
	    // Cell에 텍스트 추가
	     $("#salTable").append(
	        '<tr><td><input type="checkbox" id="checkbox'+ i + '"></td>'
	            +'<td class="tg-0lax" id=count' + i + '>' + i +'</td>'
	            +'<td class="tg-0lax"><input type="text" name="prd_cd'+ i + '" id="prd_cd'+ i +'"  onkeypress="show_enter(event)"><button type="button" onclick="partnerInventory(' + i + ')"><i class="fas fa-search"></i></button></td>'
	            +'<td class="tg-0lax"><input type="text" style="border: none;" name="prd_nm'+ i + '" id="prd_nm'+ i + '" value=""></td>'
	            +'<td class="tg-0lax"><input type="text" style="border: none;" name="ivco_qty'+ i + '" id="ivco_qty'+ i + '" value=""></td>'
	            +'<td class="tg-0lax"><input type="number" min="0" max="" name="tot_sal' + i + '" id="tot_sal' + i + '" value=""></td>'
	            +'<td class="tg-0lax">금액넣어야지</td></tr>'

	    ) 
	   
	  }

	/*   function delRow(){
	    $("#salTable > tbody:last >tr:not(:first):last ").remove(); 
	}
	    */
	   /*  function delRow(){          
	    	var checkbox = $("input:checkbox[type=checkbox]:checked");
	    	//var checkbox = $("input:checkbox[id=prdCheck]:checked");
	    	//checkvbox.parent() : checkbox의 부모 td
			 // var tr = checkbox.parent().parent().eq(i);
			  //checkbox.parent().parent() : td의 부모 tr
            if($("input:checkbox[type=checkbox]").is(":checked") == true){ //체크된 요소가 있으면               
                var i = checkbox.parents("tr");
            console.log("idddddddddddddd" + i);
                   //var e = i.next("tr");                     
                   i.remove();
                  // e.remove();
            }
       } */
       
       function delRow(){ 
		  //체크된 행이 없을 경우.
        if($("input:checkbox[type=checkbox]").is(":checked") == false){  
        
              alert("삭제할 행을 선택하여 주십시오.");  
            
        } else {                  
            
        	$("input:checkbox[type=checkbox]:checked").each(function(index){               
                       
                         
                     //체크박스를 포함하고 있는 행 제거 
                     var clickedRow = $(this).parent().parent();   
                     //var clickedRowNext = clickedRow.next("tr");                     
                     clickedRow.remove();
                     
                    // clickedRowNext.remove();     
                    
                    
                                       
              });                    
        }            
	//$("#salTable > tbody:last >tr:not(:first):last ").remove();
       }
       
       
	  
		//매장팝업
		function partnerInventory(countNo){
		
	     // window.name = "부모창 이름"; 
	     window.name = "storePopForm";
	     var storeSearchUrl = "${pageContext.request.contextPath}/sales/partnerInventoryInquiry?countNo=" +countNo;
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