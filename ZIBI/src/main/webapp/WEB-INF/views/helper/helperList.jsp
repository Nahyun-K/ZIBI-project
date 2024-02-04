<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<link href="${pageContext.request.contextPath}/css/de.css" rel="stylesheet">
<!-- Icon Font Stylesheet -->
<link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.15.4/css/all.css"/>
<link href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.4.1/font/bootstrap-icons.css" rel="stylesheet">
<!-- Template Stylesheet -->
<link href="${pageContext.request.contextPath}/css/na.css" rel="stylesheet">
<link href="${pageContext.request.contextPath}/css/common.css" rel="stylesheet">
<link href="${pageContext.request.contextPath}/css/de.css" rel="stylesheet">
<script type="text/javascript" src="${pageContext.request.contextPath}/js/jquery-3.6.0.min.js"></script>
<!-- ���� ���� -->
<div class="text-center">
	<ul class="nav nav-pills d-inline-flex justify-content-center mb-2">
		<li class="nav-item p-2">
		<a class="d-flex py-2 mx-2 border bg-white rounded-pill active"
			data-bs-toggle="pill" href="#" onclick="location.href='list?helper_select=1'"> <span class="text-dark" style="width: 150px;">������</span></a>
		</li>
		<li class="nav-item p-2">
		<a class="d-flex py-2 mx-2 border bg-white rounded-pill active"
			data-bs-toggle="pill" href="#" onclick="location.href='list?helper_select=2'"> <span class="text-dark" style="width: 150px;">������</span></a>
		</li>
	</ul>
</div>
<div>
<div class="container-fluid contact py-6">
	<div class="d-flex justify-content-center">
		<div class="rounded col-md-4 col-lg-6">
	<div class="tab-class text-center">
	<ul class="nav nav-pills d-inline-flex justify-content-center mb-3">
		<li class="nav-item p-2">
		<a class="d-flex py-2 mx-2 border border bg-white rounded-pill active"
			data-bs-toggle="pill" href="#" onclick="location.href='list?helper_select=${param.helper_select}'"> <span class="text-dark" style="width: 70px;">��ü</span></a>
		</li>
		<li class="nav-item p-2">
		<a class="d-flex py-2 mx-2 border bg-white rounded-pill active"
			data-bs-toggle="pill" href="#" onclick="location.href='list?helper_select=${param.helper_select}&helper_category=1'"> <span class="text-dark" style="width: 70px;">����</span></a>
		</li>
		<li class="nav-item p-2">
		<a class="d-flex py-2 mx-2 border bg-white rounded-pill active"
			data-bs-toggle="pill" href="#" onclick="location.href='list?helper_select=${param.helper_select}&helper_category=2'"> <span class="text-dark" style="width: 70px;">����</span></a>
		</li>
		<li class="nav-item p-2">
		<a class="d-flex py-2 mx-2 border bg-white rounded-pill active"
			data-bs-toggle="pill" href="#" onclick="location.href='list?helper_select=${param.helper_select}&helper_category=3'"> <span class="text-dark" style="width: 70px;">����</span></a>
		</li>
		<li class="nav-item p-2">
		<a class="d-flex py-2 mx-2 border bg-white rounded-pill active"
			data-bs-toggle="pill" href="#" onclick="location.href='list?helper_select=${param.helper_select}&helper_category=4'"> <span class="text-dark" style="width: 70px;">�Һ�</span></a>
		</li>
		<li class="nav-item p-2">
		<a class="d-flex py-2 mx-2 border bg-white rounded-pill active"
			data-bs-toggle="pill" href="#" onclick="location.href='list?helper_select=${param.helper_select}&helper_category=5'"> <span class="text-dark" style="width: 70px;">��Ÿ</span></a>
		</li>
	</ul>
