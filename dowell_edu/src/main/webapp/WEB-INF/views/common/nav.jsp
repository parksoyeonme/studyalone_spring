<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<style type="text/css">

ul.sub li {
    margin-bottom: 2px;
    height:35px;
    line-height:35px;
    background:#f4f4f4;
    cursor:pointer;
    list-style: none; 
	display:inline; 
}
ul.sub li a {
    display: block;
    width: 100%;
    height:100%;
    text-decoration:none;
    color:#000;
}
</style>
<ul class="sub">
	<li>
		<a href="/customer/customerList">목록</a>
	</li>
	<li>
		<c:if test="${member != null}"><a href="/member/logout">로그아웃</a></c:if>
		<c:if test="${member == null}"><a href="/">로그인</a></c:if>
	</li>
	<li>
		<a href="/customer/customerList">상세보기</a>
	</li>
	<li>
		<c:if test="${member != null}">
			<p>${member.user_id}님
				<br/>안녕하세요.</p>
		</c:if>
	</li>
</ul>