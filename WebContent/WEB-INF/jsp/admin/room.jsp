<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
</head>
<body>
	<div class="modal fade" id="room-Modal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
		<div class="modal-dialog modal-xl" role="document">
			<div class="modal-content">
				<div class="modal-header">
					<h4 class="modal-title" id="exampleModalLabel">教室状况</h4>
					<button type="button" class="close" data-dismiss="modal" aria-label="Close">
						<span aria-hidden="true">&times;</span>
					</button>
				</div>
				<div class="modal-body">
					<!-- 申请记录折叠卡片 -->
					<div class="accordion" id="accordionOne">
						<div class="card">
							<div class="card-header py-3" id="headingOne" onclick="$('#collapseOne').collapse('toggle');">
								<h6 class="m-0 font-weight-bold text-primary">教室待使用或正在使用的申请记录</h6>
							</div>
							<div id="collapseOne" class="collapse show" aria-labelledby="headingOne" data-parent="#accordionOne">
								<div class="card-body">
									<div class="table-responsive">
										<table class="table table-bordered table-hover" id="applications-dataTable" width="100%" cellspacing="0">
											<thead>
												<tr>
													<th>申请编号</th>
													<th>申请者</th>
													<th>申请使用周次</th>
													<th>申请使用星期</th>
													<th>开始节次</th>
													<th>结束节次</th>
												</tr>
											</thead>
											<tbody>
												<!-- 显示所有教室待使用或正在使用的申请 -->
												<c:forEach items="${applications}" var="application">
													<c:if test="${application.zhouCi>semester.zhouCiNow or (application.zhouCi==semester.zhouCiNow and application.xingQi>=semester.xingQiNow)}">
														<tr>
															<td>${application.id}</td>
															<td data-trigger="hover" data-html="true" data-toggle="popover" title="用户信息" 
																data-content="用户编号：${application.userID}</br>
																电话号码：${application.user.phone}</br>邮箱：${application.user.email}</br>
																部门：${application.user.department}">${application.user.name}</td>
															<td>${application.zhouCi}</td>
															<td>${application.xingQi}</td>
															<td>${application.sJieCi}</td>
															<td>${application.eJieCi}</td>
														</tr>
													</c:if>
												</c:forEach>
											</tbody>
										</table>
									</div>
								</div>
							</div>
						</div>
					</div>
					
					<!-- 使用者反馈折叠卡片 -->
					<div class="accordion" id="accordionTwo">
						<div class="card">
							<div class="card-header py-3" id="headingTwo" onclick="$('#collapseTwo').collapse('toggle');">
								<h6 class="m-0 font-weight-bold text-primary">使用者反馈</h6>
							</div>
							<div id="collapseTwo" class="collapse show" aria-labelledby="headingTwo" data-parent="#accordionTwo">
								<div class="card-body">
									<div class="table-responsive">
										<table class="table" width="100%" cellspacing="0">
											<!-- 显示所有教室待使用或正在使用的申请 -->
											<c:forEach items="${applications}" var="application">
												<c:if test="${!empty application.feedbackTime}">
													<tr><td rowspan="2" width="15%" id="feedback-${application.userID}-userID" onmouseover="popoverInfo('feedback','${application.userID}','${application.user.phone}','${application.user.email}','${application.user.department}')">${application.user.name}</td><td>${application.feedback}</td></tr>
													<tr><td><font size="2"><fmt:formatDate value="${application.feedbackTime}" pattern="yyyy-MM-dd HH:mm:ss" /></font></td></tr>
												</c:if>
											</c:forEach>
										</table>
									</div>
								</div>
							</div>
						</div>
					</div>
					
					<!-- 教室课程安排折叠卡片 -->
					<div class="accordion" id="accordionThree">
						<div class="card">
							<div class="card-header py-3" id="headingThree" onclick="$('#collapseThree').collapse('toggle');">
								<h6 class="m-0 font-weight-bold text-primary">教室课程安排</h6>
							</div>
							<div id="collapseThree" class="collapse show" aria-labelledby="headingThree" data-parent="#accordionThree">
								<div class="card-body">
									<div class="table-responsive">
										<table class="table table-bordered table-hover" id="roomSchedules-dataTable" width="100%" cellspacing="0">
											<thead>
												<tr>
													<th>使用者</th>
													<th>使用周次</th>
													<th>使用星期</th>
													<th>开始节次</th>
													<th>结束节次</th>
													<th>使用类型</th>
												</tr>
											</thead>
											<tbody>
												<!-- 显示所有教室待使用或正在使用的申请 -->
												<c:forEach items="${roomSchedules}" var="roomSchedule">
													<tr>
														<td data-trigger="hover" data-html="true" data-toggle="popover" title="用户信息" 
															data-content="用户编号：${roomSchedule.userID}</br>
															电话号码：${roomSchedule.user.phone}</br>邮箱：${roomSchedule.user.email}</br>
															部门：${roomSchedule.user.department}">${roomSchedule.user.name}</td>
														<td>${roomSchedule.zhouCi}</td>
														<td>${roomSchedule.xingQi}</td>
														<td>${roomSchedule.sJieCi}</td>
														<td>${roomSchedule.eJieCi}</td>
														<td>${roomSchedule.type}</td>
													</tr>
												</c:forEach>
											</tbody>
										</table>
									</div>
								</div>
							</div>
						</div>
					</div>
					
					<!-- 教室使用频度统计折叠卡片 -->
					<div class="accordion" id="accordionFour">
						<div class="card">
							<div class="card-header py-3" id="headingFour" onclick="$('#collapseFour').collapse('toggle');">
								<h6 class="m-0 font-weight-bold text-primary">教室使用频度</h6>
							</div>
							<div id="collapseFour" class="collapse show" aria-labelledby="headingFour" data-parent="#accordionFour">
								<div class="card-body">
								
								
