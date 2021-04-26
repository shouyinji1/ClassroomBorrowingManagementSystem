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
													<tr><td rowspan="2" width="15%" data-trigger="hover" data-html="true" data-toggle="popover" title="用户信息" 
																data-content="用户编号：${application.userID}</br>
																电话号码：${application.user.phone}</br>邮箱：${application.user.email}</br>
																部门：${application.user.department}">
															${application.user.name}</td>
														<td>${application.feedback}</td>
														<c:if test="${application.readFeedback==false}">
															<td rowspan="2" width="10%" id="readFeedback-${application.id}">
																<button class="btn btn-primary" type="button" onclick="updateReadFeedback(${application.id})">已读</button>
															</td>
														</c:if>
													</tr>
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
								<h6 class="m-0 font-weight-bold text-primary">教室使用统计</h6>
							</div>
							<div id="collapseFour" class="collapse show" aria-labelledby="headingFour" data-parent="#accordionFour">
								<div class="card-body">
									教室节次占用频度：
									<div class="chart-area">
										<div class="chartjs-size-monitor">
											<div class="chartjs-size-monitor-expand">
												<div class=""></div>
											</div>
											<div class="chartjs-size-monitor-shrink">
												<div class=""></div>
											</div>
										</div>
                                        <canvas id="relativeFrequency" style="display: block; width: 617px; height: 320px;" width="617" height="320" class="chartjs-render-monitor"></canvas>
                                    </div></br>
                                    教室使用频度：
									<div class="chart-area">
										<div class="chartjs-size-monitor">
											<div class="chartjs-size-monitor-expand">
												<div class=""></div>
											</div>
											<div class="chartjs-size-monitor-shrink">
												<div class=""></div>
											</div>
										</div>
                                        <canvas id="frequency" style="display: block; width: 617px; height: 320px;" width="617" height="320" class="chartjs-render-monitor"></canvas>
                                    </div>
								</div>
							</div>
						</div>
					</div>
				</div>
				<div class="modal-footer">
					<button type="button" class="btn btn-secondary" data-dismiss="modal">关闭</button>
					<c:choose>
						<c:when test="${room.available==true}">
							<button type="button" class="btn btn-primary" onclick="updateRoomAvailable('${room.id}',false)">停用</button>
						</c:when>
						<c:otherwise>
							<button type="button" class="btn btn-primary" onclick="updateRoomAvailable('${room.id}',true)">启用</button>
						</c:otherwise>
					</c:choose>
				</div>
			</div>
		</div>
	</div>

    <script type="text/javascript">
    	// 更新新反馈计数徽标，新反馈数=原新反馈数-subcount
    	function updateNewFeedbackCounter(subcount){
    		var counter=document.getElementById('feedback-badge-counter').innerHTML;
    		counter=counter-subcount;
			if(counter>0){
				document.getElementById('feedback-badge-counter').innerHTML=counter;
			}else{
				document.getElementById('feedback-badge-counter').remove();
			}
    	}
    	
		// 统计图数字格式化
		function number_format(number, decimals, dec_point, thousands_sep) {
		  // *     example: number_format(1234.56, 2, ',', ' ');
		  // *     return: '1 234,56'
		  number = (number + '').replace(',', '').replace(' ', '');
		  var n = !isFinite(+number) ? 0 : +number,
			prec = !isFinite(+decimals) ? 0 : Math.abs(decimals),
			sep = (typeof thousands_sep === 'undefined') ? ',' : thousands_sep,
			dec = (typeof dec_point === 'undefined') ? '.' : dec_point,
			s = '',
			toFixedFix = function(n, prec) {
			  var k = Math.pow(10, prec);
			  return '' + Math.round(n * k) / k;
			};
		  // Fix for IE parseFloat(0.55).toFixed(0) = 0;
		  s = (prec ? toFixedFix(n, prec) : '' + Math.round(n)).split('.');
		  if (s[0].length > 3) {
			s[0] = s[0].replace(/\B(?=(?:\d{3})+(?!\d))/g, sep);
		  }
		  if ((s[1] || '').length < prec) {
			s[1] = s[1] || '';
			s[1] += new Array(prec - s[1].length + 1).join('0');
		  }
		  return s.join(dec);
		}
		// 生成统计图
		function frequency(weekSequence,frequency){
			var ctx = document.getElementById('frequency');
			var myLineChart = new Chart(ctx, {
			  type: 'line',
			  data: {
				labels: weekSequence,
				datasets: [{
				  label: "教室使用频度",
				  lineTension: 0.3,
				  backgroundColor: "rgba(78, 115, 223, 0.05)",
				  borderColor: "rgba(78, 115, 223, 1)",
				  pointRadius: 3,
				  pointBackgroundColor: "rgba(78, 115, 223, 1)",
				  pointBorderColor: "rgba(78, 115, 223, 1)",
				  pointHoverRadius: 3,
				  pointHoverBackgroundColor: "rgba(78, 115, 223, 1)",
				  pointHoverBorderColor: "rgba(78, 115, 223, 1)",
				  pointHitRadius: 10,
				  pointBorderWidth: 2,
				  //data: [0, 1, 0, 0,1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0],
				  data: frequency,
				}],
			  },
			  options: {
				maintainAspectRatio: false,
				layout: {
				  padding: {
					left: 10,
					right: 25,
					top: 25,
					bottom: 0
				  }
				},
				scales: {
				  xAxes: [{
					time: {
					  unit: 'date'
					},
					gridLines: {
					  display: false,
					  drawBorder: false
					},
					ticks: {
					  maxTicksLimit: 7
					}
				  }],
				  yAxes: [{
					ticks: {
					  maxTicksLimit: 5,
					  padding: 10,
					  precision: 0,	// 只显示整数
					},
					gridLines: {
					  color: "rgb(234, 236, 244)",
					  zeroLineColor: "rgb(234, 236, 244)",
					  drawBorder: false,
					  borderDash: [2],
					  zeroLineBorderDash: [2]
					}
				  }],
				},
				legend: {
				  display: false
				},
				tooltips: {
				  backgroundColor: "rgb(255,255,255)",
				  bodyFontColor: "#858796",
				  titleMarginBottom: 10,
				  titleFontColor: '#6e707e',
				  titleFontSize: 14,
				  borderColor: '#dddfeb',
				  borderWidth: 1,
				  xPadding: 15,
				  yPadding: 15,
				  displayColors: false,
				  intersect: false,
				  mode: 'index',
				  caretPadding: 10,
				  callbacks: {
					label: function(tooltipItem, chart) {
					  var datasetLabel = chart.datasets[tooltipItem.datasetIndex].label || '';
					  return datasetLabel + ': ' + number_format(tooltipItem.yLabel);
					}
				  }
				}
			  }
			});
		}
		function relativeFrequency(weekSequence,relativeFrequency){
			var ctx = document.getElementById('relativeFrequency');
			var myLineChart = new Chart(ctx, {
			  type: 'line',
			  data: {
				labels: weekSequence,
				datasets: [{
				  label: "教室节次使用频度",
				  lineTension: 0.3,
				  backgroundColor: "rgba(78, 115, 223, 0.05)",
				  borderColor: "rgba(78, 115, 223, 1)",
				  pointRadius: 3,
				  pointBackgroundColor: "rgba(78, 115, 223, 1)",
				  pointBorderColor: "rgba(78, 115, 223, 1)",
				  pointHoverRadius: 3,
				  pointHoverBackgroundColor: "rgba(78, 115, 223, 1)",
				  pointHoverBorderColor: "rgba(78, 115, 223, 1)",
				  pointHitRadius: 10,
				  pointBorderWidth: 2,
				  //data: [0, 1.1, 0, 0,1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0],
				  data: relativeFrequency,
				  //data: ["0.0","0.0","0.0","0.0","0.0","0.0","0.0","0.0","0.0","0.0","0.0","0.0","0.0","0.0","0.0","0.0","0.0","0.0","0.0","0.0"],
				}],
			  },
			  options: {
				maintainAspectRatio: false,
				layout: {
				  padding: {
					left: 10,
					right: 25,
					top: 25,
					bottom: 0
				  }
				},
				scales: {
				  xAxes: [{
					time: {
					  unit: 'date'
					},
					gridLines: {
					  display: false,
					  drawBorder: false
					},
					ticks: {
					  maxTicksLimit: 7
					}
				  }],
				  yAxes: [{
					ticks: {
					  maxTicksLimit: 5,
					  padding: 10,
					  precision: 0,	// 只显示整数
					},
					gridLines: {
					  color: "rgb(234, 236, 244)",
					  zeroLineColor: "rgb(234, 236, 244)",
					  drawBorder: false,
					  borderDash: [2],
					  zeroLineBorderDash: [2]
					}
				  }],
				},
				legend: {
				  display: false
				},
				tooltips: {
				  backgroundColor: "rgb(255,255,255)",
				  bodyFontColor: "#858796",
				  titleMarginBottom: 10,
				  titleFontColor: '#6e707e',
				  titleFontSize: 14,
				  borderColor: '#dddfeb',
				  borderWidth: 1,
				  xPadding: 15,
				  yPadding: 15,
				  displayColors: false,
				  intersect: false,
				  mode: 'index',
				  caretPadding: 10,
				  callbacks: {
					label: function(tooltipItem, chart) {
					  var datasetLabel = chart.datasets[tooltipItem.datasetIndex].label || '';
					  return datasetLabel + ': ' + number_format(tooltipItem.yLabel);
					}
				  }
				}
			  }
			});
		}
    
		$(document).ready(function() {
			// Call the dataTables jQuery plugin
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
			
			$.ajax({
				type: "get",//方法类型
				url: "../admin/getRoomStatistic",
				async:true,
				data: {'roomID':'${room.id}'},
				success: function (data) {
					frequency(data['weekSequence'],data['frequency']);
					relativeFrequency(data['weekSequence'],data['relativeFrequency']);
				},
				error : function() {
					//alert("异常请求！"+data.msg);
					alert("异常请求！");
				}
			});
		});
		
		// 激活popover插件
		$(function () { $("[data-toggle='popover']").popover(); });
		
		// 已读反馈
		function updateReadFeedback(id){
			$.ajax({
				type: "get",//方法类型
				url: "../admin/updateReadFeedback" ,
				async:true,
				data: {'id':id, 'readFeedback':true},
				success: function (data) {
					if (data=="1") {
						document.getElementById('readFeedback-'+id).remove();
						updateNewFeedbackCounter(1);
					}else{
						alert("出错");
					}
				},
				error : function() {
					//alert("异常请求！"+data.msg);
					alert("异常请求！");
				}
			});
		}
		
		function updateRoomAvailable(roomID,available){
			$.ajax({
				type: "get",//方法类型
				url: "../admin/updateRoomAvailable" ,
				async:true,
				data: {'id':roomID, 'available':available},
				success: function (data) {
					if (data=="1") {
						$('#room-Modal').modal('hide');
						if(available==true){
							document.getElementById('room-available').innerHTML='可申请';
						}else{
							document.getElementById('room-available').innerHTML='不可申请';
						}
					}else{
						alert("出错");
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