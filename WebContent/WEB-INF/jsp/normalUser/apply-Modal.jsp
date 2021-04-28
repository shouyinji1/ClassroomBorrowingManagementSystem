<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
	<style type="text/css">
		.tableTd1{}
		.tableTd2{border:2px solid #4D586; background-color:#FEFEDE}
	</style>
</head>
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
							<input type="text" class="form-control" id="application-xingQi" name="xingQi" value="${application.xingQi}" hidden="hidden" readonly>
							<input type="text" class="form-control" id="application-formatXingQi" value="${application.formatXingQi}" readonly>
						</div>
						<div class="col-sm-3 mb-3">
							<label>开始节次</label>
							<input type="text" class="form-control" id="application-sJieCi" name="sJieCi" value="${application.sJieCi}" readonly>
						</div>
						<div class="col-sm-3 mb-3">
							<label>结束节次</label>
							<input type="text" class="form-control" id="application-eJieCi" name="eJieCi" value="${application.eJieCi}" readonly>
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
							<h6 class="m-0 font-weight-bold text-primary">查看选择使用时间</h6>
						</div>
						<div id="collapseOne" class="collapse show" aria-labelledby="headingOne" data-parent="#accordionOne">
							<div class="card-body">
								<div class="table-responsive">
									<table class="table table-bordered" id="week-arrange-table">
										<thead><tr><td>节次\星期</td><td>一</td><td>二</td><td>三</td><td>四</td><td>五</td><td>六</td><td>日</td></tr></thead>
										<tbody id="week-arrange-table-body">
											<tr>
												<td class="jieCi">1</td>
												<td bgcolor="${arrange[1][1][0]}" id="arrange-1-1">${arrange[1][1][1]}</td>
												<td bgcolor="${arrange[2][1][0]}" id="arrange-2-1">${arrange[2][1][1]}</td>
												<td bgcolor="${arrange[3][1][0]}" id="arrange-3-1">${arrange[3][1][1]}</td>
												<td bgcolor="${arrange[4][1][0]}" id="arrange-4-1">${arrange[4][1][1]}</td>
												<td bgcolor="${arrange[5][1][0]}" id="arrange-5-1">${arrange[5][1][1]}</td>
												<td bgcolor="${arrange[6][1][0]}" id="arrange-6-1">${arrange[6][1][1]}</td>
												<td bgcolor="${arrange[7][1][0]}" id="arrange-7-1">${arrange[7][1][1]}</td>
											</tr>
											<tr>
												<td class="jieCi">2</td>
												<td bgcolor="${arrange[1][2][0]}" id="arrange-1-2">${arrange[1][2][1]}</td>
												<td bgcolor="${arrange[2][2][0]}" id="arrange-2-2">${arrange[2][2][1]}</td>
												<td bgcolor="${arrange[3][2][0]}" id="arrange-3-2">${arrange[3][2][1]}</td>
												<td bgcolor="${arrange[4][2][0]}" id="arrange-4-2">${arrange[4][2][1]}</td>
												<td bgcolor="${arrange[5][2][0]}" id="arrange-5-2">${arrange[5][2][1]}</td>
												<td bgcolor="${arrange[6][2][0]}" id="arrange-6-2">${arrange[6][2][1]}</td>
												<td bgcolor="${arrange[7][2][0]}" id="arrange-7-2">${arrange[7][2][1]}</td>
											</tr>
											<tr>
												<td class="jieCi">3</td>
												<td bgcolor="${arrange[1][3][0]}" id="arrange-1-3">${arrange[1][3][1]}</td>
												<td bgcolor="${arrange[2][3][0]}" id="arrange-2-3">${arrange[2][3][1]}</td>
												<td bgcolor="${arrange[3][3][0]}" id="arrange-3-3">${arrange[3][3][1]}</td>
												<td bgcolor="${arrange[4][3][0]}" id="arrange-4-3">${arrange[4][3][1]}</td>
												<td bgcolor="${arrange[5][3][0]}" id="arrange-5-3">${arrange[5][3][1]}</td>
												<td bgcolor="${arrange[6][3][0]}" id="arrange-6-3">${arrange[6][3][1]}</td>
												<td bgcolor="${arrange[7][3][0]}" id="arrange-7-3">${arrange[7][3][1]}</td>
											</tr>
											<tr>
												<td class="jieCi">4</td>
												<td bgcolor="${arrange[1][4][0]}" id="arrange-1-4">${arrange[1][4][1]}</td>
												<td bgcolor="${arrange[2][4][0]}" id="arrange-2-4">${arrange[2][4][1]}</td>
												<td bgcolor="${arrange[3][4][0]}" id="arrange-3-4">${arrange[3][4][1]}</td>
												<td bgcolor="${arrange[4][4][0]}" id="arrange-4-4">${arrange[4][4][1]}</td>
												<td bgcolor="${arrange[5][4][0]}" id="arrange-5-4">${arrange[5][4][1]}</td>
												<td bgcolor="${arrange[6][4][0]}" id="arrange-6-4">${arrange[6][4][1]}</td>
												<td bgcolor="${arrange[7][4][0]}" id="arrange-7-4">${arrange[7][4][1]}</td>
											</tr>
											<tr><td colspan="8" class="table-gap"></td></tr>
											<tr>
												<td class="jieCi">5</td>
												<td bgcolor="${arrange[1][5][0]}" id="arrange-1-5">${arrange[1][5][1]}</td>
												<td bgcolor="${arrange[2][5][0]}" id="arrange-2-5">${arrange[2][5][1]}</td>
												<td bgcolor="${arrange[3][5][0]}" id="arrange-3-5">${arrange[3][5][1]}</td>
												<td bgcolor="${arrange[4][5][0]}" id="arrange-4-5">${arrange[4][5][1]}</td>
												<td bgcolor="${arrange[5][5][0]}" id="arrange-5-5">${arrange[5][5][1]}</td>
												<td bgcolor="${arrange[6][5][0]}" id="arrange-6-5">${arrange[6][5][1]}</td>
												<td bgcolor="${arrange[7][5][0]}" id="arrange-7-5">${arrange[7][5][1]}</td>
											</tr>
											<tr>
												<td class="jieCi">6</td>
												<td bgcolor="${arrange[1][6][0]}" id="arrange-1-6">${arrange[1][6][1]}</td>
												<td bgcolor="${arrange[2][6][0]}" id="arrange-2-6">${arrange[2][6][1]}</td>
												<td bgcolor="${arrange[3][6][0]}" id="arrange-3-6">${arrange[3][6][1]}</td>
												<td bgcolor="${arrange[4][6][0]}" id="arrange-4-6">${arrange[4][6][1]}</td>
												<td bgcolor="${arrange[5][6][0]}" id="arrange-5-6">${arrange[5][6][1]}</td>
												<td bgcolor="${arrange[6][6][0]}" id="arrange-6-6">${arrange[6][6][1]}</td>
												<td bgcolor="${arrange[7][6][0]}" id="arrange-7-6">${arrange[7][6][1]}</td>
											</tr>
											<tr>
												<td class="jieCi">7</td>
												<td bgcolor="${arrange[1][7][0]}" id="arrange-1-7">${arrange[1][7][1]}</td>
												<td bgcolor="${arrange[2][7][0]}" id="arrange-2-7">${arrange[2][7][1]}</td>
												<td bgcolor="${arrange[3][7][0]}" id="arrange-3-7">${arrange[3][7][1]}</td>
												<td bgcolor="${arrange[4][7][0]}" id="arrange-4-7">${arrange[4][7][1]}</td>
												<td bgcolor="${arrange[5][7][0]}" id="arrange-5-7">${arrange[5][7][1]}</td>
												<td bgcolor="${arrange[6][7][0]}" id="arrange-6-7">${arrange[6][7][1]}</td>
												<td bgcolor="${arrange[7][7][0]}" id="arrange-7-7">${arrange[7][7][1]}</td>
											</tr>
											<tr>
												<td class="jieCi">8</td>
												<td bgcolor="${arrange[1][8][0]}" id="arrange-1-8">${arrange[1][8][1]}</td>
												<td bgcolor="${arrange[2][8][0]}" id="arrange-2-8">${arrange[2][8][1]}</td>
												<td bgcolor="${arrange[3][8][0]}" id="arrange-3-8">${arrange[3][8][1]}</td>
												<td bgcolor="${arrange[4][8][0]}" id="arrange-4-8">${arrange[4][8][1]}</td>
												<td bgcolor="${arrange[5][8][0]}" id="arrange-5-8">${arrange[5][8][1]}</td>
												<td bgcolor="${arrange[6][8][0]}" id="arrange-6-8">${arrange[6][8][1]}</td>
												<td bgcolor="${arrange[7][8][0]}" id="arrange-7-8">${arrange[7][8][1]}</td>
											</tr>
											<tr>
												<td class="jieCi">9</td>
												<td bgcolor="${arrange[1][9][0]}" id="arrange-1-9">${arrange[1][9][1]}</td>
												<td bgcolor="${arrange[2][9][0]}" id="arrange-2-9">${arrange[2][9][1]}</td>
												<td bgcolor="${arrange[3][9][0]}" id="arrange-3-9">${arrange[3][9][1]}</td>
												<td bgcolor="${arrange[4][9][0]}" id="arrange-4-9">${arrange[4][9][1]}</td>
												<td bgcolor="${arrange[5][9][0]}" id="arrange-5-9">${arrange[5][9][1]}</td>
												<td bgcolor="${arrange[6][9][0]}" id="arrange-6-9">${arrange[6][9][1]}</td>
												<td bgcolor="${arrange[7][9][0]}" id="arrange-7-9">${arrange[7][9][1]}</td>
											</tr>
											<tr><td colspan="8" class="table-gap"></td></tr>
											<tr>
												<td class="jieCi">10</td>
												<td bgcolor="${arrange[1][10][0]}" id="arrange-1-10">${arrange[1][10][1]}</td>
												<td bgcolor="${arrange[2][10][0]}" id="arrange-2-10">${arrange[2][10][1]}</td>
												<td bgcolor="${arrange[3][10][0]}" id="arrange-3-10">${arrange[3][10][1]}</td>
												<td bgcolor="${arrange[4][10][0]}" id="arrange-4-10">${arrange[4][10][1]}</td>
												<td bgcolor="${arrange[5][10][0]}" id="arrange-5-10">${arrange[5][10][1]}</td>
												<td bgcolor="${arrange[6][10][0]}" id="arrange-6-10">${arrange[6][10][1]}</td>
												<td bgcolor="${arrange[7][10][0]}" id="arrange-7-10">${arrange[7][10][1]}</td>
											</tr>
											<tr>
												<td class="jieCi">11</td>
												<td bgcolor="${arrange[1][11][0]}" id="arrange-1-11">${arrange[1][11][1]}</td>
												<td bgcolor="${arrange[2][11][0]}" id="arrange-2-11">${arrange[2][11][1]}</td>
												<td bgcolor="${arrange[3][11][0]}" id="arrange-3-11">${arrange[3][11][1]}</td>
												<td bgcolor="${arrange[4][11][0]}" id="arrange-4-11">${arrange[4][11][1]}</td>
												<td bgcolor="${arrange[5][11][0]}" id="arrange-5-11">${arrange[5][11][1]}</td>
												<td bgcolor="${arrange[6][11][0]}" id="arrange-6-11">${arrange[6][11][1]}</td>
												<td bgcolor="${arrange[7][11][0]}" id="arrange-7-11">${arrange[7][11][1]}</td>
											</tr>
											<tr>
												<td class="jieCi">12</td>
												<td bgcolor="${arrange[1][12][0]}" id="arrange-1-12">${arrange[1][12][1]}</td>
												<td bgcolor="${arrange[2][12][0]}" id="arrange-2-12">${arrange[2][12][1]}</td>
												<td bgcolor="${arrange[3][12][0]}" id="arrange-3-12">${arrange[3][12][1]}</td>
												<td bgcolor="${arrange[4][12][0]}" id="arrange-4-12">${arrange[4][12][1]}</td>
												<td bgcolor="${arrange[5][12][0]}" id="arrange-5-12">${arrange[5][12][1]}</td>
												<td bgcolor="${arrange[6][12][0]}" id="arrange-6-12">${arrange[6][12][1]}</td>
												<td bgcolor="${arrange[7][12][0]}" id="arrange-7-12">${arrange[7][12][1]}</td>
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
					<button type="button" class="btn btn-primary" id="submitApplication-button" onclick="submitApplication()">提交</button>
				</div>
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

		$(document).ready(function () {
			if($("#application-xingQi").val()<=0) $("#submitApplication-button").attr("disabled",true);
			if($("#application-sJieCi").val()<=0) $("#submitApplication-button").attr("disabled",true);
			if($("#application-eJieCi").val()<=0) $("#submitApplication-button").attr("disabled",true);
			
			var arrange1="",arrange2="";	// 选择区头尾控制变量
		    $("#week-arrange-table>tbody>tr>td").on("click", function () {
		    	var obj=this;
				var flag=false;	// 时间冲突或收缩标志
		    	if(obj.className !="jieCi" && obj.className !="table-gap"	// 非教室编排区
		    			&& $(obj).attr("bgcolor") !="red" && $(obj).attr("bgcolor") !="pink"	// 已被占用区
		    			&& $(obj).attr("bgcolor") !="#F0F0F0"){	// 过去、今天的时间不可选
		    		if(arrange1==""){	// 第一次点击
		    			arrange1=arrange2=obj.id;	// 初始化头尾变量
						$("#"+arrange1).addClass("tableTd2");//设定当前行为选中行
		    		}else if(arrange1[8]==obj.id[8]){	// 同列
						if(parseInt(arrange2.split("-")[2])<parseInt(obj.id.split("-")[2])){
							arrange2=obj.id;	// 向下扩展
						}else if(parseInt(arrange1.split("-")[2])>parseInt(obj.id.split("-")[2])){
							arrange1=obj.id;	// 向上扩展
						}else{	// 收缩
							flag=true;
						}
		    			// 检测冲突
		    			for(var i=parseInt(arrange1.split("-")[2]);i<=parseInt(arrange2.split("-")[2]);i++){
		    				var bgcolor=$("#arrange-"+arrange1[8]+"-"+i).attr("bgcolor");
		    				if(bgcolor=="red" || bgcolor=="pink"){
		    					flag=true;	// 冲突
		    					break;
		    				}
		    			}
		    			// 没冲突，则选中
		    			if(flag==false){
							for(var i=parseInt(arrange1.split("-")[2]);i<=parseInt(arrange2.split("-")[2]);i++){
								$("#arrange-"+arrange1[8]+"-"+i).addClass("tableTd2");
							}
		    			}
					}
					// 冲突、收缩、不同列的情况
					if(flag==true || arrange1[8] !=obj.id[8]){
		    			for(var i=1;i<=7;i++){
		    				for(var j=1;j<=12;j++){
								$("#arrange-"+i+"-"+j).removeClass("tableTd2");
		    				}
		    			}
						$("#"+obj.id).addClass("tableTd2");
		    			arrange1=arrange2=obj.id;
					}
					// 设置星期和开始、结束节次
					$("#application-xingQi").val(arrange1[8]);
					switch(arrange1[8]){
					case "1":$("#application-formatXingQi").val("一");break;
					case "2":$("#application-formatXingQi").val("二");break;
					case "3":$("#application-formatXingQi").val("三");break;
					case "4":$("#application-formatXingQi").val("四");break;
					case "5":$("#application-formatXingQi").val("五");break;
					case "6":$("#application-formatXingQi").val("六");break;
					case "7":$("#application-formatXingQi").val("日");break;
					}
					$("#application-sJieCi").val(arrange1.split("-")[2]);
					$("#application-eJieCi").val(arrange2.split("-")[2]);
					$("#submitApplication-button").attr("disabled",false);
		    	}
		    });
		});
	</script>
</body>
</html>