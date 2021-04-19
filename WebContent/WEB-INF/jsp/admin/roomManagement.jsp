<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<body>
	<div class="card shadow mb-4">
		<div class="card-header py-3">
			<h6 class="m-0 font-weight-bold text-primary">查找教室</h6>
		</div>
		<div class="card-body">
			<form id="queryRooms">
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
					<div class="col-sm-6">
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
			$("#JiaoXueQu").load("../admin/roomsOption?select=XiaoQu&xiaoQu="+opt);
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
			$("#JiaoXueLou").load("../admin/roomsOption?select=JiaoXueQu&xiaoQu="+xiaoQu
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
			$("#type").load("../admin/roomsOption?select=JiaoXueLou&xiaoQu="+xiaoQu
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
			$("#floor").load("../admin/roomsOption?select=type&xiaoQu="+xiaoQu
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
			$("#roomID").load("../admin/roomsOption?select=floor&xiaoQu="+xiaoQu
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
			var form=$('#queryRooms').serializeArray();
			$.ajax({
				type: "post",//方法类型
				url: "../admin/queryRooms" ,
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