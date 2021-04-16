<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
</head>
<body>
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
	<h4 class="mb-3">教室</h4>
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
	<h4 class="mb-3">申请使用时间</h4>
	<form>
		<input type="hidden" name="id" value="${application.id}">
		<input type="hidden" name="roomID" value="${application.roomID}">
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
			<h4 class="mb-3">申请目的</h4>
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
	</form>
	<hr class="mb-4">
	<h4 class="mb-3">审批情况</h4>
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
			审批意见：${application.approval ? '通过' : '不通过'}
		</div>
	</div>
	<div class="row">
		<div class="col-sm-12 mb-3">
			审批回复：${application.reviewContent}
		</div>
	</div>
	<hr class="mb-4">
	<h4 class="mb-3">评论/反馈（教室使用后可评论反馈）</h4>
	<hr class="mb-4">
	<div class="row">
		<div class="m-auto">
			<button type="submit" class="btn btn-primary" onclick="">提交</button>
			<button type="button" class="btn btn-secondary" onclick="$('#page-content').load('../normalUser/myApplications')">返回</button>
		</div>
	</div>
    <script type="text/javascript">
		function toUpdateApplication(){
			var form=$('form').serializeArray();
			$.ajax({
				type: "post",//方法类型
				url: "../normalUser/updateApplication",
				async:true,
				data: form,
				success:function(data){
					if(data=="1"){
						$("#page-content").load("../normalUser/myApplications");
					}else if(data=="0"){
						alert("与已有教室安排或申请安排时间冲突");
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