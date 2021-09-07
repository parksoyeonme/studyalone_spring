<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>고객팝업</title>
<script type="text/javascript" src="http://code.jquery.com/jquery-latest.js"></script>
</head>
<style>
.body{
width: 750px;
height: 300px;
border: 2px solid red;
}

.infocontainer {
	border: 2px solid silver;
	background: rgb(192 205 243);
	width: 700px;
	width: 700px;
	height: 60px;
	margin-left: 20px;

}
#infoDev{
    float: left;
    margin-top: 19px;
    margin-left: 15px;
    color: #379ff2;
}

.historyNo{
	margin-top: -19px;
    margin-left: 51px;
	color: #379ff2;
}
.historyNm{
    margin-top: -21px;
    margin-left: 145px;
    color: #379ff2;
}
.tg {
    border-collapse: collapse;
    border-spacing: 0;
    margin-left: 19px;
    width: 700px;
    
}
.tg td {
    border-color: black;
    border-style: solid;
    border-width: 1px;
    font-size: 13px;
    overflow: hidden;
    padding: 10px 5px;
    word-break: normal;
    text-align: center;
}
.tg th {
    border-color: black;
    border-style: solid;
    border-width: 1px;
    overflow: hidden;
    padding: 10px 5px;
    
    word-break: normal;
    background-color: #cfcdcd;
}
    
}
.tg .tg-0lax {
    border-color: inherit;
    text-align: center;
    vertical-align: top;
}
.closeDev{
    border: 1px solid rgb(179, 171, 171);
    width: 700px;
    height: 50px;
    margin-left: 20px;
    margin-top: 129px;
}
.closeDev .closeBtn{
    float: right;
    width: 100px;
    height: 29px;
    margin-top: 11px;
}
    
</style>
<script>

custHistory();

console.log(${cust_no});

function custHistory(){
	   var cust_no = ${cust_no};
	   
	   
		console.log("cust_no" + cust_no);

		
		$.ajax({
			   url: "<c:url value='/customer/custHistoryList' />",
				 type: 'POST',
				 dataType: "json",
		         data : {
		       	
		        	"cust_no" : cust_no
		        	
		         },
		         success : function(data){
		        	 var tbody = $('#historyListTBody');
						tbody.empty();
						console.log(data);
						
						var tbodyHtml = '';
						 if (data.list.length == 0) {
							
						 }else{
			        	 for(var i =0; i < data.list.length; i++){
			        		 console.log(i);

			        		 tbodyHtml += ' <tr>';
			        		 tbodyHtml += '<td class="tg-0lax">' + data.list[i].chg_dt + '</td>';
			        		 tbodyHtml += '<td class="tg-0lax">' + data.list[i].code_nm + '</td>';
			        		 tbodyHtml += '<td class="tg-0lax">' + data.list[i].chg_bf_cnt + '</td>';
			        		 tbodyHtml += '<td class="tg-0lax">' + data.list[i].chg_aft_cnt + '</td>';
			        		 tbodyHtml += '<td class="tg-0lax">' + data.list[i].lst_upd_id + '</td>';
			        		 tbodyHtml += '<td class="tg-0lax">' + data.list[i].lst_upd_dt_time + '</td>';
			        		 tbodyHtml += ' </tr>';
			        	 }
						 }
			        	 tbody.append(tbodyHtml);
		         },

			         error : function(){
			             alert("에러납니다");
				        }
		   	});
		
		}
		
		
</script>
<body>
    <section>
        <div class="container">
            <div class="infocontainer">
                <div id="infoDev">
                    <span>고객</span>
                    <div class ="historyNo" name="cust_no" id="cust_no">${cust_no}</div>
                    <div class ="historyNm" name="cust_nm" id="cust_nm">${cust_nm}</div>
                </div>
            </div>
            <div style="margin-top: 15px;">
               <table class="tg">
                   <thead>
                       <tr>
                           <th class="tg-0lax">변경일자</th>
                           <th class="tg-0lax">변경항목</th>
                           <th class="tg-0lax">변경전</th>
                           <th class="tg-0lax">변경후</th>
                           <th class="tg-0lax">수정자</th>
                           <th class="tg-0lax">수정일자</th>
                       </tr>
                   </thead>
                   <tbody id="historyListTBody">
                      
                   </tbody>
               </table>

           </div>
           <div class="closeDev">
               <input class="closeBtn" type="button" value="닫기" onclick="window.close()">
            </div>
        </div>
    </section>
</body>
<script>
</script>
</html>