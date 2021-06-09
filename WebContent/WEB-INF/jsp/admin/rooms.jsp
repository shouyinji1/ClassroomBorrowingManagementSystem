<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
</head>
<body>
	<!-- DataTales Example -->
	<div class="card shadow mb-4">
		<div class="card-header py-3">
			<h6 class="m-0 font-weight-bold text-primary">查询结果</h6>
		</div>
		<div class="card-body">
			<div class="table-responsive">
				<table class="table table-bordered table-hover" id="dataTable" width="100%" cellspacing="0">
					<thead>
						<tr>
							<th>教室编号</th>
							<th>教室楼层</th>
							<th>教室名称</th>
							<th>教室容量</th>
							<th>教室状态</th>
						</tr>
					</thead>
					<tfoot>
						<tr>
							<th>教室编号</th>
							<th>教室楼层</th>
							<th>教室名称</th>
							<th>教室容量</th>
							<th>教室状态</th>
						</tr>
					</tfoot>
					<tbody>
						<c:forEach items="${rooms}" var="room" varStatus="status">
							<tr onclick="room('${room.id}')">
								<td>${room.id}</td>
								<td>${room.floor}</td>
								<td>${room.name}</td>
								<td>${room.capacity}</td>
								<td id="room-available-${room.id}">
									<c:choose>
										<c:when test="${room.available==true}">可申请</c:when>
										<c:when test="${room.available==false}">不可申请</c:when>
									</c:choose>
								</td>
							</tr>
						</c:forEach>
					</tbody>
				</table>
			</div>
		</div>
	</div>
	<div id="room-Modal-div"></div>
    <!-- Page level custom scripts -->
    <script type="text/javascript">
		// Call the dataTables jQuery plugin
		$(document).ready(function() {
			$('#dataTable').DataTable( {
 			   	// 设置datatables插件的显示语言为中文
				language: {
					// https://github.com/DataTables/Plugins/tree/master/i18n/zh.json
					url: '../vendor/datatables/zh.json'
				},
				"order": [[ 0, "desc" ]]	// 设置默认根据第1列降序
			} );
		} );

		function room(roomID){
			$.ajax({
				type: "get",//方法类型
				url: "../admin/room" ,
				async:true,
				data: {'roomID':roomID},
				success:function(data){
					$("#room-Modal-div").html(data);
					$("#room-Modal").modal();
				},
				error : function() {
					alert("异常请求！"+data.msg);
				}
			});
		}	
    </script>
</body>
</html>