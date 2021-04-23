<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<body>
	<div class="table-responsive">
		<table class="table table-bordered table-hover" id="dataTable" width="100%" cellspacing="0">
			<thead>
				<tr>
					<th>申请编号</th>
					<th>教室编号</th>
					<th>使用者姓名</th>
					<th>反馈时间</th>
					<th>反馈内容</th>
				</tr>
			</thead>
			<tfoot>
				<tr>
					<th>申请编号</th>
					<th>教室编号</th>
					<th>使用者姓名</th>
					<th>反馈时间</th>
					<th>反馈内容</th>
				</tr>
			</tfoot>
			<tbody>
				<c:forEach items="${recentFeedbacks}" var="feedback" varStatus="status">
					<tr>
						<td>${feedback.id}</td>
						<td data-trigger="hover" data-html="true" data-toggle="popover" title="教室信息" 
							data-content="教室名：${feedback.classroom.name}</br>
								教室类型：${feedback.classroom.type}</br>校区：${feedback.classroom.xiaoQu}</br>
								教学区：${feedback.classroom.jiaoXueQu}</br>
								教学楼：${feedback.classroom.jiaoXueLou}</br>
								楼层：${feedback.classroom.floor}</br>
								容量：${feedback.classroom.capacity}">${feedback.roomID}</td>
						<td data-trigger="hover" data-html="true" data-toggle="popover" title="用户信息" 
							data-content="用户编号：${feedback.userID}</br>
								电话号码：${feedback.user.phone}</br>邮箱：${feedback.user.email}</br>
								部门：${feedback.user.department}">${feedback.user.name}</td>
						<td><fmt:formatDate value="${feedback.feedbackTime}" pattern="yyyy-MM-dd HH:mm:ss" /></td>
						<td>${feedback.feedback}</td>
					</tr>
				</c:forEach>
			</tbody>
		</table>
	</div>
    <script type="text/javascript">
		// Call the dataTables jQuery plugin
		$(document).ready(function() {
			$('#dataTable').DataTable( {
 			   	// 设置datatables插件的显示语言为中文
				language: {
					// https://github.com/DataTables/Plugins/tree/master/i18n/zh.json
					url: '../vendor/datatables/zh.json'
				},
			});
			
			// 改变卡片标题
			document.getElementById('card-header-text').innerHTML='最近7天的反馈';
		});

		// 激活popover插件
		$(function () { $("[data-toggle='popover']").popover(); });
    </script>
</body>
</html>