<canvas id="myChart" width="400" height="400"></canvas>
<script>
var ctx = document.getElementById('myChart').getContext('2d');
var myChart = new Chart(ctx, {
    type: 'bar',
    data: {
        labels: ['Red', 'Blue', 'Yellow', 'Green', 'Purple', 'Orange'],
        datasets: [{
            label: '# of Votes',
            data: [12, 19, 3, 5, 2, 3],
            backgroundColor: [
                'rgba(255, 99, 132, 0.2)',
                'rgba(54, 162, 235, 0.2)',
                'rgba(255, 206, 86, 0.2)',
                'rgba(75, 192, 192, 0.2)',
                'rgba(153, 102, 255, 0.2)',
                'rgba(255, 159, 64, 0.2)'
            ],
            borderColor: [
                'rgba(255, 99, 132, 1)',
                'rgba(54, 162, 235, 1)',
                'rgba(255, 206, 86, 1)',
                'rgba(75, 192, 192, 1)',
                'rgba(153, 102, 255, 1)',
                'rgba(255, 159, 64, 1)'
            ],
            borderWidth: 1
        }]
    },
    options: {
        scales: {
            y: {
                beginAtZero: true
            }
        }
    }
});
</script>
								
									<div class="chart-area">
										<div class="chartjs-size-monitor">
											<div class="chartjs-size-monitor-expand">
												<div class=""></div>
											</div>
											<div class="chartjs-size-monitor-shrink">
												<div class=""></div>
											</div>
										</div>
                                        <canvas id="myAreaChart" style="display: block; width: 617px; height: 320px;" width="617" height="320" class="chartjs-render-monitor"></canvas>
                                    </div>
								</div>
							</div>
						</div>
					</div>
					<hr class="mb-4">
				</div>
				<div class="modal-footer">
					<button type="button" class="btn btn-secondary" data-dismiss="modal">关闭</button>
				</div>
			</div>
		</div>
	</div>
	
	<!-- Chart.js插件 -->
	<script src="../vendor/chart.js/Chart.min.js"></script>
	<script src="../js/demo/chart-area-demo.js"></script>

    <script type="text/javascript">
		// Call the dataTables jQuery plugin
		$(document).ready(function() {
			$('#applications-dataTable').DataTable( {
 			   	// 设置datatables插件的显示语言为中文
				language: {
					// https://github.com/DataTables/Plugins/tree/master/i18n/zh.json
					url: '../vendor/datatables/zh.json'
				},
				"order": [[ 0, "desc" ]]	// 设置默认根据第1列降序
			});
			$('#roomSchedules-dataTable').DataTable( {
 			   	// 设置datatables插件的显示语言为中文
				language: {
					// https://github.com/DataTables/Plugins/tree/master/i18n/zh.json
					url: '../vendor/datatables/zh.json'
				},
				"order": [[ 0, "desc" ]]	// 设置默认根据第1列降序
			});
		});
		
		// 激活popover插件
		$(function () { $("[data-toggle='popover']").popover(); });
	</script>
</body>
</html>