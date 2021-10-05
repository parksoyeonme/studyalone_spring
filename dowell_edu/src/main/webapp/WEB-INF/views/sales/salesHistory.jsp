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
						<th class="tk-0lax">A00001</th>
						<th class="tk-0lax">강남역 매장</th>
						<th class="tk-0lax"></th>
						<th class="tk-0lax"></th>
						<th class="tk-0lax">조회기간 :</th>
						<th class="tk-0lax">2021-08-01</th>
						<th class="tk-0lax">~ 2021-08-31</th>
					  </tr>
					  <tr>
						<td class="tk-0lax">판매수량 :</td>
						<td class="tk-0lax">ㅇㅇㅇ</td>
						<td class="tk-0lax">판매금액 :</td>
						<td class="tk-0lax">3000</td>
						<td class="tk-0lax">현금 :</td>
						<td class="tk-0lax">2000</td>
						<td class="tk-0lax">카드 :</td>
						<td class="tk-0lax">00000</td>
					  </tr>
					</tbody>
					</table>
			</div>
			<div style="margin-top: 15px; width:100%; height:386px; overflow:auto">
				<table class="tg">
					<thead>
						<tr>
							<th class="tg-0lax" rowspan="2">
								<p>판매일자</p>
							</th>
							<th class="tg-0lax" colspan="2">판매</th>
							<th class="tg-0lax" colspan="3">수금</th>
						</tr>
						<tr>
							<th class="tg-0lax">수량</th>
							<th class="tg-0lax">금액</th>
							<th class="tg-0lax">현금</th>
							<th class="tg-0lax">카드 </th>
							<th class="tg-0lax">포인트</th>
						</tr>
					</thead>
					<tbody id="historyListTBody">
						<tr>
							<td class="tg-0lax">2021-08-01</td>
							<td class="tg-0lax">1</td>
							<td class="tg-0lax">10</td>
							<td class="tg-0lax">10000</td>
							<td class="tg-0lax">1</td>
							<td class="tg-0lax">1000</td>
						</tr>
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