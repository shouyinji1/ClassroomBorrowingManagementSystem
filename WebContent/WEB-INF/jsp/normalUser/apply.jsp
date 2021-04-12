<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
</head>
<body>
<h1 class="h3 mb-2 text-gray-800">查找教室</h1>
	<form>
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
			<div class="form-group col-sm-2">
				<label for="JiaoXueLou">教学楼</label>
				<select class="form-control" disabled="disabled" id="JiaoXueLou">
					<option selected="selected" disabled="disabled"  style='display: none' value=''></option>
				</select>
			</div>
			<div class="form-group col-sm-3">
				<label for="type">类型</label>
				<select class="form-control" id="type" name="type" disabled="disabled">
					<option selected="selected" disabled="disabled"  style='display: none' value=''></option>
				</select>
			</div>
			<div class="form-group col-sm-2">
				<label for="floor">楼层</label>
				<select class="form-control" id="floor" name="floor" disabled="disabled">
					<option selected="selected" disabled="disabled"  style='display: none' value=''></option>
				</select>
			</div>
			<div class="form-group col-sm-2">
				<label for="roomID">教室</label>
				<select class="form-control" id="roomID" disabled="disabled">
					<option selected="selected" disabled="disabled"  style='display: none' value=''></option>
				</select>
			</div>
		</div>
		<div class="row">
			<div class="col-sm-2 mb-3">
				<label for="cc-number">人数</label>
				<input type="text" class="form-control" id="cc-number" placeholder="">
				<div class="invalid-feedback">
					Credit card number is required
				</div>
			</div>
			<div class="form-group col-sm-2">
				<label for="exampleFormControlSelect1">状态</label>
				<select class="form-control" id="exampleFormControlSelect1">
					<option>1</option>
					<option>2</option>
					<option>3</option>
					<option>4</option>
					<option>5</option>
				</select>
			</div>
			<div class="form-group col-sm-3">
				<label for="exampleFormControlSelect1">周次</label>
				<div class="form-row">
					<select class="form-control col-5" id="exampleFormControlSelect1">
						<option selected="selected" disabled="disabled"  style='display: none' value=''></option>
						<option>1</option>
						<option>2</option>
						<option>3</option>
						<option>4</option>
						<option>5</option>
					</select>
					到
					<select class="form-control col-5" id="exampleFormControlSelect1">
						<option selected="selected" disabled="disabled"  style='display: none' value=''></option>
						<option>1</option>
						<option>2</option>
						<option>3</option>
						<option>4</option>
						<option>5</option>
					</select>
				</div>
			</div>
			<div class="form-group col-sm-3">
				<label for="exampleFormControlSelect1">节次</label>
				<div class="form-row">
					<select class="form-control col-5" id="exampleFormControlSelect1">
						<option>1</option>
						<option>2</option>
						<option>3</option>
						<option>4</option>
						<option>5</option>
					</select>
					到
					<select class="form-control col-5" id="exampleFormControlSelect1">
						<option>1</option>
						<option>2</option>
						<option>3</option>
						<option>4</option>
						<option>5</option>
					</select>
				</div>
			</div>
        	<button class="btn btn-primary btn-lg btn-block col-sm-2" type="button">查询</button>
		</div>
	</form>
	<hr class="mb-4">
	<script type="text/javascript">
		$("#XiaoQu").change(function(){
			var opt=$("#XiaoQu").val();
			$("#JiaoXueLou").load("../normalUser/selectOption?select=XiaoQu&xiaoQu="+opt);
			$('#JiaoXueLou').attr("disabled",false);
			$('#type').attr("disabled","disabled");
			$('#type').val('');
			$('#floor').attr("disabled","disabled");
			$('#floor').val('');
			$('#roomID').attr("disabled","disabled");
			$('#roomID').val('');
		});
		$("#JiaoXueLou").change(function(){
			var opt1=$("#XiaoQu").val();
			var opt2=$("#JiaoXueLou").val();
			//$("#floor").load("../normalUser/selectOption?select=JiaoXueLou&xiaoQu="+opt1+"&jiaoXueLou="+opt2);
			$("#type").load("../normalUser/selectOption?select=JiaoXueLou&xiaoQu="+opt1
					+"&jiaoXueLou="+opt2);
			$('#type').attr("disabled",false);
			$('#floor').attr("disabled","disabled");
			$('#floor').val('');
			$('#roomID').attr("disabled","disabled");
			$('#roomID').val('');
		});
		$("#floor").change(function(){
			var opt1=$("#XiaoQu").val();
			var opt2=$("#JiaoXueLou").val();
			var opt3=$("#floor").val();
			$("#type").load("../normalUser/selectOption?select=floor&xiaoQu="+opt1
					+"&jiaoXueLou="+opt2
					+"&floor="+opt3);
			$('#roomID').attr("disabled","disabled");
			$('#roomID').val('');
		});
	</script>
</body>
</html>