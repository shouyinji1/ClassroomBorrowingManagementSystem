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
					<div class="form-group col-sm-3">
						<label for="XiaoQu">校区</label>
						<select class="form-control" id="XiaoQu" name="xiaoQu">
							<option selected="selected" disabled="disabled"  style='display: none' value=''></option>
							<c:forEach items="${allXiaoQu}" var="xiaoQu">
								<option value="${xiaoQu}">${xiaoQu}</option>
							</c:forEach>
						</select>
					</div>
					<div class="form-group col-sm-3">
						<label for="JiaoXueQu">教学区</label>
						<select class="form-control" disabled="disabled" id="JiaoXueQu" name="jiaoXueQu">
							<option selected="selected" disabled="disabled"  style='display: none' value=''></option>
						</select>
					</div>
					<div class="form-group col-sm-3">
						<label for="JiaoXueLou">教学楼</label>
						<select class="form-control" disabled="disabled" id="JiaoXueLou" name="jiaoXueLou">
							<option selected="selected" disabled="disabled"  style='display: none' value=''></option>
						</select>
					</div>
					<div class="form-group col-sm-3">
						<label for="type">类型</label>
						<select class="form-control" id="type" name="type" disabled="disabled">
							<option selected="selected" disabled="disabled"  style='display: none' value=''></option>
						</select>
					</div>
				</div>
				<div class="row">
					<div class="form-group col-sm-3">
						<label for="floor">楼层</label>
						<select class="form-control" id="floor" name="floor" disabled="disabled">
							<option selected="selected" disabled="disabled"  style='display: none' value=''></option>
						</select>
					</div>
					<div class="form-group col-sm-3">
						<label for="roomID">教室</label>
						<select class="form-control" id="roomID" disabled="disabled" name="id">
							<option selected="selected" disabled="disabled"  style='display: none' value=''></option>
						</select>
					</div>
					<div class="form-group col-sm-3">
						<label>审批结果</label>
						<select class="form-control" name="approval">
							<option selected="selected" value='-1'>所有结果</option>
							<option value='1'>通过</option>
							<option value='0'>拒绝</option>
						</select>
					</div>
					<div class="col-sm-3">
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
		$("#XiaoQu").change(function(){
			var opt=$("#XiaoQu").val();
			$("#JiaoXueQu").load("../admin/applicationsOption?select=XiaoQu&xiaoQu="+opt);
			$('#JiaoXueQu').attr("disabled",false);
			$('#JiaoXueLou').attr("disabled","disabled");
			$('#JiaoXueLou').val('');
			$('#type').attr("disabled","disabled");
			$('#type').val('');
			$('#floor').attr("disabled","disabled");
			$('#floor').val('');
			$('#roomID').attr("disabled","disabled");
			$('#roomID').val('');
			$('#query').attr("disabled","disabled");
		});
		$("#JiaoXueQu").change(function(){
			var xiaoQu=$("#XiaoQu").val();
			var jiaoXueQu=$("#JiaoXueQu").val();
			$("#JiaoXueLou").load("../admin/applicationsOption?select=JiaoXueQu&xiaoQu="+xiaoQu
					+"&jiaoXueQu="+jiaoXueQu);
			$('#JiaoXueLou').attr("disabled",false);
			$('#type').attr("disabled","disabled");
			$('#type').val('');
			$('#floor').attr("disabled","disabled");
			$('#floor').val('');
			$('#roomID').attr("disabled","disabled");
			$('#roomID').val('');
			$('#query').attr("disabled","disabled");
		});
		$("#JiaoXueLou").change(function(){
			var xiaoQu=$("#XiaoQu").val();
			var jiaoXueQu=$("#JiaoXueQu").val();
			var jiaoXueLou=$("#JiaoXueLou").val();
			$("#type").load("../admin/applicationsOption?select=JiaoXueLou&xiaoQu="+xiaoQu
					+"&jiaoXueQu="+jiaoXueQu
					+"&jiaoXueLou="+jiaoXueLou);
			$('#type').attr("disabled",false);
			$('#floor').attr("disabled","disabled");
			$('#floor').val('');
			$('#roomID').attr("disabled","disabled");
			$('#roomID').val('');
			$('#query').attr("disabled","disabled");
		});
		$("#type").change(function(){
			var xiaoQu=$("#XiaoQu").val();
			var jiaoXueQu=$("#JiaoXueQu").val();
			var jiaoXueLou=$("#JiaoXueLou").val();
			var type=$("#type").val();
			$("#floor").load("../admin/applicationsOption?select=type&xiaoQu="+xiaoQu
					+"&jiaoXueQu="+jiaoXueQu
					+"&jiaoXueLou="+jiaoXueLou
					+"&type="+type);
			$('#floor').attr("disabled",false);
			$('#roomID').attr("disabled","disabled");
			$('#roomID').val('');
			$('#query').attr("disabled",false);
		});
		$("#floor").change(function(){
			var xiaoQu=$("#XiaoQu").val();
			var jiaoXueQu=$("#JiaoXueQu").val();
			var jiaoXueLou=$("#JiaoXueLou").val();
			var type=$("#type").val();
			var floor=$("#floor").val();
			$("#roomID").load("../admin/applicationsOption?select=floor&xiaoQu="+xiaoQu
					+"&jiaoXueQu="+jiaoXueQu
					+"&jiaoXueLou="+jiaoXueLou
					+"&type="+type
					+"&floor="+floor);
			if($('#floor').val()==''){
				$('#roomID').attr("disabled",'disabled');
			}else{
				$('#roomID').attr("disabled",false);
			}
		});
		function queryRooms(){	//查询满足条件的教室
			var form=$('#queryHistoricalApplications').serializeArray();
			$.ajax({
				type: "post",//方法类型
				url: "../admin/queryHistoricalApplications" ,
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
		$(document).ready(function() {
			$("#applications-div").load("../admin/getReviewedApplicationsOf7Days");
		});
	</script>
</body>
</html>