</div>
	<form action="list" id="search_form" method="get">
			<div>
				<select name="keyfield" id="keyfield" class="float-left border-color">
					<option value="1" <c:if test="${param.keyfield==1}">selected</c:if>>����</option>
					<option value="2" <c:if test="${param.keyfield==2}">selected</c:if>>����</option>
					<option value="3" <c:if test="${param.keyfield==3}">selected</c:if>>�ּ�</option>
					<option value="4" <c:if test="${param.keyfield==4}">selected</c:if>>����+����</option>
				</select>
			</div>
			<div class="align-center">
				<input type="search" name="keyword" id="keyword"
				class="form-control bg-transparent p-2 helper-btn-size float-left margin" value="${param.keyword}">
				<div class="float-right"><input type="image" src="../images/de/search.png" class="input-group-text p-3 search-size"></div>
			</div>
			<br>
			<div class="align-right">
			<c:if test="${!empty user}">
			<input type="button" value="�۾���" onclick="location.href='write'"
			 	class="d-inline-block fw-bold text-dark text-uppercase bg-light border border-color rounded-pill px-4 py-1 mb-1 float-rigth margin1">
			</c:if>
			<input type="button" value="�������" onclick="location.href='list'"
				class="d-inline-block fw-bold text-dark text-uppercase bg-light border border-color rounded-pill px-4 py-1 mb-1 float-rigth margin">
			</div>	
			<br><br>
	<div class="float-rigth">
		<select id="order" name="order" class="align-right">
			<option value="1" <c:if test="${param.order==1}">selected</c:if>>�ֽż�</option>
			<option value="2" <c:if test="${param.order==2}">selected</c:if>>��ȸ��</option>
			<option value="3" <c:if test="${param.order==3}">selected</c:if>>��ũ��</option>
		</select>
	</div>
	</form>
	<br><br>
	<c:if test="${count == 0}">
		<div class="result-display">ǥ���� �Խù��� �����ϴ�.</div>
	</c:if>
	<hr size="8" width="100%" class="hr-line">
	<c:if test="${count > 0}">
	<c:forEach var="helper" items="${list}">
			<div class="float-left" style="font-size:20px;"> 
			<c:if test="${helper.helper_select == 1}"><div>������</div></c:if>
			<c:if test="${helper.helper_select == 2}"><div>������</div></c:if>
			<hr size="3" noshade="noshade" width="100%">
			<c:if test="${helper.helper_category ==  1}"><div>����</div></c:if>
			<c:if test="${helper.helper_category ==  2}"><div>����</div></c:if>
			<c:if test="${helper.helper_category ==  3}"><div>����</div></c:if>
			<c:if test="${helper.helper_category ==  4}"><div>�Һ�</div></c:if>
			<c:if test="${helper.helper_category ==  5}"><div>��Ÿ</div></c:if>
			</div>        
			<div class="float-left1">
			<c:if test="${empty helper.helper_filename}">
			<img src="${pageContext.request.contextPath}/images/de/noimg.png"
			style="width:200px; height:200px; padding:10px;">
			</c:if>
			<c:if test="${!empty helper.helper_filename}">
			<img src="${pageContext.request.contextPath}/upload/${helper.helper_filename}"
			style="width:200px; height:200px; padding:10px;" class="radius">
			</c:if>
			</div>
			<div class="float-left2 align-center">
			<div class="align-center" id="output_text">[�ذ� ��]</div>
            <div class="align-center font-size1"><a href="detail?helper_num=${helper.helper_num}">${helper.helper_title}</a></div><br>
			<div class="align-center">${helper.helper_address1}</div><br>
			<div class="align-center">${helper.mem_nickname}</div><div class="align-center">
			${helper.helper_reg_date}</div>
			</div>
			<br>
			<hr size="3" noshade="noshade" width="100%"> 
</c:forEach>
	<div class="align-center">${page}</div>
	</c:if>
</div>
</div>
</div>
</div>
<script type="text/javascript" src="${pageContext.request.contextPath}/js/jquery-3.6.0.min.js"></script>
<script type="text/javascript">
$(function(){
	//�˻� ��ȿ�� üũ
	$('#search_form').submit(function(){
		if($('#keyword').val().trim()==''){
			alert('�˻�� �Է��ϼ���!');
			$('#keyword').val('').focus();
			return false;
		}
	});//end of submit
	
	//���� ����
	$('#order').change(function(){					//������ ������ �� &�� ����
		if(${!empty param.helper_category}){
			location.href='list?keyfield='+$('#keyfield').val()+'&keyword='+$('#keyword').val()+'&order='+$('#order').val()+'&helper_select=${param.helper_select}&helper_category=${param.helper_category}';
		}else{
			location.href='list?keyfield='+$('#keyfield').val()+'&keyword='+$('#keyword').val()+'&order='+$('#order').val();
		}
	});
	
});//end of function
</script>
<!-- ���� �� -->
