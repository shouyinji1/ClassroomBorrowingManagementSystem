<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<body>
	<div class="modal-dialog modal-xl" role="document">
		<div class="modal-content">
			<div class="modal-header">
				<h5 class="modal-title" id="exampleModalLabel">填写申请</h5>
				<button type="button" class="close" data-dismiss="modal" aria-label="Close">
					<span aria-hidden="true">&times;</span>
				</button>
			</div>
			<div class="modal-body">
				<form id="modal-Application">
					<h4 class="mb-3">申请者信息</h4>
					<div class="row">
						<div class="col-sm-3 mb-3">
							<label>ID</label>
							<input type="text" class="form-control" name="userID" value="${user.id}" readonly>
						</div>
					</div>
					<div class="row">
						<div class="col-sm-3 mb-3">
							<label>姓名</label>
							<input type="text" class="form-control" value="${user.name}" readonly>
						</div>
						<div class="col-sm-3">
							<label>电话</label>
							<input type="text" class="form-control" value="${user.phone}" readonly>
						</div>
						<div class="col-sm-3">
							<label>邮箱</label>
							<input type="text" class="form-control" value="${user.email}" readonly>
						</div>
						<div class="col-sm-3">
							<label>部门</label>
							<input type="text" class="form-control" value="${user.department}" readonly>
						</div>
					</div>
					<hr class="mb-4">
					<h4 class="mb-3">教室</h4>
					<div class="row">
						<div class="col-sm-3 mb-3">
							<label>教室编号</label>
							<input type="text" class="form-control" name="roomID" value="${application.roomID}" readonly>
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
					<div class="row">
						<div class="col-sm-3 mb-3">
							<label>周次</label>
							<input type="text" class="form-control" name="zhouCi" value="${application.zhouCi}" readonly>
						</div>
						<div class="col-sm-3 mb-3">
							<label>星期</label>
							<input type="text" class="form-control" name="xingQi" value="${application.xingQi}" readonly>
						</div>
						<div class="col-sm-3 mb-3">
							<label>开始节次</label>
							<input type="text" class="form-control" name="sJieCi" value="${application.sJieCi}" readonly>
						</div>
						<div class="col-sm-3 mb-3">
							<label>结束节次</label>
							<input type="text" class="form-control" name="eJieCi" value="${application.eJieCi}" readonly>
						</div>
					</div>
					<hr class="mb-4">
					<h4 class="mb-3">申请目的</h4>
					<div class="form-group row">
						<label class="col-sm-2 col-form-label">申请类型</label>
						<div class="col-sm-3">
							<select class="form-control" name="type">
								<c:forEach items="${application.types}" var="type">
									<option value="${type}">${type}</option>
								</c:forEach>
							</select>
						</div>
					</div>
					<div class="form-group row">
						<label class="col-sm-2 col-form-label">申请用途</label>
						<div class="col-sm-10">
							<textarea class="form-control" id="message-text" name="purpose"></textarea>
						</div>
					</div>
				</form>
				<hr class="mb-4">
				<h4 class="mb-3">评论/反馈（教室使用后可评论反馈）</h4>
				<hr class="mb-4">
			</div>
				<div class="modal-footer">
				<button type="button" class="btn btn-secondary" data-dismiss="modal">关闭</button>
				<button type="button" class="btn btn-primary" onclick="submitApplication()">提交</button>
			</div>
		</div>
	</div>
	<script>
		function submitApplication(){
			var form=$('#modal-Application').serializeArray();
			$.ajax({
				type: "post",//方法类型
				url: "../normalUser/submitApplication" ,
				dataType:"text",
				async:true,
				data: form,
				success: function (data) {
					if(data=='1'){
						$('#apply-Modal').modal('hide');
					}else if(data=='0'){
						alert('你选定的教室和时间已经被人抢走了！');
					}else{
						alert('提交异常');
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