<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<link rel="icon" href="${pageContext.request.contextPath}/images/logo_tab.png"/>
<link rel="apple-touch-icon" href="${pageContext.request.contextPath}/images/logo_tab.png"/>
<script type="text/javascript" src="${pageContext.request.contextPath}/js/jquery-3.6.0.min.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/js/helper.scrap.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/js/helper.solution.js"></script>
<!-- ���� ���� -->
<div class="container-fluid contact py-6">
	<div class="d-flex justify-content-center">
		<div class="rounded login-form col-md-4 col-lg-6">
		
		<h2>�� ��</h2>
		<div class="align-right">
		<c:if test="${!empty user}">
		<!-- �ذ���&�ذ�Ϸ� ��� -->
		<div>
		<img id="output_solution" data-num="${helper.helper_num}" class="toggle"
			src="${pageContext.request.contextPath}/images/de/toggle1.png" width="50">
		<br>
		<span id="output_text">[�ذ� ��]</span>
		</div>
		<input type="button" value="�ۼ���" onclick="location.href='update?helper_num=${helper.helper_num}'">
		<input type="button" value="�ۻ���" onclick="location.href='delete?helper_num=${helper.helper_num}'"
				id="delete_btn">
		<input type="button" value="���" onclick="location.href='list?helper_num=${helper.helper_num}'">
		</c:if>
		</div>
		<div>
		��ȸ�� : ${helper.helper_hit}
		</div>
		<div>
		<c:if test="${empty helper.helper_filename}">
		<img src="${pageContext.request.contextPath}/images/de/noimg.png"
			style="width:500px; height:500px;" >
		</c:if>
		<c:if test="${!empty helper.helper_filename}">
		<img src="${pageContext.request.contextPath}/upload/${helper.helper_filename}"
			style="width:500px; height:500px;" >
		</c:if>
		</div>
		<div>
			<img src="${pageContext.request.contextPath}/member/viewProfile?mem_num=${helper.mem_num}"
						width="40" height="40" class="my-photo">
		</div>
			<div>
			�г��� : ${helper.mem_nickname}
			<br>
			<c:if test="${!empty helper.helper_modify_date}">
			�ֱ� ������ : ${helper.helper_modify_date}
			</c:if>
			<c:if test="${empty helper.helper_modify_date}">
			�ۼ��� : ${helper.helper_reg_date}
			</c:if>
			��ȸ�� : ${helper.helper_hit}
	</div>		
	<div>
		���� : ${helper.helper_title}
	</div>
		
	<div>
		���� : ${helper.helper_content}
	</div>
	<div>
		�ּ� : ${helper.helper_address1} ${helper.helper_address2}
		<div id="map" style="width:300px;height:300px;margin-top:10px;"></div>
	</div>
	
	<div class="align-right">
		<c:if test="${!empty user}">
		<div>
		<!-- ��ũ�� -->		
		<img id="output_scrap" data-num="${helper.helper_num}" 
			src="${pageContext.request.contextPath}/images/de/heart1.png" width="40">
		<!-- ��ũ�� ���� -->
		<span id="output_scount"></span>	
	</div>
									<!-- ä�� ���� -->
		<input type="button" value="ä���ϱ�" onclick="location.href=''">
		</c:if>
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
<script type="text/javascript" src="${pageContext.request.contextPath}/js/jquery-3.6.0.min.js"></script>
<script type="text/javascript">
$(function(){
	$('#delete_btn').click(function(){
		let choice = confirm('���� �����Ͻðڽ��ϱ�?');
		if(!choice){
			return false;
		}
	});
});
</script>

<!-- ���� �� -->