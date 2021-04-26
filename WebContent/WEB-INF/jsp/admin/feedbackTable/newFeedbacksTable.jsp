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
					<th>操作</th>
				</tr>
			</thead>
			<tfoot>
				<tr>
					<th>申请编号</th>
					<th>教室编号</th>
					<th>使用者姓名</th>
					<th>反馈时间</th>
					<th>反馈内容</th>
					<th>操作</th>
				</tr>
			</tfoot>
			<tbody>
				<c:forEach items="${unreadFeedbacks}" var="feedback" varStatus="status">
					<tr id="application-${feedback.id}">
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
						<td>
							<button class="btn btn-primary" type="button" onclick="updateReadFeedback(${feedback.id})">已读</button>
						</td>
					</tr>
				</c:forEach>
			</tbody>
		</table>
	</div>
    <script type="text/javascript">
    	// 更新新反馈计数徽标，新反馈数=原新反馈数-subcount
    	function updateNewFeedbackCounter(subcount){
    		var counter=document.getElementById('feedback-badge-counter').innerHTML;
    		counter=counter-subcount;
			if(counter>0){
				document.getElementById('feedback-badge-counter').innerHTML=counter;
			}else{
				document.getElementById('feedback-badge-counter').remove();
			}
    	}
    
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
			document.getElementById('card-header-text').innerHTML='新反馈';
			
			// 重新设置新反馈计数徽标
			var counter=${newFeedbackCounter};
			if(counter>0){
				document.getElementById('feedback-badge-counter').innerHTML=${newFeedbackCounter};
			}else{
				document.getElementById('feedback-badge-counter').remove();
			}
		});

		// 激活popover插件
		$(function () { $("[data-toggle='popover']").popover(); });
		
		// 已读反馈
		function updateReadFeedback(id){
			$.ajax({
				type: "get",//方法类型
				url: "../admin/updateReadFeedback" ,
				async:true,
				data: {'id':id, 'readFeedback':true},
				success: function (data) {
					if (data=="1") {
						document.getElementById('application-'+id).remove();
						updateNewFeedbackCounter(1);
					}else{
						alert("出错");
					}
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