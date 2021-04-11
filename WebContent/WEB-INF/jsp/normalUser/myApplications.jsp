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
			<h6 class="m-0 font-weight-bold text-primary">借用记录</h6>
		</div>
		<div class="card-body">
			<div class="table-responsive">
				<table class="table table-bordered table-hover" id="dataTable" width="100%" cellspacing="0">
					<thead>
						<tr>
							<th>申请时间</th>
							<th>教室</th>
							<th>周次</th>
							<th>星期</th>
							<th>开始节次</th>
							<th>结束节次</th>
							<th>审批状态</th>
						</tr>
					</thead>
					<tfoot>
						<tr>
							<th>申请时间</th>
							<th>教室</th>
							<th>周次</th>
							<th>星期</th>
							<th>开始节次</th>
							<th>结束节次</th>
							<th>审批状态</th>
						</tr>
					</tfoot>
					<tbody>
						<c:forEach items="${applications}" var="application" varStatus="status">
							<tr onclick="toApplicationUpdate(${application.id})">
								<td>${application.formatSubmitTime}</td>
								<td>${application.roomID}</td>
								<td>${application.zhouCi}</td>
								<td>${application.xinQi}</td>
								<td>${application.sJieCi}</td>
								<td>${application.eJieCi}</td>
								<td>
									<c:choose>
										<c:when test="${application.approval==true}">已审批通过</c:when>
										<c:when test="${application.approval==false}">已拒绝申请</c:when>
										<c:otherwise>待审批</c:otherwise>
									</c:choose>
								</td>
							</tr>
						</c:forEach>
					</tbody>
				</table>
			</div>
		</div>
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
				"order": [[ 0, "desc" ]]	// 设置默认根据第1列降序
			} );
		} );
    </script>
    <script type="text/javascript">
		function toApplicationUpdate(id){
			$.ajax({
				type: "get",//方法类型
				url: "../normalUser/applicationUpdate" ,
				async:true,
				data: {'id':id},
				success:function(data){
					$("#page-content").html(data);
				},
				error : function() {
					alert("异常请求！"+data.msg);
				}
			});
		}	
    </script>
</body>
</html>