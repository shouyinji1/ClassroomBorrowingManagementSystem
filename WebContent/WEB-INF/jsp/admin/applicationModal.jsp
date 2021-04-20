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
					<h5 class="modal-title" id="exampleModalLabel">审批</h5>
					<c:choose>
						<c:when test="${(!empty application.feedbackTime) and application.readFeedback==false}">
							<button type="button" class="close" data-dismiss="modal" aria-label="Close" onclick="updateReadFeedback()">
								<span aria-hidden="true">&times;</span>
							</button>
						</c:when>
						<c:otherwise>
							<button type="button" class="close" data-dismiss="modal" aria-label="Close">
								<span aria-hidden="true">&times;</span>
							</button>
						</c:otherwise>
					</c:choose>
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
					<hr class="mb-4">
					<h4 class="mb-3">审批</h4>
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
							意见内容：${application.reviewContent}
						</div>
					</div>
					<c:if test="${!empty application.feedbackTime}">
						<hr class="mb-4">
						<h4 class="mb-3">使用者反馈</h4>
						<div class="row">
							<div class="col-sm-12 mb-3">反馈时间：<fmt:formatDate value="${application.feedbackTime}" pattern="yyyy-MM-dd HH:mm:ss" /></div>
						</div>
						<div class="row">
							<div class="col-sm-12 mb-3">反馈内容：${application.feedback}</div>
						</div>
					</c:if>
				</div>
				<div class="modal-footer">
					<c:choose>
						<c:when test="${(!empty application.feedbackTime) and application.readFeedback==false}">
							<button type="button" class="btn btn-secondary" data-dismiss="modal" onclick="updateReadFeedback()">关闭</button>
						</c:when>
						<c:otherwise>
							<button type="button" class="btn btn-secondary" data-dismiss="modal">关闭</button>
						</c:otherwise>
					</c:choose>
				</div>
			</div>
		</div>
	</div>
	<script type="text/javascript">
		function updateReadFeedback(){
			$.get("../admin/updateReadFeedback?id=${application.id}&readFeedback=true");
			document.getElementById('application-${application.id}-status').innerHTML='通过';
		}
	</script>
</body>
</html>