<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
 <!--달력 jquery-->
    <script src="https://code.jquery.com/jquery-1.12.4.js"></script>
    <script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
    <link rel="stylesheet" href="http://code.jquery.com/ui/1.8.18/themes/base/jquery-ui.css">
<title>신규고객등록</title>
</head>
<style>

.infocontainer {

	width: 94%;
	height: 86px;
	margin-left: 20px;

}

.topTitle{
    font-weight: bold;
    color: gray;
    
    
}
.infoTool{
    margin-top: 13px;
    width: 785px; 
    height:283px;
    border: 1px solid #b7afaf;
   
}
.required:before {
	content: "*";
	display:inline-block;
	color: red;
	margin-left:-4px;
}

.tg {
    border-collapse: collapse;
    border-spacing: 0;
    margin-left: 19px;
    width: 700px;
    border: 2px solid white;
    
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
    width: 50%;
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
    
.tg .tg-0lax {
    border-color: inherit;
    
    vertical-align: top;
}
.closeDev{
    border: 1px solid rgb(179, 171, 171);
    background-color: rgb(228 219 219);
    width: 694px;
    height: 50px;
    margin-left: 20px;
    margin-top: 50px;
}
.submitBtn{
    margin-top: 5px;
    width: 90px;
    height: 41px;
    float: right;
}
.closeBtn{
    margin-top: 5px;
    margin-right: 10px;
	width: 90px;
    height: 41px;
    float: right;
}
#cust_nm{
    width: 110px;
    margin-right: 29px;

}
#poc_cd{
    width: 151px;   
}
#brithdayDt{
    width: 108px;
    margin-left: 53px;
}
#sexF{
    margin-left: 61px;
}
#sexM{
    margin-left: 27px;
}
#email{
    width: 63px;
    margin-left: 20px;

}
#marryDt{
    width: 108px;
    margin-left: 53px;
}

</style>

    <body>
        
            <div class="container">
                <div class="infocontainer">
                        <h3>신규고객등록</h3>
                        <p class="topTitle">고객기본정보</p>
                </div>
                
                <div class="infoTool">
                    <table class="tg">
                        <tbody>
                            <tr>
                                <td class="tg-0lax">
                                    <span class="required" style="margin-right: 41px; padding-right: 10px; ">고객명</span>
                                    <input type="text" id="cust_nm" required>
                                </td>
                                <td class="tg-0lax">
                                    <span class="required" style="margin-right: 41px;">직업코드</span>
                                    <select id="poc_cd"> 
                                        <option selected>셀렉트박스</option> 
                                        <option>옵션1</option> 
                                        <option>옵션2</option> 
                                        <option>옵션3</option>
                                     </select>
                                </td>
                            </tr>
                            <tr>
                                <td class="tg-0lax">
                                    <span class="required" style="margin-right: -26px; padding-right: 11px;">생년월일</span>
                                    <input type="text" id="brithdayDt" required>
                                </td>
                                <td class="tg-0lax">
                                    <span style="margin-right: -7px; padding-right: 21px;">성별</span>
                                     <input type="radio" name="sex" value="" id="sexF" checked>여성
                                     <input type="radio" name="sex" value="" id="sexM"> 남성 
                                </td>
                            </tr>
                            <tr>
                                <td class="tg-0lax">
                                    <span class="required" style="padding-left: 30px; margin-right: 12px;">휴대폰번호</span>
                                        <input type="text" name="" style="width: 47px; margin-left: 9px;" required>
                                        <input type="text" name="" style="width: 50px;" required>
                                        <input type="text" name="" style="width: 50px;" required>
                                </td>
                                <td class="tg-0lax">
                                    <span style="margin-right: -7px; padding-right: 21px;">생일</span>
                                    <input type="radio" name="brithday" value="" style="margin-left: 61px;" checked>양력
                                    <input type="radio" name="brithday" value="" style="margin-left: 27px;"> 음력
                                </td>
                            </tr>
                            <tr>
                                <td class="tg-0lax">
                                    <span class="required" >우편물수령</span>
                                    <input type="radio" name="postmail" style="margin-left: 43px;" value="" checked required>자택
                                    <input type="radio" name="postmail" style="margin-left: 36px;" value="" required> 직장
                                </td>
                                <td class="tg-0lax">
                                    <span style="padding-left: 43px;">이메일</span>
                                    <input type="text" id="email">@ 
                                    <input type="text" style="width: 112px;">
                                </td>
                            </tr>
                            <tr>
                                <td class="tg-0lax" colspan='2'>
                                    <span >주소</span>
                                   
                                    <input type="text" style="width: 75px; margin-left: 48px;">
                                    <button type="button" style="width: 33px;">
                                        <img src="/resources/images/search_btn.jpeg" alt="btnImages" style="width: 16px;">
                                    </button>
                                    <input type="text" style="width: 189px;">
                                    <input type="text" placeholder="직접입력">
                                    
                                </td>
                            </tr>
                            <tr>
                                <td class="tg-0lax">
                                    <span style="margin-right: -26px;">결혼기념일</span>
                                    <input type="text" id="marryDt">
                                <td class="tg-0lax">
                                    <span style="padding-left: 35px;">매장</span>
                                    <input type="text" style="width: 82px;margin-left: 3px;">
                                    <button type="button" style="width: 33px;">
                                        <img src="/resources/images/search_btn.jpeg" alt="btnImages" style="width: 16px;">
                                    </button>
                                    <input type="text" style="width: 125px;">
                                </td>
                            </tr>
                        </tbody>
                    </table>
                </div>
                <p class="topTitle" style="margin-left: 15px;">수신동의(통합)</p>
                <div style="border: 1px solid #b7afaf; width: 785px;">
                    <table class="tg">
                        <tbody>
                            <tr>
                                <td class="tg-0lax">
                                    <span class="required">이메일수신동의</span>
                                    <input type="radio" name="emailAgree" value="" required>예
                                    <input type="radio" name="emailAgree" value=""  required> 아니오
                                </td>
                                <td class="tg-0lax">
                                    <span>SMS수신동의</span>
                                    <input type="radio" name="smsAgree" value="" >예
                                    <input type="radio" name="smsAgree" value="" > 아니요
                                </td>
                            </tr>
                            <tr>
                                <td class="tg-0lax"></td>
                                <td class="tg-0lax">
                                    <span>DM수신동의</span>
                                    <input type="radio" name="dmAgree" value="" >예
                                    <input type="radio" name="dmAgree" value="" > 아니요
                                </td>
                            </tr>
                        </tbody>
                    </table>
                </div>
                <footer>
		            <div class="closeDev">
		                <input type="button" class="submitBtn" value="등록" onclick="goCustomText()">
		                <input type="button" class="closeBtn" value="닫기" onclick="window.close()">
		 
		            </div>
		        </footer>
        	</div>
        
        
    </body>
    <script>
        //제이쿼리 달력
        $(function(){
            $("#brithdayDt").datepicker({
            showOn: "both",                   
            buttonImage: "http://jqueryui.com/resources/demos/datepicker/images/calendar.gif", 
            dateFormat: "yy-mm-dd",             
            changeMonth: true,
            changeYear: true

        
        });

        $("#marryDt").datepicker({
            showOn: "both",                   
            buttonImage: "http://jqueryui.com/resources/demos/datepicker/images/calendar.gif", 
            dateFormat: "yy-mm-dd",             
            changeMonth: true,
            changeYear: true

        
        });
            $("#datepicker").datepicker('setDate', '-21Y -8M -8N');
        })  
        
    </script>
</html>