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
					<h4 class="modal-title" id="exampleModalLabel">填写申请</h4>
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
					<form>
						<input type="hidden" name="id" value="${application.id}">
						<input type="hidden" name="roomID" value="${application.roomID}">
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
								<select class="form-control" id="sJieCi" name="sJieCi">
									<c:forEach begin="1" end="12" var="i">
										<c:choose>
											<c:when test="${application.sJieCi==i}">
												<option value="${i}" selected="selected">${i}</option>
											</c:when>
											<c:otherwise><option value="${i}">${i}</option></c:otherwise>
										</c:choose>
									</c:forEach>
								</select>
							</div>
							<div class="col-sm-3 mb-3">
								<label>结束节次</label>
								<select class="form-control" id="eJieCi" name="eJieCi">
									<c:forEach begin="1" end="12" var="i">
										<c:choose>
											<c:when test="${application.eJieCi==i}">
												<option value="${i}" selected="selected">${i}</option>
											</c:when>
											<c:otherwise><option value="${i}">${i}</option></c:otherwise>
										</c:choose>
									</c:forEach>
								</select>
							</div>
						</div>
						<hr class="mb-4">
						<h5 class="mb-3">申请目的</h5>
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
					</form>
					<hr class="mb-4">
					<h5 class="mb-3">审批情况</h5>
					<div class="form-group row">
						<div class="col-sm-2">待审批</div>
					</div>
					<div class="modal-footer">
						<button type="button" class="btn btn-secondary" data-dismiss="modal">关闭</button>
						<button type="button" class="btn btn-primary" onclick="toUpdateApplication()">修改</button>
						<button type="button" class="btn btn-danger" onclick="deleteApplication(${application.id})">删除</button>
					</div>
				</div>
			</div>
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
						document.getElementById('application-${application.id}-sJieCi').innerHTML=$('#sJieCi').val();
						document.getElementById('application-${application.id}-eJieCi').innerHTML=$('#eJieCi').val();
						$("#application-Modal").modal('hide');
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
		function deleteApplication(id){
			$.ajax({
				type: "post",//方法类型
				url: "../normalUser/deleteApplicationById",
				async:true,
				data: {'id':id},
				success:function(data){
					if(data=='1'){
						$("#application-Modal").modal('hide');
						document.getElementById('application-${application.id}').remove();
					}else if(data=='0'){
						alert("删除失败");
					}else{
						alert("删除异常");
					}
				},
				error : function() {
					alert("异常请求！"+data.msg);
				}
			});
		}	
		$("#sJieCi").change(function(){
			var sJieCi=$("#sJieCi").val();
			var eJieCi=$("#eJieCi").val();
			var newOptions='';
			for(var i=sJieCi;i<=12;i++){	// 结束节次始终保持大于等于开始节次
				if(i==sJieCi && sJieCi>eJieCi){
					newOptions+="<option selected='selected' value='"+sJieCi+"'>"+sJieCi+"</option>";
				}else if(i==eJieCi){
					newOptions+="<option selected='selected' value='"+eJieCi+"'>"+eJieCi+"</option>";
				}else{
					newOptions+="<option value='"+i+"'>"+i+"</option>";
				}
			}
			document.getElementById("eJieCi").innerHTML=newOptions;
		});
    </script>
</body>
</html>