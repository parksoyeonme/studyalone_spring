<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>고객정보조회</title>
<!--달력 jquery-->
<script src="https://code.jquery.com/jquery-1.12.4.js"></script>
<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
<link rel="stylesheet" href="http://code.jquery.com/ui/1.8.18/themes/base/jquery-ui.css">

</head>
<style>
.container {
    border: 2px solid silver;
    background: rgb(173, 190, 238);
    width: 900px;
    height: 60px;
    margin-left: 20px;
}
.required:before {
    content: " *";
    color: red;
}
</style>

   <body>
       <h2 style="margin-left: 21px;">고객정보조회</h2>
       <section>
           <div class="container">
               <p style="margin-left: 5px; float: left;">고객번호</p>
               <div style="float: left; border: 2px solid blue; margin-top: 14px; width: 73%; margin-left: 18px;">
                   <input type="text" name="고객번호" id="고객번호" style="width: 120px;">
                   <input type="button" value="버튼" onclick="openCustom()">
                   <input type="text" id="customInput" style="width: 120px;" disabled>
               </div>
               <div>
                   <button style="width: 42px; height: 53px; margin-left: 31px;">버튼</button>
               </div>
           </div>
           <h4>고객기본정보</h4>
           <form
               action="">
               <!--고객기본정보-->
               <div class="기본정보" style="border: 2px solid red; width: 900px; height: 500px;
                                                       margin-left: 20px; margin-top: 10px;">
                   <!-- <p style="float: left;">고객명</p> -->
                   <!--고객명 생년월일 성별-->
                       <div class="기본정보div01"> <span class="required">고객명</span><input type="text" name="고객명" id="고객명">
                       <span class="required">생년월일</span><input type="text" id="datepicker1">
                       <span>성별</span>
                       <input type="radio" id="여" name="여" value="1" checked>여
                       <input type="radio" id="남" name="남" value="2">남
                   </div>
                   <br/>
                   <!--생일 결혼기념일 직업코드-->
                   <div class="기본정보div02">
                       <span>생일</span>
                       <input type="radio" id="양" name="양" value="1" checked>양력
                       <input type="radio" id="음" name="음" value="1">음력
                       <span>결혼기념일</span><input type="text" id="datepicker2" disabled>
                       <span class="required">직업코드</span>
                       <select name="직업코드">
                           <option value="korean">학생</option>
                           <option value="english">회사원</option>
                           <option value="chinese">공무원</option>
                           <option value="spanish">전문직</option>
                           <option value="english">주부</option>
                           <option value="chinese">연예인</option>
                           <option value="spanish">기타</option>
                       </select>
                   </div>
                   <br/>
                   <!--휴대폰 전화-->
                   <div class="기본정보div03">
                       <span class="required">휴대폰번호</span><input type="text"><input type="text"><input type="text"><button>변경</button>
                       <span>전화번호</span>
                       <select name="전화번호">
                           <option value="korean">02</option>
                           <option value="english">010</option>
                           <option value="chinese">031</option>
                       </select>
                       <input type="text" name="전화번호" id="전화번호">
                       <input type="text" name="전화번호" id="전화번호">
                   </div>
                   <br/>
                   <!--우편물 이메일 휴먼일자-->
                   <div class="기본정보div04">
                       <span>우편물수령</span><input type="radio" id="집" name="집" value="1" checked>자택
                       <input type="radio" id="회사" name="회사" value="1">직장
                       <span>이메일</span>
                       <input type="text" class="email">
                       <span>@</span>
                       <input type="text" class="email">
                       <span>휴먼일자</span>
                       <input type="text" name="휴먼일자" id="휴먼일자" disabled>
                   </div>
                   <br/>
                   <!--주소-->
                   <div class="기본정보div05">
                       <span>주소</span>
                       <input type="text" name="address" id="address" style="width: 120px;" disabled>
                       <button>버튼</button>
                       <input type="text" name="address" id="address" disabled>
                       <input type="text" name="address" id="address" placeholder="직접입력" readonly>
                   </div>
                   <br/>
                   <!--고객상태 매장 가입일자-->
                   <div class="기본정보div06">
                       <span class="required">고객상태</span>
                       <input type="radio" id="정" name="정" value="1" checked>정상
                       <input type="radio" id="중" name="중" value="2">중지
                       <span>매장</span>
                       <input type="text" name="매장" id="매장" style="width: 120px;" disabled>
                       <button>버튼</button>
                       <input type="text" name="매장" id="매장" style="width: 120px;" disabled>
                       <span>가입일자</span>
                       <input type="text" name="가입일자" id="가입일자" disabled>
                   </div>
                   <br/>
                   <!--최초가입일자-->
                   <div class="기본정보div07">
                       <span>최초가입일자</span>
                       <input type="text" name="최초가입일자" id="최초가입일자" disabled>
                   </div>
               </div>
               <!--구매-->
               <h4>구매</h4>
               <div class="구매" style="border: 2px solid red; width: 900px; height: 50px;
                                       margin-left: 20px; margin-top: 10px;">
                   <span>총구매금액</span>
                   <input type="text" name="총구" id="총구" disabled>
                   <span>당월구매금액</span>
                   <input type="text" name="당월" id="당월" disabled>
                   <span>최종구매일</span>
                   <input type="text" name="최종" id="최종" disabled>
               </div>
               <!--수신동의-->
               <h4>수신동의(통합)</h4>
               <div class="수신동의" style="border: 2px solid red; width: 900px; height: 50px;
                                       margin-left: 20px; margin-top: 10px;">
                   <span class="required">이메일수신동의</span>
                   <input type="radio" name="emailY" id="emailY">예
                   <input type="radio" name="emailN" id="emailN">아니오
                   <span class="required">SMS수신동의</span>
                   <input type="radio" name="smsY" id="smsY">예
                   <input type="radio" name="smsN" id="smsN">아니오
                   <span class="required">DM수신동의</span>
                   <input type="radio" name="dmY" id="dmY">예
                   <input type="radio" name="dmN" id="dmN">아니오
               </div>
               <input type="submit" value="저장">
           </form>
       </section>
   </body>
<script>
	  $("#datepicker1, #datepicker2").datepicker({
	  showOn:"button"
	  , buttonImage: "http://jqueryui.com/resources/demos/datepicker/images/calendar.gif"
	});
	  
	   function openCustom()
	   {
	       // window.name = "부모창 이름"; 
	       window.name = "CustomPopForm";
	       var custInquiryUrl = "${pageContext.request.contextPath}/customer/customerInquiry"
	       // window.open("open할 window", "자식창 이름", "팝업창 옵션");
	       window.open(custInquiryUrl,
	               "childForm", "width=570, height=350, resizable = no, scrollbars = no");    
	   }
</script>
</html>