<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<link rel="icon" href="${pageContext.request.contextPath}/images/logo_tab.png"/>
<link rel="apple-touch-icon" href="${pageContext.request.contextPath}/images/logo_tab.png"/>
<link href="${pageContext.request.contextPath}/css/de.css" rel="stylesheet">
<script type="text/javascript" src="${pageContext.request.contextPath}/js/jquery-3.6.0.min.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/js/helper.scrap.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/js/helper.solution.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/js/helper.reply.js"></script>
<!-- ���� ���� -->
<div class="container">
<div class="row">
<div class="detail-border col-10">
		<c:if test="${helper.helper_category ==  1}"><div style="background:#04B486;" class="border_cate">[ ���� ]</div></c:if>
		<c:if test="${helper.helper_category ==  2}"><div style="background:#04B486;" class="border_cate">[ ���� ]</div></c:if>
		<c:if test="${helper.helper_category ==  3}"><div style="background:#04B486;" class="border_cate">[ ���� ]</div></c:if>
		<c:if test="${helper.helper_category ==  4}"><div style="background:#04B486;" class="border_cate">[ �Һ� ]</div></c:if>
		<c:if test="${helper.helper_category ==  5}"><div style="background:#04B486;" class="border_cate">[ ��Ÿ ]</div></c:if>
		<br>
		<div class="title">
		${helper.helper_title}
		</div>
		<!-- �ذ���&�ذ�Ϸ� ��� -->
		<div class="align-left">
		<div>
		<c:if test="${user.mem_num == helper.mem_num}">
		<img id="output_solution" data-num="${helper.helper_num}" class="toggle"
			src="${pageContext.request.contextPath}/images/de/toggle1.png" width="50">
		<span id="output_text">[�Ǹ� ��]</span>
		</c:if>
		<br>
		</div>
		</div>
			<div class="align-right">
			<c:if test="${user.mem_num == helper.mem_num}">
			<input type="button" value="�ۼ���" onclick="location.href='update?helper_num=${helper.helper_num}'"
				class="d-inline-block fw-bold text-dark text-uppercase bg-light border border-color rounded-pill px-2 py-1 mb-1">
			<input type="button" value="�ۻ���" onclick="location.href='delete?helper_num=${helper.helper_num}'"
					id="delete_btn" class="d-inline-block fw-bold text-dark text-uppercase bg-light border border-color rounded-pill px-2 py-1 mb-1">
						<script type="text/javascript">
						let delete_btn = document.getElementById('delete_btn');
						//�̺�Ʈ ����
						delete_btn.onclick=function(){
							let choice = confirm('�����Ͻðڽ��ϱ�?');
							if(choice){
								location.href='delete?helper_num=${helper.helper_num}';
							}
						};
						</script>
			</c:if>
			</div>
		<div class="align-center">
		<c:if test="${empty helper.helper_filename}">
		<img src="${pageContext.request.contextPath}/images/de/noimg.png"
			style="width:300px; height:300px;">
		</c:if>
		<c:if test="${!empty helper.helper_filename}">
		<img src="${pageContext.request.contextPath}/upload/${helper.helper_filename}"
			style="width:300px; height:300px;" class="radius">
		</c:if>
		</div>
		<br>
		<div>
			<img src="${pageContext.request.contextPath}/member/viewProfile?mem_num=${helper.mem_num}"
						width="50" height="50" class="my-photo radius margin-photo">
			${helper.mem_nickname}
			<div class="align-right">
			<c:if test="${!empty helper.helper_modify_date}">
			�ֱ� ������ : ${helper.helper_modify_date}
			</c:if>
			<c:if test="${empty helper.helper_modify_date}">
			�ۼ��� : ${helper.helper_reg_date}
			</c:if>
			</div>
		</div>
	<hr size="3" width="99%" noshade="noshade">			
	
	<h3>�󼼼���</h3>
	<div>
	${helper.helper_content}
	</div><br>
	<h3>�������</h3>
	<div>
	${helper.helper_address1} ${helper.helper_address2}
	<div id="map" style="width:300px;height:300px;margin-top:10px;"></div>
	</div>
	<div class="align-right">
		<c:if test="${!empty user}">
		<!-- ��ũ���� -->		
		<img id="output_scrap" data-num="${helper.helper_num}" 
			src="${pageContext.request.contextPath}/images/de/heart1.png" width="30">
		��ũ�� <span id="output_scount"></span><span>��</span>
		</c:if>
		<!-- ��ȸ�� -->		
		<img src="${pageContext.request.contextPath}/images/de/hit.png" width="30">
		��ȸ��  ${helper.helper_hit}<span>��</span>
		<!-- ��ۼ� -->	
		<img src="${pageContext.request.contextPath}/images/de/reply.png" width="30">
		<span id="output_rcount"></span>
	</div>
	<br>
	<!-- ��� ���� -->
	<div id="reply_div" class="align-center">
		<span class="re_title"></span>
		<form id="re_form">
			<input type="hidden" name="helper_num" value="${helper.helper_num}" id="helper_num">
			<div class="float-left">
			<textarea rows="3" cols="60" name="re_content" id="re_content" class="rep-content" 
			<c:if test="${empty user}">disabled="disabled"</c:if>
			><c:if test="${empty user}">�α��� �� �ۼ��� �� �ֽ��ϴ�.</c:if></textarea>	
			</div>
		  <c:if test="${!empty user}">
		  <div class="float-left">
		  	<input type="submit" value="�ۼ��ϱ�" class="btn-reply">
		   </div>	
		  <div id="re_first">
		  	<span class="letter-count">300/300</span>
		  </div>
		  </c:if>
		</form>
	</div>
	<!-- ��� ��� ��� ���� -->
	<div id="output"></div>
	<div class="paging-button" style="display:none;">
		<input type="button" value="������" class="d-inline-block text-dark text-uppercase bg-light border border-color rounded-pill px-2 py-1 mb-1">
	</div>
	<div id="loading" style="display:none;">
	<img src="${pageContext.request.contextPath}/images/de/loading.gif" width="100" height="100">
	</div>
	<!-- ��� ��� ��� �� -->
	<!-- ��� �� -->
	<br><br>
