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
<link href="${pageContext.request.contextPath}/css/layout.css" rel="stylesheet">
<!-- ���� ���� -->
 <div class="tab-class text-center">
                    <ul class="nav nav-pills d-inline-flex justify-content-center mb-5 wow" data-wow-delay="0.1s">
                        <li class="nav-item p-2">
                            <a class="d-flex py-2 mx-2 border border-primary bg-white rounded-pill active" data-bs-toggle="pill" href="#tab-6">
                                <span class="text-dark" style="width: 150px;">����</span>
                            </a>
                        </li>
                        <li class="nav-item p-2">
                            <a class="d-flex py-2 mx-2 border border-primary bg-white rounded-pill" data-bs-toggle="pill" href="#tab-7">
                                <span class="text-dark" style="width: 150px;">����</span>
                            </a>
                        </li>
                        <li class="nav-item p-2">
                            <a class="d-flex py-2 mx-2 border border-primary bg-white rounded-pill" data-bs-toggle="pill" href="#tab-8">
                                <span class="text-dark" style="width: 150px;">����</span>
                            </a>
                        </li>
                        <li class="nav-item p-2">
                            <a class="d-flex py-2 mx-2 border border-primary bg-white rounded-pill" data-bs-toggle="pill" href="#tab-9">
                                <span class="text-dark" style="width: 150px;">�Һ�</span>
                            </a>
                        </li>
                        <li class="nav-item p-2">
                            <a class="d-flex py-2 mx-2 border border-primary bg-white rounded-pill" data-bs-toggle="pill" href="#tab-10">
                                <span class="text-dark" style="width: 150px;">��Ÿ</span>
                            </a>
                        </li>
                    </ul>
</div>                    
<div>
	<h2>��ɱ�� �Խ��� ���</h2>
	<form action="list" id="search_form" method="get">
			<div>
				<select name="keyfield" id="keyfield">
					<option value="1" <c:if test="${param.keyfield==1}">selected</c:if>>����</option>
					<option value="2" <c:if test="${param.keyfield==2}">selected</c:if>>����</option>
					<option value="3" <c:if test="${param.keyfield==3}">selected</c:if>>�ּ�</option>
					<option value="4" <c:if test="${param.keyfield==4}">selected</c:if>>����+����</option>
				</select>
			</div>
			<div>
				<input type="search" name="keyword" id="keyword"
				class="form-control bg-transparent p-2 helper-btn-size" value="${param.keyword}">
				<input type="submit" value="ã��" class="">
			</div>
			<div>
				
				<input type="button" value="���" onclick="location.href='list'"> 
			</div>
	<div class="align-right">
		<select id="order" name="order">
			<option value="1" <c:if test="${param.order==1}">selected</c:if>>�ֽż�</option>
			<option value="2" <c:if test="${param.order==2}">selected</c:if>>��ȸ��</option>
			<%--<option value="3" <c:if test="${param.order==3}">selected</c:if>>��ũ��</option> ���⺸��--%>
		</select>
		<c:if test="${!empty user}">
		<input type="button" value="�۾���" onclick="location.href='write'">
		</c:if>
	</div>
	</form>
	<c:if test="${count == 0}">
		<div class="result-display">ǥ���� �Խù��� �����ϴ�.</div>
	</c:if>
	<c:if test="${count > 0}">
	<div class="container-fluid service py-6">
            <div class="container">
                <div class="text-center">
                </div>
                <div class="row g-4">
                    <div class="col-lg-3 col-md-6 col-sm-12">
                        <div class="bg-light rounded service-item">
                            <div class="service-content d-flex align-items-center justify-content-center p-4">
                                <div class="service-content-icon text-center">
                                    <div class="fas fa-7x text-primary mb-4">����</div>
                                    <div class="mb-3">����</div>
                                    <p class="mb-4">����</p>
                                    <div class="mb-3">�����</div>
                                </div>
                            </div>
                        </div>
                    </div>	

                      
                      
            <div class="align-center">${helper.helper_title}</div>
			<div class="align-center"><a href="detail?helper_num=${helper.helper_num}">${helper.helper_address1}</a></div>
			<div class="align-center">${helper.mem_nickname}</div>
			<div class="align-center">${helper.helper_reg_date}</div>
			<div class="align-center">${helper.helper_category}</div>              
    </div>
    </div>
    </div>
    </div>
	<table class="striped-table">
		<tr>
			<th>�� ����</th>
			<th>����</th>
			<th>�ۼ���</th>
			<th>�����</th>
			<th>ī�װ�</th>
		</tr>
		<c:forEach var="helper" items="${list}">
			<tr>
			<td class="align-center">${helper.helper_title}</td>
			<td class="align-center"><a href="detail?helper_num=${helper.helper_num}">${helper.helper_address1}</a></td>
			<td class="align-center">${helper.mem_nickname}</td>
			<td class="align-center">${helper.helper_reg_date}</td>
			<td class="align-center">${helper.helper_category}</td>
		</tr>
		</c:forEach>
	</table>
	<div class="align-center">${page}</div>
	</c:if>
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
		location.href='list?keyfield='+$('#keyfield').val()+'&keyword='+$('#keyword').val()+'&order='+$('#order').val();
	});
	
});//end of function
</script>
<!-- ���� �� -->

























