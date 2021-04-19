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
			<h6 class="m-0 font-weight-bold text-primary" id="applications-table-title">${applicationsTableTitle}</h6>
		</div>
		<div class="card-body">
			<div class="table-responsive">
				<table class="table table-bordered table-hover" id="dataTable" width="100%" cellspacing="0">
					<thead>
						<tr>
							<th>申请时间</th>
							<th>申请者</th>
							<th>教室</th>
							<th>周次</th>
							<th>星期</th>
							<th>开始节次</th>
							<th>结束节次</th>
							<th>审批结果</th>
						</tr>
					</thead>
					<tfoot>
						<tr>
							<th>申请时间</th>
							<th>申请者</th>
							<th>教室</th>
							<th>周次</th>
							<th>星期</th>
							<th>开始节次</th>
							<th>结束节次</th>
							<th>审批结果</th>
						</tr>
					</tfoot>
					<tbody>
						<c:forEach items="${applications}" var="application" varStatus="status">
							<tr onclick="application(${application.id})">
								<td>${application.formatSubmitTime}</td>
								<td>${application.user.name}</td>
								<td>${application.roomID}</td>
								<td>${application.zhouCi}</td>
								<td>${application.xingQi}</td>
								<td>${application.sJieCi}</td>
								<td>${application.eJieCi}</td>
								<td>
									<c:choose>
										<c:when test="${application.approval==true}">通过</c:when>
										<c:when test="${application.approval==false}">已拒绝申请</c:when>
										<c:when test="${empty application.approval}">
											<c:choose>
												<c:when test="${application.aging==true}">已过期</c:when>
												<c:when test="${application.aging==false}">待审批</c:when>
											</c:choose>
										</c:when>
									</c:choose>
								</td>
							</tr>
						</c:forEach>
					</tbody>
				</table>
			</div>
		</div>
	</div>
	<div id="application-Modal-div"></div>
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
		function application(id){
			$.ajax({
				type: "get",//方法类型
				url: "../admin/viewApplication" ,
				async:true,
				data: {'id':id},
				success:function(data){
					$("#application-Modal-div").html(data);
					$("#application-Modal").modal();
				},
				error : function() {
					alert("异常请求！"+data.msg);
				}
			});
		}	
    </script>
</body>
</html>