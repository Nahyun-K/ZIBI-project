<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<link href="${pageContext.request.contextPath}/css/na.css" rel="stylesheet">

<div class="page-main">
	<h2>상영관</h2>
	<!-- form태그를 사용하려면 먼저 Controller에서 modelAttribute부터 -->
	<form:form action="registerCinema" modelAttribute="cinemaVO" enctype="multipart/form-data">
		<form:errors element="div" cssClass="error-color"/>
			<ul>
				<li>
					<form:label path="cinema_location1">장소1</form:label>
					<form:input path="cinema_location1"/>
					<form:errors path="cinema_location1" cssClass="error-color"/>
				</li>
				<li>
					<form:label path="cinema_location2">장소2</form:label>
					<form:input path="cinema_location2"/>
					<form:errors path="cinema_location2" cssClass="error-color"/>
				</li>
				<li>
					<form:label path="cinema_theater">상영관</form:label>
					<form:input path="cinema_theater"/>
					<form:errors path="cinema_theater" cssClass="error-color"/>
				</li>
				<li>
					<form:label path="cinema_theater_num">상영관 번호</form:label>
					<form:input path="cinema_theater_num"/>
					<form:errors path="cinema_theater_num" cssClass="error-color"/>
				</li>
				<li>
					<form:label path="cinema_row">행</form:label>
					<form:input path="cinema_row"/>
					<form:errors path="cinema_row" cssClass="error-color"/>
				</li>
				<li>
					<form:label path="cinema_col">열</form:label>
					<form:input path="cinema_col"/>
					<form:errors path="cinema_col" cssClass="error-color"/>
				</li>
				<li>
					<form:label path="cinema_adult">어른</form:label>
					<form:input path="cinema_adult"/>
					<form:errors path="cinema_adult" cssClass="error-color"/>
				</li>
				<li>
					<form:label path="cinema_teenage">청소년</form:label>
					<form:input path="cinema_teenage"/>
					<form:errors path="cinema_teenage" cssClass="error-color"/>
				</li>
				<li>
					<form:label path="cinema_treatment">우대</form:label>
					<form:input path="cinema_treatment"/>
					<form:errors path="cinema_treatment" cssClass="error-color"/>
				</li>
			</ul>
			<div class="align-center">
				<form:button>전송</form:button>
				<input type="button" value="목록" onclick="location.href='list'">
			</div>	
	</form:form>
</div>