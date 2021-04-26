<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
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
							<th>教室名称</th>
							<th>教室楼层</th>
							<th>容量</th>
						</tr>
					</thead>
					<tfoot>
						<tr>
							<th>教室编号</th>
							<th>教室名称</th>
							<th>教室楼层</th>
							<th>容量(人)</th>
						</tr>
					</tfoot>
					<tbody>
						<c:forEach items="${rooms}" var="room" varStatus="status">
							<tr onclick="choose('${room.id}')">
								<td>${room.id}</td>
								<td>${room.name}</td>
								<td>${room.floor}</td>
								<td>${room.capacity}</td>
							</tr>
						</c:forEach>
					</tbody>
				</table>
			</div>
		</div>
	</div>
	<!-- Modal -->
	<div class="modal fade" id="apply-Modal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
					
	</div>
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
			} );
		} );
    </script>
    <script type="text/javascript">
		function choose(roomID){
			var zhouCi=$('#zhouCi').val();
			var xingQi=$('#xingQi').val();
			var sJieCi=$('#sJieCi').val();
			var eJieCi=$('#eJieCi').val();
			$.ajax({
				type: "get",//方法类型
				url: "../normalUser/applyRoom",
				async:true,
				data: {'roomID':roomID,'zhouCi':zhouCi,'xingQi':xingQi,'sJieCi':sJieCi,'eJieCi':eJieCi},
				success:function(data){
					$("#apply-Modal").html(data);
					$('#apply-Modal').modal();
				},
				error : function() {
					//alert("异常请求！"+data.msg);
					alert("异常请求！");
				}
			});
		}	
    </script>
</body>
</html>