</div>
<div class="col-1 detail-border2">
	<div class="align-center">
	<input type="button" value="�������" onclick="location.href='list?helper_num=${helper.helper_num}'" 
			class="w-25 btn btn-light form-control p-3 rounded-pill">	
	</div>
</div>
</div>
</div>
<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<script src="//dapi.kakao.com/v2/maps/sdk.js?appkey=397d490d4a8bb2a2dc0a8a1612615084&libraries=services"></script>
	<script>
	var mapContainer = document.getElementById('map'), // ������ ǥ���� div 
    mapOption = {
        center: new daum.maps.LatLng(33.450701, 126.570667), // ������ �߽���ǥ(�ʱ� ������ �ּҸ� ��ǥ�� �ٲ㼭 �����ϸ� �߽� ��ǥ�� �ٲ�)
        level: 3 // ������ Ȯ�� ����
    };  

	// ������ �����մϴ�    
	var map = new daum.maps.Map(mapContainer, mapOption); 
	// �ּ�-��ǥ ��ȯ ��ü�� �����մϴ�
	var geocoder = new daum.maps.services.Geocoder();
	// �ּҷ� ��ǥ�� �˻��մϴ�
	geocoder.addressSearch('${helper.helper_address1}', function(result, status) {
	    // ���������� �˻��� �Ϸ������ 
	     if (status === daum.maps.services.Status.OK) {
	    	 console.log('lat : ' + result[0].y);
	    	 console.log('lng : ' + result[0].x);
	        var coords = new daum.maps.LatLng(result[0].y, result[0].x);
	        // ��������� ���� ��ġ�� ��Ŀ�� ǥ���մϴ�
	        var marker = new daum.maps.Marker({
	            map: map,
	            position: coords
	        });
	        
	        // ������ �߽��� ��������� ���� ��ġ�� �̵���ŵ�ϴ�
	        map.setCenter(coords);
	    } 
	});    
</script>	
<!-- ���� �� -->