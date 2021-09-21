<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<style type="text/css">
.mcd-menu {
  list-style: none;
  padding: 0;
  margin: 0;
  background: #FFF;
  /*height: 100px;*/
  border-radius: 2px;
  -moz-border-radius: 2px;
  -webkit-border-radius: 2px;
  width: 250px;
}
.mcd-menu li {
  position: relative;
}
.mcd-menu li a {
  display: block;
  text-decoration: none;
  padding: 12px 20px;
  color: #777;
  text-align: left;
  height: 36px;
  position: relative;
  border-bottom: 1px solid #EEE;
}
.mcd-menu li a i {
  float: left;
  font-size: 20px;
  margin: 0 10px 0 0;
  
}
.mcd-menu li a p {
  float: left;
  margin: 0 ;
}

.mcd-menu li a strong {
  display: block;
  text-transform: uppercase;
}
.mcd-menu li a small {
  display: block;
  font-size: 10px;
}

.mcd-menu li:hover > a {
  color: #e67e22;
}
.mcd-menu li a.active {
  position: relative;
  color: #e67e22;
  border:0;
  box-shadow: 0 0 5px #DDD;
  -moz-box-shadow: 0 0 5px #DDD;
  -webkit-box-shadow: 0 0 5px #DDD;
  border-left: 4px solid #e67e22;
  border-right: 4px solid #e67e22;
  margin: 0 -4px;
}
.mcd-menu li a.active:before {
  content: "";
  position: absolute;
  top: 42%;
  left: 0;
  border-left: 5px solid #e67e22;
  border-top: 5px solid transparent;
  border-bottom: 5px solid transparent;
}

.mcd-menu li a.active:after {
  content: "";
  position: absolute;
  top: 42%;
  right: 0;
  border-right: 5px solid #e67e22;
  border-top: 5px solid transparent;
  border-bottom: 5px solid transparent;
}

.mcd-menu li ul,
.mcd-menu li ul li ul {
  position: absolute;
  height: auto;
  min-width: 200px;
  padding: 0;
  margin: 0;
  background: #FFF;
  opacity: 0;
  visibility: hidden;
  transition: all 300ms linear;
  -o-transition: all 300ms linear;
  -ms-transition: all 300ms linear;
  -moz-transition: all 300ms linear;
  -webkit-transition: all 300ms linear;
  z-index: 1000;
  left:280px;
  top: 0px;
  border-left: 4px solid #e67e22;

}
.mcd-menu li ul:before {
  content: "";
  position: absolute;
  top: 25px;
  left: -9px;
  border-right: 5px solid #e67e22;
  border-bottom: 5px solid transparent;
  border-top: 5px solid transparent;
}
.mcd-menu li:hover > ul,
.mcd-menu li ul li:hover > ul {
  display: block;
  opacity: 1;
  visibility: visible;
  left:250px;

}

.mcd-menu li ul li a {
  padding: 10px;
  text-align: left;
  border: 0;
  border-bottom: 1px solid #EEE;
  height: auto;
}
.mcd-menu li ul li a i {
  font-size: 16px;
  display: inline-block;
  margin: 0 10px 0 0;
}
.mcd-menu li ul li ul {
  left: 230px;
  top: 0;
  border: 0;
  border-left: 4px solid #e67e22;
}  
.mcd-menu li ul li ul:before {
  content: "";
  position: absolute;
  top: 15px;
  left: -9px;
  border-right: 5px solid #e67e22;
  border-bottom: 5px solid transparent;
  border-top: 5px solid transparent;
}
.mcd-menu li ul li:hover > ul {
  top: 0px;
  left: 200px;
}
</style>
<script type="text/javascript">
 $(document).ready(function(){
	$("#detail, #list").on("click", function(){
		
		location.href="/";
		alert("로그인해주세요!");
	})
	
}) 
</script>
<div class="container">
<nav>
		<ul class="mcd-menu">
			<li>
				<c:if test="${member == null}">
					<a href="/">
						<i class="fa fa-home"></i>
						<strong id="list">목록</strong>
						<small>고객리스트</small>
					</a>
				</c:if>
				<c:if test="${member != null}">
					<a href="/customer/customerList">
						<i class="fa fa-home"></i>
						<strong >목록</strong>
						<small>고객리스트</small>
					</a>
				</c:if>
			</li>
			<li>
				<c:if test="${member != null}">
					<a href="/member/logout" class="active">
						<i class="fa fa-edit"></i>
						<strong>로그아웃</strong>
					</a>
				</c:if>
				<c:if test="${member == null}">
					<a href="/" class="active">
						<i class="fa fa-edit"></i>
						<strong>로그인</strong>
					</a>
				</c:if>
			</li>
			<li >
				<c:if test="${member == null}">
					<a href= "/">
						<i class="fa fa-gift"></i>
						<strong id="detail">상세보기</strong>
						<small>고객정보조회</small>
					</a>
				</c:if>
				<c:if test="${member != null}">
					<a href= "${pageContext.request.contextPath}/customer/customerDetails">
						<i class="fa fa-gift"></i>
						<strong>상세보기</strong>
						<small>고객정보조회</small>
					</a>
				</c:if>
			</li>
			<li>
				<c:if test="${member != null}">
					<strong>
						${member.user_id}님 
						<br/>안녕하세요.
					</strong>
				</c:if>
	
			</li>
		</ul>
	</nav>
</div>