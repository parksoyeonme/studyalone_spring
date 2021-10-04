<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>매장재고조회팝업</title>
<link rel="icon" href="data:;base64,iVBORw0KGgo=">
<script src="https://kit.fontawesome.com/108adcc263.js" crossorigin="anonymous"></script>
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/partnerInventoryInquiry.css" />
<link rel="shortcut icon" href="/favicon.ico" type="image/x-icon">
<link rel="icon" href="/favicon.ico" type="image/x-icon">
<script type="text/javascript" src="http://code.jquery.com/jquery-latest.js"></script>
</head>
<body>
<h2 style="margin-left: 21px;">매장재고조회</h2>
        <section>
            <div class="container">
                <div style="float: left; margin-left: 5%;">
                    <span>매장</span>
                    <input type="text" name="prt_nm" id="prt_nm" value="" onkeypress="show_enter(event)">
                    <br>
                    <div style="margin-top: 8px;">
                        <span>상품(코드+명)</span>
                        <input type="text" name="" id="" value="" onkeypress="show_enter(event)">
                    </div>
                </div>
                <button type="button" id="searchBtn" value="" onclick="partnerInventorySearch()">
                	<i class="fas fa-search fa-2x"></i>
                </button>
            </div>
            <div style="margin-left: 25px; margin-top: 15px; height: 359px; overflow:auto;">
                <table class="tg" style="width: 100%;">
	                <thead>
	                    <tr>
		                    <th class="tg-0lax">선택</th>
		                    <th class="tg-0lax">상품코드</th>
		                    <th class="tg-0lax">상품명</th>
		                    <th class="tg-0lax">재고수량</th>
	                    </tr>
	                </thead>
	                <tbody id="searchTbody">
	                </tbody>
                </table>
            </div>
            
        </section>
        <footer>
        	<div class="closeDev">
	            <input type="button" class="closeBtn" value="닫기" onclick="window.close()">
	            <input type="button" class="submitBtn" value="적용" onclick="goStoreText()">
       	 	</div>
        </footer>

    </body>
<script>
	//엔터이벤트 -  작성 후 엔터 누르면 custSearch()작동
	 function show_enter(e){
		 var prt_nm = document.getElementById("prt_nm").value;
	
	       
	       if(e.keyCode == 13){
	       	partnerSearch();
	       }
	    }
	
	
	 function partnerInventorySearch(){
	
		var prt_nm = $("#prt_nm").val();
	
		$.ajax({
			url: "<c:url value='/sales/partnerInquiryList'/>",
			 type: 'POST',
			 dataType: "json",
	         data : {
	        	"prt_nm" : prt_nm,
	        	
	         },
	         success : function(data){
	        	var tbody = $('#searchTbody');
				tbody.empty();
					
				var tbodyHtml = '';
				 if (data.list.length == 0) {
					
				 }else{
		        	 for(var i =0; i < data.list.length; i++){
		        		 tbodyHtml += ' <tr>';
		        		 tbodyHtml += '<td class="tg-0lax"><input type="checkbox" name="partnerCheck" id="partnerCheck" value="'+ data.list[i].prt_cd+'" onclick="checkOnly(this)"></td>';
		        		 tbodyHtml += '<td class="tg-0lax">' + data.list[i].prt_cd + '</td>';
		        		 tbodyHtml += '<td class="tg-0lax">' + data.list[i].prt_nm + '</td>';
		        		 tbodyHtml += '<td class="tg-0lax">' + data.list[i].prt_ss_cd + '</td>';
		        		 tbodyHtml += '</tr>';
		        	 }
				 }
	        	 tbody.append(tbodyHtml);
	         },
	         
	         error(xhr, status, err){
	   			  	console.log(xhr, status, err);
		       }
			
			});
		};
		
		//체크박스 체크 하나만 되도록
		function checkOnly(target){
	
		   document.querySelectorAll(`input[type=checkbox]`).forEach(el => el.checked = false);
		   target.checked = true;
		}
		   
	   <!-- 전달하기 버튼-->
	   function goStoreText(){
		  
		   if($("input:checkbox[type=checkbox]").is(":checked") == false){
				  alert("매장을 선택해주세요");
			}
			else{
			  var rowData = new Array();
			  var tdArr = new Array();
			  var checkbox = $("input:checkbox[id=partnerCheck]:checked");
			  
			  //체크된 체크박스 값을 가져온다
			  checkbox.each(function(i){
				
				  //checkvbox.parent() : checkbox의 부모 td
				  var tr = checkbox.parent().parent().eq(i);
				  //checkbox.parent().parent() : td의 부모 tr
				  var td = tr.children();
				  
				  //체크된 row의 모든 값을 배열에 담는다
				  rowData.push(tr.text());
				  
				  //td.eq(0)은 체크박스이므로 rd.eq(1)의 값부터 가져온다.
				  var prtCd = td.eq(1).text();
				  var prtNm = td.eq(2).text();
				  var prtSsCd = td.eq(3).text();
				  
				  
				  //가저온 값을 배열에 넣는다.
				  tdArr.push(prtCd);
				  tdArr.push(prtNm);
				  tdArr.push(prtSsCd);
	
			  })
				  
				  //자식창의 체크값의 배열중 0, 1번째를 부모창으로 보낸다.
				  opener.document.getElementById("prd_cd").value = tdArr[1]
				  //opener.document.getElementById("prd_nm").value = tdArr[0]
				  window.close()
		   	}
	   	}
		   
</script>
</html>