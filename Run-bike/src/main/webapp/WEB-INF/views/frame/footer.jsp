<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<footer class="pt-4 my-md-5 pt-md-5 border-top text-center">
	<div class="row no-gutters" style="width:100%">
		<div class="col-md-2 col-sm-12 no-gutters" style="padding-top: 30px">
			<small
				class="d-block mb-3 text-muted">&copy; 2019 runbike.</small>
		</div>
		<div class="col-md-10 col-sm-12 no-gutters row">
			<c:choose>
				<c:when test="${loginInfo.u_id eq 'admin'}">
					<div class="col-md-3 col-sm-3 mt-3">
						<h5 style="font-weight:bold">관리자 회원 관리</h5>
						<ul class="list-unstyled text-small">
							<li><a class="text-muted" href="<c:url value='/adminpage/managelist'/>">회원 관리</a></li>
						</ul>
					</div>
					<div class="col-md-3 col-sm-3 mt-3">
						<h5 style="font-weight:bold">문의하기</h5>
						<ul class="list-unstyled text-small">
							<li><a class="text-muted" href="<c:url value='/qnaboard'/>">문의 게시판</a></li>
						</ul>
					</div>
				</c:when>
				<c:otherwise>
					<div class="col-md-3 col-sm-3 mt-3">
						<h5 style="font-weight:bold">혼자 달리기</h5>
						<ul class="list-unstyled text-small">
							<li><a class="text-muted" href="<c:url value='/record/startRide'/>">바로 시작</a></li>
							<li><a class="text-muted" href="<c:url value='/record/ridingGuide'/>">라이딩 가이드</a></li>
							<li><a class="text-muted" href="<c:url value='/record/myCourseList'/>">나의 코스</a></li>
						</ul>
					</div>
					<div class="col-md-3 col-sm-3 mt-3">
						<h5 style="font-weight:bold">같이 달리기</h5>
						<ul class="list-unstyled text-small">
							<li><a class="text-muted" href="<c:url value='/party'/>">방 목록</a></li>
						</ul>
					</div>
					<div class="col-md-3 col-sm-3 mt-3">
						<h5 style="font-weight:bold">스탬프</h5>
						<ul class="list-unstyled text-small">
							<li><a class="text-muted" href="<c:url value='/stamp/getStamp'/>">스탬프 투어</a></li>
						</ul>
					</div>
					<div class="col-md-3 col-sm-3 mt-3">
						<h5 style="font-weight:bold">나의 리워드</h5>
						<ul class="list-unstyled text-small">
							<li><a class="text-muted" href="<c:url value='/badge/user'/>">나의 뱃지</a></li>
							<li><a class="text-muted" href="<c:url value='/stamp/user'/>">나의 스탬프</a></li>
					</div>
					<div class="col-md-3 col-sm-3 mt-3">
						<h5 style="font-weight:bold">문의하기</h5>
						<ul class="list-unstyled text-small">
							<li><a class="text-muted" href="<c:url value='/qnaboard'/>">문의하기</a></li>
						</ul>
					</div>
				</c:otherwise>
			</c:choose>
		</div>
		
	</div>
</footer>