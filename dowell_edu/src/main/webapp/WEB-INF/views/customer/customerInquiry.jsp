<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="shortcut icon" href="/favicon.ico" type="image/x-icon">
<link rel="icon" href="/favicon.ico" type="image/x-icon">
<script type="text/javascript" src="http://code.jquery.com/jquery-latest.js"></script>
<title>고객팝업</title>

       <style>
        .container {
            border: 2px solid silver;
            background: rgb(173, 190, 238);
            width: 700px;
            height: 60px;
            margin-left: 20px;
        }
       
        .tg {
            border-collapse: collapse;
            border-spacing: 0;
        }
        .tg td {
            border-color: black;
            border-style: solid;
            border-width: 1px;
            font-family: Arial, sans-serif;
            font-size: 14px;
            overflow: hidden;
            padding: 10px 5px;
            word-break: normal;
        }
        .tg th {
            border-color: black;
            border-style: solid;
            border-width: 1px;
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
    </style>
	<script>
	
	//엔터이벤트 - no,nm 작성 후 엔터 누르면 custSearch()작동
	 function show_enter(e){
		 var mbl_no = document.getElementById("mbl_no").value;
         var cust_nm = document.getElementById("cust_nm").value;
         if(e.keyCode == 13){
        	 custSearch();
         }
      }
	    
	function custSearch(){

		var cust_nm = $("#cust_nm").val();
		var mbl_no = $("#mbl_no").val();
	
		console.log("cust_nm" + cust_nm);
		console.log("mbl_no" + mbl_no);
		
		$.ajax({
			url: "<c:url value='/customer/customerInquiryList'/>",
			 type: 'POST',
			 dataType: "json",
	         data : {
	        //	 $("#searchForm").serialize();
	        	"cust_nm" : cust_nm,
	        	"mbl_no" : mbl_no
	         },
	         success : function(data){
	        	 var tbody = $('#searchTbody');
				tbody.empty();
				
					
				var tbodyHtml = '';
				 if (data.list.length == 0) {
				
				 }else{
	        	 for(var i =0; i < data.list.length; i++){
	        		 console.log(i);
	        		 
	        		var phoneNum = data.list[i].mbl_no;
	        		phoneNum = phoneNum.replace(/(^02.{0}|^01.{1}|[0-9]{3})([0-9]+)([0-9]{4})/,"$1-$2-$3");

	 				
	 				
	 				
	        		 tbodyHtml += ' <tr>';
	        		 tbodyHtml += '<td class="tg-0lax"><input type="checkbox" name="customCheck" id="customCheck" value="'+ data.list[i].cust_no+'" onclick="checkOnly(this)"></td>';
	        		 tbodyHtml += '<td class="tg-0lax">' + data.list[i].cust_no + '</td>';
	        		 tbodyHtml += '<td class="tg-0lax">' + data.list[i].cust_nm + '</td>';
	        		 tbodyHtml += '<td class="tg-0lax">' + phoneNum + '</td>';
	        		 <%--tbodyHtml += '<td class="tg-0lax">' + data.list[i].mbl_no + '</td>';--%>
	        		 tbodyHtml += '<td class="tg-0lax">' + data.list[i].cust_ss_cd + '</td>';
	        		 tbodyHtml += ' </tr>';
	        	 }
				 }
	        	 tbody.append(tbodyHtml);
	        	 
	         },
	         
	         
	         error : function(){
	             alert("에러납니다");
		        }
			
		});
		
		
	};
	
	
	<%-- function goCustomText(){
        $(opener.document).find("#customInput").val($('#customPopInput').val());
        opener.document.getElementById("customInput").value = document.getElementById("customPopInput").value
   } --%>
   
   //1.클릭 이벤트를 걸어주며 클릭 시 clickCheck 함수를 호출합니다.
   //2.체크 박스를 체크 시 자기 자신 element를 같이 넘겨줍니다.
	//3.checkbox 타입을 가진 모든 input의 checked 속성을 false로 바꿔 선택 상태를 
	//해제시켜줍니다.
	//그 후 매게변수로 받아온 체크한 element의 checked 속성만을 true로 바꿔줍니다. 
   
   function checkOnly(target){

	   document.querySelectorAll(`input[type=checkbox]`)
       .forEach(el => el.checked = false);

   target.checked = true;
	    }
   <!-- 전달하기 버튼-->
   function goCustomText(){
	   
	  var rowData = new Array();
	  var tdArr = new Array();
	  var checkbox = $("input:checkbox[id=customCheck]:checked");
	  
	  //체크된 체크박스 값을 가져온다
	  checkbox.each(function(i){
		
		  //checkvbox.parent() : checkbox의 부모 td
		  var tr = checkbox.parent().parent().eq(i);
		  //checkbox.parent().parent() : td의 부모 tr
		  var td = tr.children();
		  
		  //체크된 row의 모든 값을 배열에 담는다
		  rowData.push(tr.text());
		  
		  //td.eq(0)은 체크박스이므로 rd.eq(1)의 값부터 가져온다.
		  var custNo = td.eq(1).text();
		  var custNm = td.eq(2).text();
		  var mblNo = td.eq(3).text();
		  var custSsCd = td.eq(4).text();
		  
		  //가저온 값을 배열에 넣는다.
		  tdArr.push(custNo);
		  tdArr.push(custNm);
		  tdArr.push(mblNo);
		  tdArr.push(custSsCd);
		  
		  console.log(tdArr);
		  
		  
	  })
	  

	  
	  //자식창의 체크값의 배열중 0, 1번째를 부모창으로 보낸다.
	  opener.document.getElementById("customSearchInputName").value = tdArr[1]
	  opener.document.getElementById("customSearchInputNo").value = tdArr[0]
	  window.close()
   }
	</script>

    </head>
    <body>
        <h2 style="margin-left: 21px;">고객조회</h2>
        <section>
        
            <div class="container">
            <form id="searchForm">
                <div style="float: left;">
                    <span>고객이름</span><input type="text" id="cust_nm" name="cust_nm" value="" onkeypress="show_enter(event)">
                </div>
                <div style="float: left;">
                    <%-- <span>핸드폰번호</span><input type="tel" id="mbl_no" name="mbl_no" value="" onkeyup="test(this)"> --%>
                    <span>핸드폰번호</span><input type="tel" id="mbl_no" name="mbl_no" value="" onkeypress="show_enter(event)">
                </div>
                 
             </form>
             <input type="button" value="조회" onclick="custSearch()"/>
            </div>
            <div style="margin-top: 15px;">
                <table id="custSearchList" class="tg">
                    <thead>
                      <tr>
                        <th class="tg-0lax">선택</th>
                        <th class="tg-0lax">고객번호</th>
                        <th class="tg-0lax">고객명</th>
                        <th class="tg-0lax">핸드폰번호</th>
                        <th class="tg-0lax">고객상태</th>
                      </tr>
                    </thead>
                    <tbody id="searchTbody">
                    </tbody>
                 </table>
				
				<input type="button" value="닫기" onclick="window.close()">
           		<input type="button" value="전달하기" onclick="goCustomText()">
            </div>
           
            
        </section>
        
    </body>

</html>