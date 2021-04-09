<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
</head>
<body>
	<form>
		<div class="row">
			<div class="col-sm-2 mb-3">
				<label for="cc-number">申请ID</label>
				<input type="text" class="form-control" placeholder="${application.id}" readonly>
			</div>
			<div class="col-sm-4 mb-3">
				<label for="cc-number">申请发起时间</label>
				<input type="text" class="form-control" placeholder="${application.formatSubmitTime}" readonly>
			</div>
			<div class="col-sm-3 mb-3">
				<label for="cc-number">申请者ID</label>
				<input type="text" class="form-control" placeholder="${application.userID}" readonly>
			</div>
			<div class="col-sm-3 mb-3">
				<label for="cc-number">申请者姓名</label>
				<input type="text" class="form-control" placeholder="${application.user.name}" readonly>
			</div>
		</div>
		<hr class="mb-4">
		<h4 class="mb-3">教室</h4>
		<div class="row">
			<div class="col-sm-3 mb-3">
				<label for="cc-number">教室编号</label>
				<input type="text" class="form-control" placeholder="${application.roomID}" readonly>
			</div>
			<div class="col-sm-3 mb-3">
				<label for="cc-number">教室名称</label>
				<input type="text" class="form-control" placeholder="${application.classroom.name}" readonly>
			</div>
			<div class="col-sm-3 mb-3">
				<label for="cc-number">教室类型</label>
				<input type="text" class="form-control" placeholder="${application.classroom.type}" readonly>
			</div>
			<div class="col-sm-3 mb-3">
				<label for="cc-number">教室容量</label>
				<input type="text" class="form-control" placeholder="${application.classroom.capacity}" readonly>
			</div>
		</div>
		<div class="row">
			<div class="col-sm-3 mb-3">
				<label for="cc-number">校区</label>
				<input type="text" class="form-control" placeholder="${application.classroom.xiaoQu}" readonly>
			</div>
			<div class="col-sm-3 mb-3">
				<label for="cc-number">教学楼</label>
				<input type="text" class="form-control" placeholder="${application.classroom.jiaoXueLou}" readonly>
			</div>
			<div class="col-sm-3 mb-3">
				<label for="cc-number">楼层</label>
				<input type="text" class="form-control" placeholder="${application.classroom.floor}" readonly>
			</div>
		</div>
		<hr class="mb-4">
		<h4 class="mb-3">申请使用时间</h4>
		<div class="row">
			<div class="col-sm-3 mb-3">
				<label for="cc-number">周次</label>
				<input type="text" class="form-control" placeholder="${application.zhouCi}">
			</div>
			<div class="col-sm-3 mb-3">
				<label for="cc-number">星期</label>
				<input type="text" class="form-control" placeholder="${application.xinQi}">
			</div>
			<div class="col-sm-3 mb-3">
				<label for="cc-number">开始节次</label>
				<input type="text" class="form-control" placeholder="${application.sJieCi}">
			</div>
			<div class="col-sm-3 mb-3">
				<label for="cc-number">结束节次</label>
				<input type="text" class="form-control" placeholder="${application.eJieCi}">
			</div>
		</div>
		<hr class="mb-4">
		<h4 class="mb-3">申请目的</h4>
		<div class="form-group row">
			<label for="inputEmail3" class="col-sm-2 col-form-label">申请类型</label>
			<div class="col-sm-3">
				<select class="form-control" id="exampleFormControlSelect1">
					<option>1</option>
					<option>2</option>
					<option>3</option>
					<option>4</option>
					<option>5</option>
				</select>
			</div>
		</div>
		<div class="form-group row">
			<label for="inputEmail3" class="col-sm-2 col-form-label">申请用途</label>
			<div class="col-sm-10">
				<input type="email" class="form-control" id="inputEmail3" placeholder="${application.purpose}">
			</div>
		</div>
		<hr class="mb-4">
		<h4 class="mb-3">审批意见</h4>
		<div class="form-group row">
			<label for="inputEmail3" class="col-sm-2 col-form-label">待审批</label>
		</div>
		<hr class="mb-4">
		<h4 class="mb-3">评论/反馈（使用后可评论反馈）</h4>
		<hr class="mb-4">
		<div class="form-group row">
			<div class="col-sm-10">
				<button type="submit" class="btn btn-primary">提交</button>
			</div>
		</div>
	</form>
</body>
</html>