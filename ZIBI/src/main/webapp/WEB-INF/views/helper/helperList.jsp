<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ taglib prefix='c" uri="http://java.sun.com/jsp/jstl/core"%>
<!-- ���� ���� -->
<div>
	<h2>��ɱ�� �Խ��� ���</h2>
	<div class="align-right">
		<c:if test="${!empty user}">
		<input type="button" value="�۾���" onclick="location.href='helperWrite'">
		</c:if>
	</div>
</div>