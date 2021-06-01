<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<body>
	<div class="card shadow mb-4">
		<div class="card-header py-3 d-flex flex-row align-items-center justify-content-between">
			<h6 class="m-0 font-weight-bold text-primary">查找历史审批记录</h6>
			<div class="dropdown no-arrow">
				<a class="dropdown-toggle" href="#" role="button" id="dropdownMenuLink" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
					<i class="fas fa-ellipsis-v fa-sm fa-fw text-gray-400"></i>
				</a>
				<div class="dropdown-menu dropdown-menu-right shadow animated--fade-in" aria-labelledby="dropdownMenuLink" style="">
					<div class="dropdown-header">选择</div>
					<a class="dropdown-item" onclick="$('#page-content').load('../admin/historicalApplications')">根据教室查找</a>
					<a class="dropdown-item" onclick="$('#page-content').load('../admin/historicalApplicationsByUser')">根据用户查找</a>
				</div>
			</div>
		</div>
		<div class="card-body">
			<form id="queryHistoricalApplications">
				<div class="row">
					<div class="form-group col-sm">
						<label for="input-UserID">用户编号</label>
						<input type="text" class="form-control" id="input-UserID" name="userID" placeholder="" onkeyup="checkInputUserID()">
						<div class="invalid-feedback">
							输入不合法
						</div>
					</div>
					<div class="col-sm">
						<label></label>
						<button class="btn btn-primary btn-lg btn-block" type="button" disabled="disabled" id="query" onclick="queryRooms()">查询</button>
					</div>
				</div>
			</form>
		</div>
	</div>
	<div id="applications-div">
	</div>
	<script type="text/javascript">
		// 检查用户编号输入框是否输入，若有，允许查询
		function checkInputUserID(){
			if($("#input-UserID").val() !=null && $("#input-UserID").val() !=""){
				$("#query").attr("disabled",false);
			}else{
				$("#query").attr("disabled",true);
			}
		}

		$(document).ready(function() {
			$("#applications-div").load("../admin/getReviewedApplicationsOf7Days");
		});

		function queryRooms(){	//查询满足条件的教室
			var form=$('#queryHistoricalApplications').serializeArray();
			$.ajax({
				type: "post",//方法类型
				url: "../admin/queryHistoricalApplicationsByUserID",
				dataType:"text",
				async:true,
				data: form,
				success: function (data) {
					$('#applications-div').html(data);
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