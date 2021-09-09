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
   	margin-top: 72px;
}
.closeDev .closeBtn{
    float: right;
    width: 100px;
    height: 29px;
    margin-top: 11px;
    margin-top: 72px;
}
    
</style>

<body>
    <section>
        <div class="container">
            <div class="infocontainer">
                <div id="infoDev">
                    <span>고객</span>
                    <c:forEach var="infohistory" items="${infohistory}">
                    <div class ="historyNo" name="cust_no" id="cust_no">${infohistory.cust_no}</div>
                    <div class ="historyNm" name="cust_nm" id="cust_nm">${infohistory.cust_nm}</div>
                    </c:forEach>
                </div>
            </div>
            <div style="margin-top: 15px; width:100%; height:386px; overflow:auto">
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
                   <c:forEach var="history" items="${history}">
                    <tr>
                           <td class="tg-0lax">${history.chg_dt}</td>
                           <td class="tg-0lax">${history.code_nm}</td>
                           <td class="tg-0lax">${history.chg_bf_cnt}</td>
                           <td class="tg-0lax">${history.chg_aft_cnt}</td>
                           <td class="tg-0lax">${history.lst_upd_id}</td>
                           <td class="tg-0lax">${history.lst_upd_dt_time}</td>
                       </tr>
                       </c:forEach>
                   </tbody>
               </table>
           </div>
        </div>
    </section>
    <footer>
		<div class="closeDev">
		    <input class="closeBtn" type="button" value="닫기" onclick="window.close()">
		</div>
    </footer>
</body>
<script>

</script>
</html>