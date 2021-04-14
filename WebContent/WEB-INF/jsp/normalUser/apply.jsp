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
				<label for="JiaoXueQu">教学区</label>
				<select class="form-control" disabled="disabled" id="JiaoXueQu" name="jiaoXueQu">
					<option selected="selected" disabled="disabled"  style='display: none' value=''></option>
				</select>
			</div>
			<div class="form-group col-sm-2">
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
			<div class="form-group col-sm-2">
				<label for="floor">楼层</label>
				<select class="form-control" id="floor" name="floor" disabled="disabled">
					<option selected="selected" disabled="disabled"  style='display: none' value=''></option>
				</select>
			</div>
		</div>
		<div class="row">
			<div class="form-group col-sm-2">
				<label for="roomID">教室</label>
				<select class="form-control" id="roomID" disabled="disabled" name="roomID">
					<option selected="selected" disabled="disabled"  style='display: none' value=''></option>
				</select>
			</div>
			<div class="col-sm-2 mb-2">
				<label for="capacity">人数</label>
				<input type="text" class="form-control" id="capacity" name="capacity" placeholder="">
				<div class="invalid-feedback">
					输入不合法
				</div>
			</div>
			<div class="form-group col-sm-2">
				<label for="zhouCi">周次</label>
				<select class="form-control" id="zhouCi" name="zhouCi">
					<option value="${zhouCi}" selected="selected">${zhouCi}</option>
					<c:forEach begin="${zhouCi+1}" end="${semester.tWeeks}" var="i">
						<option value="${i}">${i}</option>
					</c:forEach>
				</select>
			</div>
			<div class="form-group col-sm-2">
				<label for="xingQi">星期</label>
				<select class="form-control" id="xingQi" name="xingQi">
					<c:if test="${txingQi<=1}"><option value="1">一</option></c:if>
					<c:if test="${txingQi<=2}"><option value="2">二</option></c:if>
					<c:if test="${txingQi<=3}"><option value="3">三</option></c:if>
					<c:if test="${txingQi<=4}"><option value="4">四</option></c:if>
					<c:if test="${txingQi<=5}"><option value="5">五</option></c:if>
					<c:if test="${txingQi<=6}"><option value="6">六</option></c:if>
					<c:if test="${txingQi<=7}"><option value="7">日</option></c:if>
				</select>
			</div>
			<div class="form-group col-sm-3">
				<label >节次</label>
				<div class="form-row">
					<select class="form-control col-5" id="sJieCi" name="sJieCi">
						<option value="1" selected="selected">1</option>
						<option value="2">2</option>
						<option value="3">3</option>
						<option value="4">4</option>
						<option value="5">5</option>
						<option value="6">6</option>
						<option value="7">7</option>
						<option value="8">8</option>
						<option value="9">9</option>
						<option value="10">10</option>
						<option value="11">11</option>
						<option value="12">12</option>
					</select>
					到
					<select class="form-control col-5" id="eJieCi" name="eJieCi">
						<option value="1" selected="selected">1</option>
						<option value="2">2</option>
						<option value="3">3</option>
						<option value="4">4</option>
						<option value="5">5</option>
						<option value="6">6</option>
						<option value="7">7</option>
						<option value="8">8</option>
						<option value="9">9</option>
						<option value="10">10</option>
						<option value="11">11</option>
						<option value="12">12</option>
					</select>
				</div>
			</div>
        	<button class="btn btn-primary btn-lg btn-block col-sm-1" type="button" disabled="disabled" id="query" onclick="queryRooms()">查询</button>
		</div>
	</form>
	<hr class="mb-4">
	<script type="text/javascript">
		$("#XiaoQu").change(function(){
			var opt=$("#XiaoQu").val();
			$("#JiaoXueQu").load("../normalUser/selectOption?select=XiaoQu&xiaoQu="+opt);
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
			$("#JiaoXueLou").load("../normalUser/selectOption?select=JiaoXueQu&xiaoQu="+xiaoQu
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
			$("#type").load("../normalUser/selectOption?select=JiaoXueLou&xiaoQu="+xiaoQu
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
			$("#floor").load("../normalUser/selectOption?select=type&xiaoQu="+xiaoQu
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
			$("#roomID").load("../normalUser/selectOption?select=floor&xiaoQu="+xiaoQu
					+"&jiaoXueQu="+jiaoXueQu
					+"&jiaoXueLou="+jiaoXueLou
					+"&type="+type
					+"&floor="+floor);
			$('#roomID').attr("disabled",false);
		});
		$("#zhouCi").change(function(){
			var zhouCi=$("#zhouCi").val();
			var xingQi=$("#xingQi").val();
			if(zhouCi=='${zhouCi}'){
				document.getElementById("xingQi").innerHTML="<c:if test='${txingQi<=1}'><option value='1'>一</option></c:if> \
					<c:if test='${txingQi<=2}'><option value='2'>二</option></c:if> \
					<c:if test='${txingQi<=3}'><option value='3'>三</option></c:if> \
					<c:if test='${txingQi<=4}'><option value='4'>四</option></c:if> \
					<c:if test='${txingQi<=5}'><option value='5'>五</option></c:if> \
					<c:if test='${txingQi<=6}'><option value='6'>六</option></c:if> \
					<c:if test='${txingQi<=7}'><option value='7'>日</option></c:if>";
				if($("#xingQi").val()<xingQi){	// 如果选项存在，保持原选中的值不变
					$("#xingQi").val(xingQi);
				}
			}else{
				document.getElementById("xingQi").innerHTML="<option value='1'>一</option> \
					<option value='2'>二</option> \
					<option value='3'>三</option> \
					<option value='4'>四</option> \
					<option value='5'>五</option> \
					<option value='6'>六</option> \
					<option value='7'>日</option>";
				$("#xingQi").val(xingQi);
			}
		});
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
		
		function queryRooms(){	//查询满足条件的教室
			var form=$('form').serializeArray();
			$.ajax({
				type: "post",//方法类型
				url: "../normalUser/queryRooms" ,
				dataType:"text",
				async:true,
				data: form,
				success: function (data) {
					if (data=="no") {
						alert("登录，请正确填写信息");
					 }else{
						//window.location.href="../userController/toIndex";
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