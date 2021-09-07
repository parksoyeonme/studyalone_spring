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
<title>매장팝업</title>
       
       <style>
        .container {
            border: 2px solid silver;
            background: rgb(173, 190, 238);
            width: 600px;
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
            text-align: center;
            vertical-align: top;
            width: 109px;
        }
.closeDev{
    border: 1px solid rgb(179, 171, 171);
     background-color: rgb(228 219 219);
    width: 600px;
    height: 50px;
    margin-left: 20px;
    margin-top: 50px;
}
.closeBtn{
margin-left: 38%;
    margin-top: 5px;
    width: 90px;
    height: 41px;
}
.submitBtn{
	width: 90px;
    height: 41px;
}
#prt_nm{
	margin-left: 29px;
    height: 25px;
}
#searchBtn{
	float: right;
	background: url( "https://bit.ly/2JASsV0" )no-repeat;
	width: 32px;
	height: 32px;
	cursor: pointer;
	background-color: #a5a5f1;
	border: none;
	margin-top: 15px;
	margin-right: 5px;
}
       </style>
 	<script>

 	//엔터이벤트 -  작성 후 엔터 누르면 custSearch()작동
	 function show_enter(e){
		 var prt_nm = document.getElementById("prt_nm").value;

        
        if(e.keyCode == 13){
        	partnerSearch();
        }
     }
 	
	 function partnerSearch(){

			var prt_nm = $("#prt_nm").val();
		
		
			console.log("prt_nm" + prt_nm);
	
			
			$.ajax({
				url: "<c:url value='/common/partnerInquiryList'/>",
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
		        		 console.log(i);
		        		 
		 
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
		         
		         
		         error : function(){
		             alert("에러납니다");
			        }
				
			});
			
			
		};
		
		//체크박스 체크 하나만 되도록
		function checkOnly(target){

			   document.querySelectorAll(`input[type=checkbox]`)
		       .forEach(el => el.checked = false);

		   target.checked = true;
			    }
		   
		   <!-- 전달하기 버튼-->
		   function goStoreText(){
			   
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
				  
				  console.log(tdArr);
				  
				  
			  })
			  
				
			  
			  //자식창의 체크값의 배열중 0, 1번째를 부모창으로 보낸다.
			  opener.document.getElementById("partnerSearchInputCd").value = tdArr[1]
			  opener.document.getElementById("partnerSearchInputName").value = tdArr[0]
			  window.close()
		   }
		   
		   
       </script>

    </head>
    <body>
        <h2 style="margin-left: 21px;">매장조회</h2>
        <section>
            <div class="container">
                <div style="float: left; margin-left: 5%; margin-top: 16px;">
                    <span>매장</span>
                    <input type="text" name="prt_nm" id="prt_nm" value="" onkeypress="show_enter(event)">
                    
                </div>
                <input type="button" id="searchBtn" value="" onclick="partnerSearch()"/>
            </div>
            <div style="margin-left: 25px; margin-top: 15px;">
                <table class="tg">
	                <thead>
	                    <tr>
		                    <th class="tg-0lax">선택</th>
		                    <th class="tg-0lax">매장코드</th>
		                    <th class="tg-0lax">매장명</th>
		                    <th class="tg-0lax">매장상태</th>
	                    </tr>
	                </thead>
	                <tbody id="searchTbody">
	                </tbody>
                </table>
            </div>
            <div class="closeDev">
		            <input type="button" class="closeBtn" value="닫기" onclick="window.close()">
		            <input type="button" class="submitBtn" value="적용" onclick="goStoreText()">
       	 	</div>
        </section>

    </body>

</html>