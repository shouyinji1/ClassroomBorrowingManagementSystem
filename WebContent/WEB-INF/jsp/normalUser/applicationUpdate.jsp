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
		<c:if test="${application.approval != null}"><fieldset disabled></c:if>
			<div class="row">
				<div class="col-sm-3 mb-3">
					<label>周次</label>
					<input type="text" class="form-control" name="zhouCi" value="${application.zhouCi}">
				</div>
				<div class="col-sm-3 mb-3">
					<label>星期</label>
					<input type="text" class="form-control" name="xinQi" value="${application.xinQi}">
				</div>
				<div class="col-sm-3 mb-3">
					<label>开始节次</label>
					<input type="text" class="form-control" name="sJieCi" value="${application.sJieCi}">
				</div>
				<div class="col-sm-3 mb-3">
					<label>结束节次</label>
					<input type="text" class="form-control" name="eJieCi" value="${application.eJieCi}">
				</div>
			</div>
			<hr class="mb-4">
			<h4 class="mb-3">申请目的</h4>
			<div class="form-group row">
				<label class="col-sm-2 col-form-label">申请类型</label>
				<div class="col-sm-3">
					<select class="form-control" name="type">
						<option selected="selected" value="${application.type}">${application.type}</option>	
						<c:forEach items="${application.types}" var="type">
							<c:if test="${application.type != type}">
								<option value="${type}">${type}</option>
							</c:if>
						</c:forEach>
					</select>
				</div>
			</div>
			<div class="form-group row">
				<label class="col-sm-2 col-form-label">申请用途</label>
				<div class="col-sm-10">
					<textarea class="form-control" id="message-text" name="purpose">${application.purpose}</textarea>
				</div>
			</div>
		<c:if test="${application.approval != null}"></fieldset></c:if>
	</form>
	<hr class="mb-4">
	<h4 class="mb-3">审批意见</h4>
	<c:choose>
		<c:when test="${application.approval==null}">
			<div class="form-group row">
				<div class="col-sm-2">待审批</div>
			</div>
		</c:when>
		<c:otherwise>
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
		</c:otherwise>
	</c:choose>
	<hr class="mb-4">
	<h4 class="mb-3">评论/反馈（教室使用后可评论反馈）</h4>
	<hr class="mb-4">
	<div class="row">
		<div class="m-auto">
			<button type="submit" class="btn btn-primary" onclick="toUpdateApplication()">提交</button>
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
					if(data=="0"){
						$("#page-content").load("../normalUser/myApplications");
					}else if(data=="1"){
						alert("与已有教室安排时间冲突");
					}else if(data=="2"){
						alert("与已有教室拟借用申请时间冲突");
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