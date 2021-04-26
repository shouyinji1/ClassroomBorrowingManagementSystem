<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
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
					<h4 class="modal-title" id="exampleModalLabel">审批</h4>
					<button type="button" class="close" data-dismiss="modal" aria-label="Close">
						<span aria-hidden="true">&times;</span>
					</button>
				</div>
				<div class="modal-body">
					<div class="row">
						<div class="col-sm-3 mb-3">
							<label>申请ID</label>
							<input type="text" class="form-control" value="${application.id}" readonly>
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
					<h5 class="mb-3">审批</h5>
					<form id="approval-form">
						<input hidden="hidden" name="id" value="${application.id}" />
						<input hidden="hidden" name="reviewerID" value="${user.id}" />
						<div class="row">
							<div class="col-sm-2 mb-3">审批人：</div>
							<div class="col-sm mb-3">${user.name}</div>
						</div>
						<div class="row">
							<label class="col-sm-2">审批意见：</label>
							<div class="col-sm-10">
								<div class="custom-control custom-radio custom-control-inline">
									<input type="radio" id="approval1" name="approval" class="custom-control-input" value="1">
									<label class="custom-control-label" for="approval1">通过</label>
								</div>
								<div class="custom-control custom-radio custom-control-inline">
									<input type="radio" id="approval2" name="approval" class="custom-control-input" value="0">
									<label class="custom-control-label" for="approval2">不通过</label>
								</div>
							</div>
						</div>
						<div class="form-group row">
							<label class="col-sm-2 col-form-label">审批回复：</label>
							<div class="col-sm-10">
								<textarea class="form-control" id="message-text" name="reviewContent"></textarea>
							</div>
						</div>
					</form>
				</div>
				<div class="modal-footer">
					<button type="button" class="btn btn-secondary" data-dismiss="modal">关闭</button>
					<button type="button" class="btn btn-primary" onclick="approve()" disabled="disabled" id="submitApproval">提交</button>
				</div>
			</div>
		</div>
	</div>
    <script type="text/javascript">
    	$("input[name='approval']").change(function(){
    		$('#submitApproval').attr("disabled",false);
    		//alert($("input[name='approval']:checked").val());
    	});
		function approve(){
			var form=$('#approval-form').serializeArray();
			$.ajax({
				type: "post",//方法类型
				url: "../admin/approve",
				async:true,
				data: form,
				success:function(data){
					if(data=="1"){
						$('#application-Modal').modal('hide');
						document.getElementById('application-${application.id}').remove();
					}else{
						alert("更新异常");
					}
				},
				error : function() {
					alert("异常请求！"+data.msg);
				}
			});
		}	
    </script>
</body>
</html>