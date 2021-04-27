<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
</head>
<body>
	<div class="modal fade" id="application-Modal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
		<div class="modal-dialog modal-xl" role="document">
			<div class="modal-content">
				<div class="modal-header">
					<h4 class="modal-title" id="exampleModalLabel">填写申请</h4>
					<button type="button" class="close" data-dismiss="modal" aria-label="Close">
						<span aria-hidden="true">&times;</span>
					</button>
				</div>
				<div class="modal-body">
					<div class="mb-3">
						<a href="../normalUser/downloadApplication?id=${application.id}" class="d-none d-sm-inline-block btn btn-sm btn-primary shadow-sm"><i class="fas fa-download fa-sm text-white-50"></i> 下载申请表</a>
					</div>
					<div class="row">
						<div class="col-sm-3 mb-3">
							<label>申请ID</label>
							<input type="text" class="form-control" id="application-id" value="${application.id}" readonly>
						</div>
						<div class="col-sm-6 mb-3">
							<label>申请发起时间</label>
							<input type="text" class="form-control" value="${application.formatSubmitTime}" readonly>
						</div>
						<div class="col-sm-3 mb-3">
							<label>申请者ID</label>
							<input type="text" class="form-control" value="${application.userID}" readonly>
						</div>
					</div>
					<div class="row">
						<div class="col-sm-3 mb-3">
							<label>申请者姓名</label>
							<input type="text" class="form-control" value="${application.user.name}" readonly>
						</div>
						<div class="col-sm-3">
							<label>申请者电话</label>
							<input type="text" class="form-control" value="${application.user.phone}" readonly>
						</div>
						<div class="col-sm-3">
							<label>申请者邮箱</label>
							<input type="text" class="form-control" value="${application.user.email}" readonly>
						</div>
						<div class="col-sm-3">
							<label>申请者部门</label>
							<input type="text" class="form-control" value="${application.user.department}" readonly>
						</div>
					</div>
					<hr class="mb-4">
					<h5 class="mb-3">教室</h5>
					<div class="row">
						<div class="col-sm-3 mb-3">
							<label>教室编号</label>
							<input type="text" class="form-control" value="${application.roomID}" readonly>
						</div>
						<div class="col-sm-3 mb-3">
							<label>教室名称</label>
							<input type="text" class="form-control" value="${application.classroom.name}" readonly>
						</div>
						<div class="col-sm-3 mb-3">
							<label>教室类型</label>
							<input type="text" class="form-control" value="${application.classroom.type}" readonly>
						</div>
						<div class="col-sm-3 mb-3">
							<label>教室容量</label>
							<input type="text" class="form-control" value="${application.classroom.capacity}" readonly>
						</div>
					</div>
					<div class="row">
						<div class="col-sm-3 mb-3">
							<label>校区</label>
							<input type="text" class="form-control" value="${application.classroom.xiaoQu}" readonly>
						</div>
						<div class="col-sm-3 mb-3">
							<label>教学区</label>
							<input type="text" class="form-control" value="${application.classroom.jiaoXueQu}" readonly>
						</div>
						<div class="col-sm-3 mb-3">
							<label>教学楼</label>
							<input type="text" class="form-control" value="${application.classroom.jiaoXueLou}" readonly>
						</div>
						<div class="col-sm-3 mb-3">
							<label>楼层</label>
							<input type="text" class="form-control" value="${application.classroom.floor}" readonly>
						</div>
					</div>
					<hr class="mb-4">
					<h5 class="mb-3">申请使用时间</h5>
					<fieldset disabled>
						<div class="row">
							<div class="col-sm-3 mb-3">
								<label>周次</label>
								<input type="text" class="form-control" value="${application.zhouCi}" readonly>
							</div>
							<div class="col-sm-3 mb-3">
								<label>星期</label>
								<input type="text" class="form-control" value="${application.xingQi}" readonly>
							</div>
							<div class="col-sm-3 mb-3">
								<label>开始节次</label>
								<select class="form-control" id="sJieCi">
									<option value="${application.sJieCi}" selected="selected">${application.sJieCi}</option>
								</select>
							</div>
							<div class="col-sm-3 mb-3">
								<label>结束节次</label>
								<select class="form-control" id="eJieCi">
									<option value="${application.eJieCi}" selected="selected">${application.eJieCi}</option>
								</select>
							</div>
						</div>
						<hr class="mb-4">
						<h5 class="mb-3">申请目的</h5>
						<div class="form-group row">
							<label class="col-sm-2 col-form-label">申请类型</label>
							<div class="col-sm-3">
								<select class="form-control">
									<option selected="selected" value="${application.type}">${application.type}</option>	
								</select>
							</div>
						</div>
						<div class="form-group row">
							<label class="col-sm-2 col-form-label">申请用途</label>
							<div class="col-sm-10">
								<textarea class="form-control" id="message-text" name="purpose">${application.purpose}</textarea>
							</div>
						</div>
					</fieldset>
					<hr class="mb-4">
					<h5 class="mb-3">审批情况</h5>
					<div class="row">
						<div class="col-sm-12 mb-3">
							审批人：${application.reviewer.name}
						</div>
					</div>
					<div class="row">
						<div class="col-sm-12 mb-3">
							审批时间：${application.formatReviewTime}
						</div>
					</div>
					<div class="row">
						<div class="col-sm-12 mb-3">
							审批意见：通过
						</div>
					</div>
					<div class="row">
						<div class="col-sm-12 mb-3">
							意见内容：${application.reviewContent}
						</div>
					</div>
					<hr class="mb-4">
					<h5 class="mb-3">我的反馈</h5>
					<form id="feedback-form">
						<input type="hidden" name="id" value="${application.id}">
						<div class="form-group row">
							<label class="col-sm-2 col-form-label">反馈内容：</label>
							<div class="col-sm-10">
								<textarea class="form-control" id="feedback-text" onkeyup="feedbackTextChange()" name="feedback"></textarea>
							</div>
						</div>
					</form>
					<div class="modal-footer">
						<button type="button" class="btn btn-secondary" data-dismiss="modal">关闭</button>
						<button type="button" class="btn btn-primary" id="submitFeedbackButton" onclick="submitFeedback()" disabled="disabled">提交</button>
					</div>
				</div>
			</div>
		</div>
	</div>
	<script type="text/javascript">
		function feedbackTextChange(){
			var feedbackText=$('#feedback-text').val();
			if(feedbackText !=null && feedbackText != ''){
				$("#submitFeedbackButton").attr("disabled",false);
			}else{
				$("#submitFeedbackButton").attr("disabled",true);
			}
		}
		function submitFeedback(){
			var form=$('#feedback-form').serializeArray();
			$.ajax({
				type: "post",//方法类型
				url: "../normalUser/submitFeedback" ,
				dataType:"text",
				async:true,
				data: form,
				success: function (data) {
					if (data=="1") {
						$("#application-Modal").modal('hide');
						document.getElementById('application-${application.id}-status').innerHTML='审核通过';
					 }else{
						alert("提交失败");
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