<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
</head>
<body>
	<!-- DataTales Example -->
	<div class="card shadow mb-4">
		<div class="card-header py-3 d-flex flex-row align-items-center justify-content-between">
			<h6 class="m-0 font-weight-bold text-primary" id="card-header-text">新反馈</h6>
			<div class="dropdown no-arrow">
			<a class="dropdown-toggle" href="#" role="button" id="dropdownMenuLink" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
				<i class="fas fa-ellipsis-v fa-sm fa-fw text-gray-400"></i>
			</a>
			<div class="dropdown-menu dropdown-menu-right shadow animated--fade-in" aria-labelledby="dropdownMenuLink" style="">
				<div class="dropdown-header">选择</div>
					<a class="dropdown-item" onclick="$('#feedback-Table-body').load('../admin/newFeedbacksTable')">新反馈</a>
					<a class="dropdown-item" onclick="$('#feedback-Table-body').load('../admin/recentFeedbacksTable')">最近7天的反馈</a>
				</div>
			</div>
		</div>
		<div class="card-body" id="feedback-Table-body">
		</div>
	</div>
    <!-- Page level custom scripts -->
    <script type="text/javascript">
		$(document).ready(function() {
			// 加载新反馈
			$("#feedback-Table-body").load("../admin/newFeedbacksTable");
		});
    </script>
</body>
</html>