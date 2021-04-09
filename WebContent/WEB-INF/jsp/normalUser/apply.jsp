<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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
				<label for="exampleFormControlSelect1">校区</label>
				<select class="form-control" id="exampleFormControlSelect1">
					<option>1</option>
					<option>2</option>
					<option>3</option>
					<option>4</option>
					<option>5</option>
				</select>
			</div>
			<div class="form-group col-sm-3">
				<label for="exampleFormControlSelect1">教学楼</label>
				<select class="form-control" id="exampleFormControlSelect1">
					<option>1</option>
					<option>2</option>
					<option>3</option>
					<option>4</option>
					<option>5</option>
				</select>
			</div>
			<div class="form-group col-sm-2">
				<label for="exampleFormControlSelect1">楼层</label>
				<select class="form-control" id="exampleFormControlSelect1">
					<option>1</option>
					<option>2</option>
					<option>3</option>
					<option>4</option>
					<option>5</option>
				</select>
			</div>
			<div class="form-group col-sm-2">
				<label for="exampleFormControlSelect1">类型</label>
				<select class="form-control" id="exampleFormControlSelect1">
					<option>1</option>
					<option>2</option>
					<option>3</option>
					<option>4</option>
					<option>5</option>
				</select>
			</div>
			<div class="form-group col-sm-2">
				<label for="exampleFormControlSelect1">教室</label>
				<select class="form-control" id="exampleFormControlSelect1">
					<option>1</option>
					<option>2</option>
					<option>3</option>
					<option>4</option>
					<option>5</option>
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
</body>
</html>