<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<body>
	<div class="modal-dialog modal-xl" role="document">
		<div class="modal-content">
			<div class="modal-header">
				<h4 class="modal-title" id="exampleModalLabel">填写申请</h4>
				<button type="button" class="close" data-dismiss="modal" aria-label="Close">
					<span aria-hidden="true">&times;</span>
				</button>
			</div>
			<div class="modal-body">
				<form id="modal-Application">
					<h5 class="mb-3">申请者信息</h5>
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
					<h5 class="mb-3">教室</h5>
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
					<h5 class="mb-3">申请使用时间</h5>
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
					<h5 class="mb-3">申请目的</h5>
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
				<div class="accordion" id="accordionOne">
					<div class="card">
						<div class="card-header py-3" id="headingOne" onclick="$('#collapseOne').collapse('toggle');">
							<h6 class="m-0 font-weight-bold text-primary">一周的教室安排</h6>
						</div>
						<div id="collapseOne" class="collapse show" aria-labelledby="headingOne" data-parent="#accordionOne">
							<div class="card-body">
								<div class="table-responsive">
									<table class="table table-bordered">
										<thead><tr><td>节次\星期</td><td>一</td><td>二</td><td>三</td><td>四</td><td>五</td><td>六</td><td>日</td></tr></thead>
										<tbody>
											<tr>
												<td>1</td>
												<td bgcolor="${arrange[1][1][0]}">${arrange[1][1][1]}</td>
												<td bgcolor="${arrange[2][1][0]}">${arrange[2][1][1]}</td>
												<td bgcolor="${arrange[3][1][0]}">${arrange[3][1][1]}</td>
												<td bgcolor="${arrange[4][1][0]}">${arrange[4][1][1]}</td>
												<td bgcolor="${arrange[5][1][0]}">${arrange[5][1][1]}</td>
												<td bgcolor="${arrange[6][1][0]}">${arrange[6][1][1]}</td>
												<td bgcolor="${arrange[7][1][0]}">${arrange[7][1][1]}</td>
											</tr>
											<tr>
												<td>2</td>
												<td bgcolor="${arrange[1][2][0]}">${arrange[1][2][1]}</td>
												<td bgcolor="${arrange[2][2][0]}">${arrange[2][2][1]}</td>
												<td bgcolor="${arrange[3][2][0]}">${arrange[3][2][1]}</td>
												<td bgcolor="${arrange[4][2][0]}">${arrange[4][2][1]}</td>
												<td bgcolor="${arrange[5][2][0]}">${arrange[5][2][1]}</td>
												<td bgcolor="${arrange[6][2][0]}">${arrange[6][2][1]}</td>
												<td bgcolor="${arrange[7][2][0]}">${arrange[7][2][1]}</td>
											</tr>
											<tr>
												<td>3</td>
												<td bgcolor="${arrange[1][3][0]}">${arrange[1][3][1]}</td>
												<td bgcolor="${arrange[2][3][0]}">${arrange[2][3][1]}</td>
												<td bgcolor="${arrange[3][3][0]}">${arrange[3][3][1]}</td>
												<td bgcolor="${arrange[4][3][0]}">${arrange[4][3][1]}</td>
												<td bgcolor="${arrange[5][3][0]}">${arrange[5][3][1]}</td>
												<td bgcolor="${arrange[6][3][0]}">${arrange[6][3][1]}</td>
												<td bgcolor="${arrange[7][3][0]}">${arrange[7][3][1]}</td>
											</tr>
											<tr>
												<td>4</td>
												<td bgcolor="${arrange[1][4][0]}">${arrange[1][4][1]}</td>
												<td bgcolor="${arrange[2][4][0]}">${arrange[2][4][1]}</td>
												<td bgcolor="${arrange[3][4][0]}">${arrange[3][4][1]}</td>
												<td bgcolor="${arrange[4][4][0]}">${arrange[4][4][1]}</td>
												<td bgcolor="${arrange[5][4][0]}">${arrange[5][4][1]}</td>
												<td bgcolor="${arrange[6][4][0]}">${arrange[6][4][1]}</td>
												<td bgcolor="${arrange[7][4][0]}">${arrange[7][4][1]}</td>
											</tr>
											<tr><td colspan="8"></td></tr>
											<tr>
												<td>5</td>
												<td bgcolor="${arrange[1][5][0]}">${arrange[1][5][1]}</td>
												<td bgcolor="${arrange[2][5][0]}">${arrange[2][5][1]}</td>
												<td bgcolor="${arrange[3][5][0]}">${arrange[3][5][1]}</td>
												<td bgcolor="${arrange[4][5][0]}">${arrange[4][5][1]}</td>
												<td bgcolor="${arrange[5][5][0]}">${arrange[5][5][1]}</td>
												<td bgcolor="${arrange[6][5][0]}">${arrange[6][5][1]}</td>
												<td bgcolor="${arrange[7][5][0]}">${arrange[7][5][1]}</td>
											</tr>
											<tr>
												<td>6</td>
												<td bgcolor="${arrange[1][6][0]}">${arrange[1][6][1]}</td>
												<td bgcolor="${arrange[2][6][0]}">${arrange[2][6][1]}</td>
												<td bgcolor="${arrange[3][6][0]}">${arrange[3][6][1]}</td>
												<td bgcolor="${arrange[4][6][0]}">${arrange[4][6][1]}</td>
												<td bgcolor="${arrange[5][6][0]}">${arrange[5][6][1]}</td>
												<td bgcolor="${arrange[6][6][0]}">${arrange[6][6][1]}</td>
												<td bgcolor="${arrange[7][6][0]}">${arrange[7][6][1]}</td>
											</tr>
											<tr>
												<td>7</td>
												<td bgcolor="${arrange[1][7][0]}">${arrange[1][7][1]}</td>
												<td bgcolor="${arrange[2][7][0]}">${arrange[2][7][1]}</td>
												<td bgcolor="${arrange[3][7][0]}">${arrange[3][7][1]}</td>
												<td bgcolor="${arrange[4][7][0]}">${arrange[4][7][1]}</td>
												<td bgcolor="${arrange[5][7][0]}">${arrange[5][7][1]}</td>
												<td bgcolor="${arrange[6][7][0]}">${arrange[6][7][1]}</td>
												<td bgcolor="${arrange[7][7][0]}">${arrange[7][7][1]}</td>
											</tr>
											<tr>
												<td>8</td>
												<td bgcolor="${arrange[1][8][0]}">${arrange[1][8][1]}</td>
												<td bgcolor="${arrange[2][8][0]}">${arrange[2][8][1]}</td>
												<td bgcolor="${arrange[3][8][0]}">${arrange[3][8][1]}</td>
												<td bgcolor="${arrange[4][8][0]}">${arrange[4][8][1]}</td>
												<td bgcolor="${arrange[5][8][0]}">${arrange[5][8][1]}</td>
												<td bgcolor="${arrange[6][8][0]}">${arrange[6][8][1]}</td>
												<td bgcolor="${arrange[7][8][0]}">${arrange[7][8][1]}</td>
											</tr>
											<tr>
												<td>9</td>
												<td bgcolor="${arrange[1][9][0]}">${arrange[1][9][1]}</td>
												<td bgcolor="${arrange[2][9][0]}">${arrange[2][9][1]}</td>
												<td bgcolor="${arrange[3][9][0]}">${arrange[3][9][1]}</td>
												<td bgcolor="${arrange[4][9][0]}">${arrange[4][9][1]}</td>
												<td bgcolor="${arrange[5][9][0]}">${arrange[5][9][1]}</td>
												<td bgcolor="${arrange[6][9][0]}">${arrange[6][9][1]}</td>
												<td bgcolor="${arrange[7][9][0]}">${arrange[7][9][1]}</td>
											</tr>
											<tr><td colspan="8"></td></tr>
											<tr>
												<td>10</td>
												<td bgcolor="${arrange[1][10][0]}">${arrange[1][10][1]}</td>
												<td bgcolor="${arrange[2][10][0]}">${arrange[2][10][1]}</td>
												<td bgcolor="${arrange[3][10][0]}">${arrange[3][10][1]}</td>
												<td bgcolor="${arrange[4][10][0]}">${arrange[4][10][1]}</td>
												<td bgcolor="${arrange[5][10][0]}">${arrange[5][10][1]}</td>
												<td bgcolor="${arrange[6][10][0]}">${arrange[6][10][1]}</td>
												<td bgcolor="${arrange[7][10][0]}">${arrange[7][10][1]}</td>
											</tr>
											<tr>
												<td>11</td>
												<td bgcolor="${arrange[1][11][0]}">${arrange[1][11][1]}</td>
												<td bgcolor="${arrange[2][11][0]}">${arrange[2][11][1]}</td>
												<td bgcolor="${arrange[3][11][0]}">${arrange[3][11][1]}</td>
												<td bgcolor="${arrange[4][11][0]}">${arrange[4][11][1]}</td>
												<td bgcolor="${arrange[5][11][0]}">${arrange[5][11][1]}</td>
												<td bgcolor="${arrange[6][11][0]}">${arrange[6][11][1]}</td>
												<td bgcolor="${arrange[7][11][0]}">${arrange[7][11][1]}</td>
											</tr>
											<tr>
												<td>12</td>
												<td bgcolor="${arrange[1][12][0]}">${arrange[1][12][1]}</td>
												<td bgcolor="${arrange[2][12][0]}">${arrange[2][12][1]}</td>
												<td bgcolor="${arrange[3][12][0]}">${arrange[3][12][1]}</td>
												<td bgcolor="${arrange[4][12][0]}">${arrange[4][12][1]}</td>
												<td bgcolor="${arrange[5][12][0]}">${arrange[5][12][1]}</td>
												<td bgcolor="${arrange[6][12][0]}">${arrange[6][12][1]}</td>
												<td bgcolor="${arrange[7][12][0]}">${arrange[7][12][1]}</td>
											</tr>
										</tbody>
									</table>
								</div>
							</div>
						</div>
					</div>
				</div>
				<c:if test="${!empty feedbacks[0].feedbackTime}">
					<div class="accordion" id="accordionTwo">
						<div class="card">
							<div class="card-header py-3" id="headingTwo" onclick="$('#collapseTwo').collapse('toggle');">
								<h6 class="m-0 font-weight-bold text-primary">历史反馈</h6>
							</div>
							<div id="collapseTwo" class="collapse show" aria-labelledby="headingTwo" data-parent="#accordionTwo">
								<div class="card-body">
									<div class="table-responsive">
										<table class="table">
											<c:forEach items="${feedbacks}" var="feedback">
												<tr><td rowspan="2" width="15%">${feedback.user.name}</td><td>${feedback.feedback}</td></tr>
												<tr><td><font size="2"><fmt:formatDate value="${feedback.feedbackTime}" pattern="yyyy-MM-dd HH:mm:ss" /></font></td></tr>
											</c:forEach>
										</table>
									</div>
								</div>
							</div>
						</div>
					</div>
				</c:if>
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