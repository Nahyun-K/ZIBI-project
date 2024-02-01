<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>	
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<link href="${pageContext.request.contextPath}/common/css" rel="stylesheet">
<link href="${pageContext.request.contextPath}/css/de.css" rel="stylesheet">
<script type="text/javascript" src="${pageContext.request.contextPath}/js/jquery-3.6.0.min.js"></script>
<script type="text/javascript" src="https://stackpath.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/js/ckeditor.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/js/uploadAdapter.js"></script>
<!-- ���� ���� -->
<div class="container-fluid contact py-6">
   <div class="d-flex justify-content-center">
	<div class="rounded login-form col-md-4 col-lg-6">
	<form:form action="update" modelAttribute="helperVO" id="modify_form"
		enctype="multipart/form-data">
		<form:hidden path="helper_num"/>
		<form:errors element="div" />
		<h2>�۾���</h2>
		<hr size="3" noshade="noshade" width="100%">
		<div>
			<form:radiobutton path="helper_select" id="helper_select1" value="1"/><label for="helper_select1">������</label>
			<form:radiobutton path="helper_select" id="helper_select2" value="2"/><label for="helper_select1">������</label>
			<form:errors path="helper_select"/>
		</div>
        <br>
		<div>
            <form:label path="helper_category">ī�װ�</form:label>
            <form:select path="helper_category" id="helper_category"><!-- class �־���� -->
            	<form:option value="0" disabled="disabled" label="ī�װ�"/>
       			<form:option value="1" label="����" />
				<form:option value="2" label="����" />
				<form:option value="3" label="����" />
				<form:option value="4" label="�Һ�" />
				<form:option value="5" label="��Ÿ" />
			</form:select>
        </div>
        <br>
        
        <div>
       		<form:label path="helper_title">����</form:label> 
			<form:input path="helper_title" class="w-100 form-control p-3" /> 
			<form:errors path="helper_title" cssClass="error-color"/>
        </div>
        <div>
        	<b>����</b>
        	<form:textarea path="helper_content"/> 
			<form:errors path="helper_content" cssClass="error-color"/> 
			<script type="text/javascript">
				function MyCustomUploadAdapterPlugin(editor){
					editor.plugins.get('FileRepository').createUploadAdapter = (loader) => {
						return new UploadAdapter(loader);
					}
				}
				
					ClassicEditor
						.create(document.querySelector('#helper_content'),{
							extraPlugins:[MyCustomUploadAdapterPlugin]
						})
						.then(editor => {
							window.editor = editor;
						})
						.catch(error => {
							console.error(error);
						})
				</script>
        </div>
        <br>
        <div> 
        	<form:label path="upload">�����</form:label>
			<input type="file" name="upload" id="upload"
					accept="image/gif,image/png,image/jpeg,image/jpg">
			<form:errors path="upload"/>
			<c:if test="${!empty helperVO.helper_filename}">
			<div id="file_detail">(${helperVO.helper_filename})������ ��ϵǾ� �ֽ��ϴ�.
				<input type="button" value="���ϻ���" id="file_del">
			</div>
			<script type="text/javascript">
			$(function(){
				$('#file_del').click(function(){
					let choice = confirm('�����Ͻðڽ��ϱ�?');
					if(choice){
						$.ajax({
							url:'deleteFile',
							data:{helper_num:${helperVO.helper_num}},
							type:'post',
							dataType:'json',
							success:function(param){
								if(param.result == 'logout'){
									alert('�α��� �� ����ϼ���');
								}else if(param.result == 'success'){
									$('#file_detail').hide();
								}else{
									alert('���� ���� ���� �߻�');
								}
							},
							error:function(){
								alert('��Ʈ��ũ ���� �߻�');
							}
						});
					}
				});
			});
			</script>
			</c:if>
        </div>
        <br>
        <div>
        	<form:label path="helper_address1">�ּ�</form:label>
			<form:input path="helper_address1" class="w-100 form-control p-3"
				placeholder="�ּҸ� �Է��ϼ���" id="sample5_address"/>
			<form:errors path="helper_address1" cssClass="error-color"/>
        </div>
        <input type="button" onclick="sample5_execDaumPostcode()" value="�ּ� �˻�"
        		class="default-btn">
        <br><br>
		<div>
			<form:label path="helper_address2">���ּ�</form:label>
			<form:input path="helper_address2" class="w-100 form-control p-3"/>
			<form:errors path="helper_address2" cssClass="error-color"/>
		</div>
        <div>
        	<div id="map" style="width:300px;height:300px;margin-top:10px;display:none"></div>
        </div>
		<br>
		<div class="align-center">
			<form:button class="default-btn">����</form:button>
			<input type="button" value="���" class="default-btn"
				onclick="location.href='list'">
		</div>
	</form:form>
</div>
</div>
</div>
<!-- Daum ���� API -->
<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<script src="//dapi.kakao.com/v2/maps/sdk.js?appkey=397d490d4a8bb2a2dc0a8a1612615084&libraries=services"></script>
<script>
    var mapContainer = document.getElementById('map'), // ������ ǥ���� div
        mapOption = {
            center: new daum.maps.LatLng(37.537187, 127.005476), // ������ �߽���ǥ
            level: 5 // ������ Ȯ�� ����
        };

    //������ �̸� ����
    var map = new daum.maps.Map(mapContainer, mapOption);
    //�ּ�-��ǥ ��ȯ ��ü�� ����
    var geocoder = new daum.maps.services.Geocoder();
    //��Ŀ�� �̸� ����
    var marker = new daum.maps.Marker({
        position: new daum.maps.LatLng(37.537187, 127.005476),
        map: map
    });

    function sample5_execDaumPostcode() {
        new daum.Postcode({
            oncomplete: function(data) {
                var addr = data.address; // ���� �ּ� ����

                // �ּ� ������ �ش� �ʵ忡 �ִ´�.
                document.getElementById("sample5_address").value = addr;
                // �ּҷ� �� ������ �˻�
                geocoder.addressSearch(data.address, function(results, status) {
                    // ���������� �˻��� �Ϸ������
                    if (status === daum.maps.services.Status.OK) {

                        var result = results[0]; //ù��° ����� ���� Ȱ��

                        // �ش� �ּҿ� ���� ��ǥ�� �޾Ƽ�
                        var coords = new daum.maps.LatLng(result.y, result.x);
                        // ������ �����ش�.
                        mapContainer.style.display = "block";
                        map.relayout();
                        // ���� �߽��� �����Ѵ�.
                        map.setCenter(coords);
                        // ��Ŀ�� ��������� ���� ��ġ�� �ű��.
                        marker.setPosition(coords)
                    }
                });
            }
        }).open();
    }
</script>
<!-- ���� �� -->