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
					accept="image/gif,image/png,image/jpeg">
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
        	<form:label path="helper_zipcode">�����ȣ</form:label>
			<input type="button" onclick="execDaumPostcode()" class="default-btn" value="�����ȣ ã��">
			<form:input path="helper_zipcode" autocomplete="off" class="w-100 form-control p-3"/>
			<form:errors path="helper_zipcode" cssClass="error-color"/>
        </div>
        <br>
        <div>
        	<form:label path="helper_address1">�ּ�</form:label>
			<form:input path="helper_address1" class="w-100 form-control p-3"/>
			<form:errors path="helper_address1" cssClass="error-color"/>
        </div>
        <br>
		<div>
			<form:label path="helper_address2">���ּ�</form:label>
			<form:input path="helper_address2" class="w-100 form-control p-3"/>
			<form:errors path="helper_address2"/>
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
<!-- �����ȣ �˻� ���� -->
	<!-- iOS������ position:fixed ���װ� ����, �����ϴ� ����Ʈ�� �°� position:absolute ���� �̿��Ͽ� top,left�� ���� �ʿ� -->
<div id="layer" style="display:none;position:fixed;overflow:hidden;z-index:1;-webkit-overflow-scrolling:touch;">
<img src="//t1.daumcdn.net/postcode/resource/images/close.png" id="btnCloseLayer" style="cursor:pointer;position:absolute;right:-3px;top:-3px;z-index:1" onclick="closeDaumPostcode()" alt="�ݱ� ��ư">
</div>

<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<script>
    // �����ȣ ã�� ȭ���� ���� element
    var element_layer = document.getElementById('layer');

    function closeDaumPostcode() {
        // iframe�� ���� element�� �Ⱥ��̰� �Ѵ�.
        element_layer.style.display = 'none';
    }

    function execDaumPostcode() {
        new daum.Postcode({
            oncomplete: function(data) {
                // �˻���� �׸��� Ŭ�������� ������ �ڵ带 �ۼ��ϴ� �κ�.

                // �� �ּ��� ���� ��Ģ�� ���� �ּҸ� �����Ѵ�.
                // �������� ������ ���� ���� ��쿣 ����('')���� �����Ƿ�, �̸� �����Ͽ� �б� �Ѵ�.
                var addr = ''; // �ּ� ����
                var extraAddr = ''; // �����׸� ����

                //����ڰ� ������ �ּ� Ÿ�Կ� ���� �ش� �ּ� ���� �����´�.
                if (data.userSelectedType === 'R') { // ����ڰ� ���θ� �ּҸ� �������� ���
                    addr = data.roadAddress;
                } else { // ����ڰ� ���� �ּҸ� �������� ���(J)
                    addr = data.jibunAddress;
                }

                // ����ڰ� ������ �ּҰ� ���θ� Ÿ���϶� �����׸��� �����Ѵ�.
                if(data.userSelectedType === 'R'){
                    // ���������� ���� ��� �߰��Ѵ�. (�������� ����)
                    // �������� ��� ������ ���ڰ� "��/��/��"�� ������.
                    if(data.bname !== '' && /[��|��|��]$/g.test(data.bname)){
                        extraAddr += data.bname;
                    }
                    // �ǹ����� �ְ�, ���������� ��� �߰��Ѵ�.
                    if(data.buildingName !== '' && data.apartment === 'Y'){
                        extraAddr += (extraAddr !== '' ? ', ' + data.buildingName : data.buildingName);
                    }
                    // ǥ���� �����׸��� ���� ���, ��ȣ���� �߰��� ���� ���ڿ��� �����.
                    if(extraAddr !== ''){
                        extraAddr = ' (' + extraAddr + ')';
                    }
                    //(����)address1�� �����׸��� ���������� ����
                    // ���յ� �����׸��� �ش� �ʵ忡 �ִ´�.
                    //(����) document.getElementById("address2").value = extraAddr;
                
                } 
                //(����) else {
                //(����)    document.getElementById("address2").value = '';
                //(����) }

                // �����ȣ�� �ּ� ������ �ش� �ʵ忡 �ִ´�.
                document.getElementById('zipcode').value = data.zonecode;
                //(����) + extraAddr�� �߰��ؼ� address1�� �����׸��� ���������� ����
                document.getElementById("address1").value = addr + extraAddr;
                // Ŀ���� ���ּ� �ʵ�� �̵��Ѵ�.
                document.getElementById("address2").focus();

                // iframe�� ���� element�� �Ⱥ��̰� �Ѵ�.
                // (autoClose:false ����� �̿��Ѵٸ�, �Ʒ� �ڵ带 �����ؾ� ȭ�鿡�� ������� �ʴ´�.)
                element_layer.style.display = 'none';
            },
            width : '100%',
            height : '100%',
            maxSuggestItems : 5
        }).embed(element_layer);

        // iframe�� ���� element�� ���̰� �Ѵ�.
        element_layer.style.display = 'block';

        // iframe�� ���� element�� ��ġ�� ȭ���� ����� �̵���Ų��.
        initLayerPosition();
    }

    // �������� ũ�� ���濡 ���� ���̾ ����� �̵���Ű���� �ϽǶ�����
    // resize�̺�Ʈ��, orientationchange�̺�Ʈ�� �̿��Ͽ� ���� ����ɶ����� �Ʒ� �Լ��� ���� ���� �ֽðų�,
    // ���� element_layer�� top,left���� ������ �ֽø� �˴ϴ�.
    function initLayerPosition(){
        var width = 300; //�����ȣ���񽺰� �� element�� width
        var height = 400; //�����ȣ���񽺰� �� element�� height
        var borderWidth = 5; //���ÿ��� ����ϴ� border�� �β�

        // ������ ������ ������ ���� element�� �ִ´�.
        element_layer.style.width = width + 'px';
        element_layer.style.height = height + 'px';
        element_layer.style.border = borderWidth + 'px solid';
        // ����Ǵ� ������ ȭ�� �ʺ�� ���� ���� �����ͼ� �߾ӿ� �� �� �ֵ��� ��ġ�� ����Ѵ�.
        element_layer.style.left = (((window.innerWidth || document.documentElement.clientWidth) - width)/2 - borderWidth) + 'px';
        element_layer.style.top = (((window.innerHeight || document.documentElement.clientHeight) - height)/2 - borderWidth) + 'px';
    }
</script>
<!-- �����ȣ �˻� �� -->
<!-- ���� �� -->
