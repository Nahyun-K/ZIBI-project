<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<div class="admin-page policy-main text-center">
	<div class="text-end">
		<input class="btn mem-btn" type="button" value="1인 가구 통계 가져오기" onclick="location.href='${pageContext.request.contextPath}/stats/getData'">
	</div>
	<c:if test="${count==0}">
		<div class="justify-content-center no-data">
			등록한 데이터가 없습니다
		</div>
	</c:if>
	<c:if test="${count>0}">
		<div class="row text-center">
			<div class="col-2">행정구역명</div>
			<div class="col-2">위도</div>
			<div class="col-2">경도</div>
			<div class="col-5">정책 사이트</div>
		</div>
		<c:forEach var="policyVO" items="${list}">
			<div class="row text-center">
				<div class="col-2">
					<a href="${pageContext.request.contextPath}/admin/policyModify?district_num=${policyVO.district_num}">[수정]</a>
					${policyVO.district_name}
				</div>
				<div class="col-2">${policyVO.district_latitude}</div>
				<div class="col-2">${policyVO.district_lonitude}</div>
				<div class="col-5">
					<a href="${policyVO.policy_url}">${policyVO.policy_url}</a>
				</div>
			</div>
		</c:forEach>
		<div class="text-center">${page}</div>
	</c:if>
</div>
<script type="text/javascript">
	$('#policy_btn').toggleClass("mem-btn");
	$('#policy_btn').toggleClass("mem-btn-green");	
</script>