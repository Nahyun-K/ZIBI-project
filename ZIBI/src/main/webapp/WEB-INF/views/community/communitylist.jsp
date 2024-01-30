<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<link href="${pageContext.request.contextPath}/css/yeeun.css" rel="stylesheet">   
<!-- 내용 시작 -->
<div class="page-main">
	<span style="font-size :13pt;">
	<span style="font-weight:bold;margin:0 10px 0 10px;"><a href="list">전체</a></span>|
	<span style="margin:0 10px 0 10px;"><a href="list?community_category=1">핫플레이스</a></span>|
	<span style="margin:0 10px 0 10px;"><a href="list?community_category=2">부동산</a></span>|
	<span style="margin:0 10px 0 10px;"><a href="list?community_category=3">취미</a></span>|
	<span style="margin:0 10px 0 10px;"><a href="list?community_category=4">건강</a></span>|
	<span style="margin:0 10px 0 10px;"><a href="list?community_category=5">육아</a></span>
	</span>
	<form action="list" id="search_form" method="get">
		<ul class="search">
			<li>
				<select name="keyfield" id="keyfield">
					<option value="1" <c:if test="${param.keyfield == 1}">selected</c:if>>제목</option>
					<option value="2" <c:if test="${param.keyfield == 3}">selected</c:if>>내용</option>
					<option value="3" <c:if test="${param.keyfield == 4}">selected</c:if>>제목+내용</option>
				</select>
			</li>
			<li>
				<input type="search" name="keyword" id="keyword"
				                                  value="${param.keyword}">
			</li>
			<li>
				<input type="submit" value="찾기">
			</li>
		</ul>
		<div class="align-right">
			<select id="order" name="order">
				<option value="1" <c:if test="${param.order == 1}">selected</c:if>>최신순</option>
				<option value="2" <c:if test="${param.order == 2}">selected</c:if>>조회수</option>
				<option value="3" <c:if test="${param.order == 3}">selected</c:if>>좋아요</option>
				<option value="4" <c:if test="${param.order == 4}">selected</c:if>>댓글수</option>
			</select>
			<c:if test="${!empty user}">
			<input type="button" value="글쓰기" onclick="location.href='communitywrite'">
			</c:if>
		</div>
	</form>
	<c:if test="${count == 0}">
	<div class="result-display">표시할 게시물이 없습니다.</div>
	</c:if>
	<c:if test="${count > 0}">
	<table class="striped-table">
		<tr>
			<th class="align-center">번호</th>
			<th class="align-center">카테고리</th>
			<th width="400">제목</th>
			<th class="align-center">작성자</th>
			<th class="align-center">작성일</th>
			<th class="align-center">조회수</th>
			<th class="align-center">좋아요수</th>
		</tr>
		<c:forEach var="community" items="${list}">
		<tr>
			<td class="align-center">${community.community_num}</td>
			<td class="align-center">
			<c:if test="${community.community_category==1}">핫플레이스</c:if>
			<c:if test="${community.community_category==2}">부동산</c:if>
			<c:if test="${community.community_category==3}">취미</c:if>
			<c:if test="${community.community_category==4}">건강</c:if>
			<c:if test="${community.community_category==5}">육아</c:if>
			</td>
			<td><a href="detail?community_num=${community.community_num}">${community.community_title}(${community.re_cnt})</a></td>
			<td class="align-center">${community.mem_nickname}</td>
			<td class="align-center">${community.community_reg_date}</td>
			<td class="align-center">${community.community_hit}</td>
			<td class="align-center">${community.fav_cnt}</td>
		</tr>	
		</c:forEach>
	</table>
	<div class="align-center">${page}</div>
	</c:if>
</div>
<script type="text/javascript" src="${pageContext.request.contextPath}/js/jquery-3.6.0.min.js"></script>
<script type="text/javascript">
$(function(){
	//검색 유효성 체크
	$('#search_form').submit(function(){
		if($('#keyword').val().trim()==''){
			alert('검색어를 입력하세요!');
			$('#keyword').val('').focus();
			return false;
		}
	});//end of submit
	
	//정렬 선택
	$('#order').change(function(){
		location.href='list?keyfield='+$('#keyfield').val()+'&keyword='+$('#keyword').val()+'&order='+$('#order').val();
	});
	
});	
</script>
<!-- 내용 끝 -->

		