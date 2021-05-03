<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <meta name="description" content="">
    <meta name="author" content="">

    <title>教室借用管理系统</title>

    <!-- Custom fonts for this template-->
    <link href="../vendor/fontawesome-free/css/all.min.css" rel="stylesheet" type="text/css">

    <!-- Custom styles for this template-->
    <link href="../css/sb-admin-2.min.css" rel="stylesheet">

    <!-- Custom styles for this page -->
    <link href="../vendor/datatables/dataTables.bootstrap4.min.css" rel="stylesheet">
    
    <!-- 日期选择器插件 -->
    <link href="../vendor/tempusdominus-bootstrap-4.css" rel="stylesheet">
</head>

<body id="page-top">

    <!-- Page Wrapper -->
    <div id="wrapper">

        <!-- Sidebar -->
        <ul class="navbar-nav bg-gradient-primary sidebar sidebar-dark accordion" id="accordionSidebar">

            <!-- Sidebar - Brand -->
            <a class="sidebar-brand d-flex align-items-center justify-content-center" href="toIndex">
                <div class="sidebar-brand-icon rotate-n-15">
                    <i class="fas fa-laugh-wink"></i>
                </div>
                <div class="sidebar-brand-text mx-3">欢迎${user.name}！</div>
            </a>

            <!-- Divider -->
            <hr class="sidebar-divider my-0">

            <!-- Nav Item - Dashboard -->
            <li class="nav-item active" id="nav-item1">
                <a class="nav-link" href="#">
                    <i class="fas fa-fw fa-tachometer-alt"></i>
                    <span>借用审批</span></a>
            </li>
            <li class="nav-item" id="nav-item2">
                <a class="nav-link" href="#">
                    <i class="fas fa-fw fa-clipboard-list"></i>
                    <span>历史审批</span></a>
            </li>
            <li class="nav-item" id="nav-item3">
                <a class="nav-link" href="#">
                    <i class="fas fa-fw fa-table"></i>
                    <span>教室维护</span></a>
            </li>
			<li class="nav-item" id="nav-item4">
                <a class="nav-link" href="#">
                    <i class="fas fa-fw fa-comments"></i>
                    <span>使用者反馈</span>
					<c:if test="${newFeedbackCounter>0}">
						<span class="badge badge-danger" id='feedback-badge-counter'>${newFeedbackCounter}</span>
					</c:if>
                </a>
            </li>
            <li class="nav-item" id="nav-item5">
                <a class="nav-link" href="#">
                    <i class="fas fa-fw fa-chart-area"></i>
                    <span>使用统计</span></a>
            </li>

            <!-- Divider -->
            <hr class="sidebar-divider d-none d-md-block">

            <!-- Sidebar Toggler (Sidebar) -->
            <div class="text-center d-none d-md-inline">
                <button class="rounded-circle border-0" id="sidebarToggle"></button>
            </div>

        </ul>
        <!-- End of Sidebar -->

        <!-- Content Wrapper -->
        <div id="content-wrapper" class="d-flex flex-column">

            <!-- Main Content -->
            <div id="content">

                <!-- Topbar -->
                <nav class="navbar navbar-expand navbar-light bg-white topbar mb-4 static-top shadow">

                    <!-- Sidebar Toggle (Topbar) 移动版视图侧边栏打开按钮 -->
                    <button id="sidebarToggleTop" class="btn btn-link d-md-none rounded-circle mr-3">
                        <i class="fa fa-bars"></i>
                    </button>

                    <!-- 学期信息展示 -->
                    <div
                        class="d-none d-sm-inline-block form-inline mr-auto ml-md-3 my-2 my-md-0 mw-100">
						${semester.sName} - 第${semester.zhouCiNow}周
                    </div>

                    <!-- Topbar Navbar -->
                    <ul class="navbar-nav ml-auto">
                        <!-- 学期设置 -->
                        <li class="nav-item dropdown no-arrow mx-1">
                            <a class="nav-link" role="button"
                                data-toggle="modal"  data-target="#semester-Modal">
                                <i class="fas fa-calendar"></i>
                            </a>
                        </li>

                        <div class="topbar-divider d-none d-sm-block"></div>

                        <!-- Nav Item - User Information -->
                        <li class="nav-item dropdown no-arrow">
                            <a class="nav-link dropdown-toggle" href="#" id="userDropdown" role="button"
                                data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                                <span class="mr-2 d-none d-lg-inline text-gray-600 small">${user.id}</span>
                                <img class="img-profile rounded-circle"
                                    src="../img/undraw_profile.svg">
                            </a>
                            <!-- Dropdown - User Information -->
                            <div class="dropdown-menu dropdown-menu-right shadow animated--grow-in"
                                aria-labelledby="userDropdown">
                                <a class="dropdown-item" href="#" data-toggle="modal" data-target="#myInfo-Modal">
                                    <i class="fas fa-user fa-sm fa-fw mr-2 text-gray-400"></i>
                                    关于我
                                </a>
								<a class="dropdown-item" href="#" data-toggle="modal" data-target="#myPassword-Modal">
									<i class="fas fa-cogs fa-sm fa-fw mr-2 text-gray-400"></i>
									修改密码
								</a>
                                <div class="dropdown-divider"></div>
                                <a class="dropdown-item" onclick="window.location.href='logout'">
                                    <i class="fas fa-sign-out-alt fa-sm fa-fw mr-2 text-gray-400"></i>
                                    退出登录
                                </a>
                            </div>
                        </li>

                    </ul>

                </nav>
                <!-- End of Topbar -->

                <!-- Begin Page Content -->
                <div class="container-fluid" id="page-content"></div>
                <!-- /.container-fluid -->

            </div>
            <!-- End of Main Content -->

            <!-- Footer -->
            <footer class="sticky-footer bg-white">
                <div class="container my-auto">
                    <div class="copyright text-center my-auto">
                        <span>淮阴工学院</span>
                    </div>
                </div>
            </footer>
            <!-- End of Footer -->
        </div>
        <!-- End of Content Wrapper -->

    </div>
    <!-- End of Page Wrapper -->

    <!-- Scroll to Top Button-->
    <a class="scroll-to-top rounded" href="#page-top">
        <i class="fas fa-angle-up"></i>
    </a>

	<!-- 个人信息设置模态框 -->
    <div class="modal fade" id="myInfo-Modal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel"
        aria-hidden="true">
        <div class="modal-dialog" role="document">
            <div class="modal-content">
                <div class="modal-header">
                    <h5 class="modal-title" id="exampleModalLabel">个人信息</h5>
                    <button class="close" type="button" data-dismiss="modal" aria-label="Close">
                        <span aria-hidden="true">×</span>
                    </button>
                </div>
                <div class="modal-body"><form id="myInfo">
					<div class="row">
						<div class="col-sm-4 mb-3">
							<label>ID</label>
							<input type="text" class="form-control" name="id" value="${user.id}" readonly>
						</div>
						<div class="col-sm-4 mb-3">
							<label>姓名</label>
							<input type="text" class="form-control" value="${user.name}" readonly>
						</div>
						<div class="col-sm-4 mb-3">
							<label>部门</label>
							<input type="text" class="form-control" value="${user.department}" readonly>
						</div>
					</div>
					<div class="row">
						<div class="col-sm-6 mb-3">
							<label>电话</label>
							<input type="tel" class="form-control" name="phone" value="${user.phone}">
						</div>
						<div class="col-sm-6 mb-3">
							<label>邮箱</label>
							<input type="email" class="form-control" name="email" value="${user.email}">
						</div>
					</div>
                </form></div>
                <div class="modal-footer">
                    <button class="btn btn-secondary" type="button" data-dismiss="modal">关闭</button>
                    <button class="btn btn-primary" onclick="updateMyInfo()" id="updateMyInfo-button">更改</button>
                </div>
            </div>
        </div>
    </div>

	<!-- 修改个人密码模块框 -->
    <div class="modal fade" id="myPassword-Modal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel"
        aria-hidden="true">
        <div class="modal-dialog" role="document">
            <div class="modal-content">
                <div class="modal-header">
                    <h5 class="modal-title" id="exampleModalLabel">修改密码</h5>
                    <button class="close" type="button" data-dismiss="modal" aria-label="Close">
                        <span aria-hidden="true">×</span>
                    </button>
                </div>
                <div class="modal-body"><form id="myPassword">
					<div class="form-group row">
						<label class="col-sm-3 col-form-label">原密码</label>
						<div class="col-sm-6">
							<input type="password" class="form-control" id="oldPassword" name="password">
						</div>
					</div>
					<div class="form-group row">
						<label class="col-sm-3 col-form-label">新密码</label>
						<div class="col-sm-6">
							<input type="password" class="form-control" id="newPassword" name="newPassword" onkeyup="newPasswordOnKeyup()">
						</div>
					</div>
					<div class="form-group row">
						<label class="col-sm-3 col-form-label">重复新密码</label>
						<div class="col-sm-6" id='input-renewPassword'>
							<input type="password" class="form-control" onkeyup="newPasswordOnKeyup()" id="renewPassword">
							<div class="invalid-feedback" id="renewPassword-invalid-feedback" hidden="hidden">确认密码不一致或未确认密码</div>
						</div>
					</div>
                </form></div>
                <div class="modal-footer">
                    <button class="btn btn-secondary" type="button" data-dismiss="modal">关闭</button>
                    <button class="btn btn-primary" onclick="updateMyPassword()" id="updateMyPassword-button">更改</button>
                </div>
            </div>
        </div>
    </div>

	<!-- 学期信息设置模态框 -->
	<div class="modal fade" id="semester-Modal" tabindex="-1" role="dialog" data-backdrop="static">
		<div class="modal-dialog" role="document">
			<div class="modal-content">
				<div class="modal-header">
					<h5 class="modal-title">学期信息设置</h5>
					<c:if test="${!empty semester.sDate}">
						<button type="button" class="close" data-dismiss="modal" aria-label="Close">
							<span aria-hidden="true">&times;</span>
						</button>
					</c:if>
				</div>
				<div class="modal-body">
					<form id="semester-form">
						<div class="form-group row">
							<label class="col-sm-4 col-form-label">学期名称：</label>
							<div class="col-sm">
								<input type="text" class="form-control" name="sName" value="${semester.sName}">
							</div>
						</div>
						<div class="form-group row">
							<label class="col-sm-4 col-form-label">起始日期(周一)：</label>
							<div class="col-sm">
								<div class="input-group date" id="datetimepicker2" data-target-input="nearest">
									<input type="text" name="sDate" value="<fmt:formatDate value='${semester.sDate}' pattern='yyyy-MM-dd' />" class="form-control datetimepicker-input" data-target="#datetimepicker2"/>
									<div class="input-group-append" data-target="#datetimepicker2" data-toggle="datetimepicker">
										<div class="input-group-text"><i class="fa fa-calendar"></i></div>
									</div>
								</div>
							</div>
						</div>
						<div class="form-group row">
							<label class="col-sm-4 col-form-label">学期总周数：</label>
							<div class="col-sm">
								<input type="text" class="form-control" name="tWeeks" value="${semester.tWeeks}" oninput="value=value.replace(/[^\d]/g,'')">
							</div>
						</div>
					</form>
				</div>
				<div class="modal-footer">
					<c:if test="${!empty semester.sDate}">
						<button type="button" class="btn btn-secondary" data-dismiss="modal">关闭</button>
					</c:if>
					<button type="button" class="btn btn-primary" onclick="updateSemester()">更新</button>
				</div>
			</div>
		</div>
	</div>

    <!-- Bootstrap core JavaScript-->
    <script src="../vendor/jquery/jquery.min.js"></script>
    <script src="../vendor/bootstrap/js/bootstrap.bundle.min.js"></script>

    <!-- Core plugin JavaScript-->
    <script src="../vendor/jquery-easing/jquery.easing.min.js"></script>

    <!-- Custom scripts for all pages-->
    <script src="../js/sb-admin-2.min.js"></script>

    <!-- Page level plugins -->
    <script src="../vendor/datatables/jquery.dataTables.min.js"></script>
    <script src="../vendor/datatables/dataTables.bootstrap4.min.js"></script>

	<!-- Chart.js插件 -->
	<script src="../vendor/chart.js/Chart.min.js"></script>

	<!-- 日期选择器插件 -->
	<script src="../vendor/moment/moment.min.js"></script>
	<script src="../vendor/moment/moment-with-locales.min.js"></script>
	<script src="../vendor/tempusdominus-bootstrap-4.js"></script>

	<script type="text/javascript">
		// 日历选择器配置
		$(function () {
			$('#datetimepicker2').datetimepicker({
				locale: 'zh-cn',
				format: 'L',
				//defaultDate: '2021-03-01',
				format: 'YYYY-MM-DD'
			});
		});

		// 左侧菜单栏点击变色效果，同时加载页面
		$(function(){
			$("#nav-item1").click(function() {
				$("li").removeClass('active');  // 删除其他元素的样式
				$(this).addClass('active');	// 添加当前元素的样式
				$( "#page-content" ).load( "../admin/applications" );
			});
			$("#nav-item2").click(function() {
				$("li").removeClass('active');  // 删除其他元素的样式
				$(this).addClass('active');	// 添加当前元素的样式
				$( "#page-content" ).load( "../admin/historicalApplications" );
			});
			$("#nav-item3").click(function() {
				$("li").removeClass('active');  // 删除其他元素的样式
				$(this).addClass('active');	// 添加当前元素的样式
				$( "#page-content" ).load( "../admin/roomManagement" );
			});			
			$("#nav-item4").click(function() {
				$("li").removeClass('active');  // 删除其他元素的样式
				$(this).addClass('active');	// 添加当前元素的样式
				$( "#page-content" ).load( "../admin/feedbackBrowsing" );
			});			
			$("#nav-item5").click(function() {
				$("li").removeClass('active');  // 删除其他元素的样式
				$(this).addClass('active');	// 添加当前元素的样式
				$( "#page-content" ).load( "../admin/statistic" );
			});
		});

		$(document).ready(function() {
			$( "#page-content" ).load( "../admin/applications" );
			
			if(${mustSetSDate}==true){
				$('#semester-Modal').modal('show');
				
			}
		});
		
		// 控制密码确认提示
		function newPasswordOnKeyup(){
			var newPassword=$('#newPassword').val();
			var renewPassword=$('#renewPassword').val();
			if(newPassword==''){
				$('#renewPassword').removeClass('is-invalid');
				$('#renewPassword-invalid-feedback').attr('hidden',true);
				$('#updateMyPassword-button').attr('disabled',true);
			}else{
				$('#renewPassword').addClass('is-invalid');
				if(newPassword==renewPassword){
					$('#input-renewPassword').addClass('was-validated');
					$('#renewPassword-invalid-feedback').attr('hidden',true);
					$('#updateMyPassword-button').attr('disabled',false);
				}else{
					$('#input-renewPassword').removeClass('was-validated');
					$('#renewPassword-invalid-feedback').attr('hidden',false);
					$('#updateMyPassword-button').attr('disabled',true);
				}
			}
		}

		// 在模态窗口关闭后重置表单
		$('.modal').on('hidden.bs.modal', function(){
			$(this).find('form')[0].reset();
			$('#input-renewPassword').removeClass('was-validated');
			$('#renewPassword').removeClass('is-invalid');
		});

		function updateMyInfo(){	// 更新个人信息
			var form=$('#myInfo').serializeArray();
			$.ajax({
				type: "post",//方法类型
				url: "updateUserInfo" ,
				dataType:"text",
				async:true,
				data: form,
				success: function (data) {
					if(data=='0'){
						alert("更新异常");
					}else if(data=='1'){
						//$('#myInfo').modal('hide');
						location.reload();
					}
				},
				error : function() {
					//alert("异常请求！"+data.msg);
					alert("异常请求！");
				}
			});
		}
		function updateMyPassword(){	// 更新个人密码
			var form=$('#myPassword').serializeArray();
			$.ajax({
				type: "post",//方法类型
				url: "updatePassword" ,
				dataType:"text",
				async:true,
				data: form,
				success: function (data) {
					if(data=='0'){
						alert("原密码不匹配");
					}else if(data=='1'){
						$('#myPassword-Modal').modal('hide');
						//location.reload();
					}
				},
				error : function() {
					//alert("异常请求！"+data.msg);
					alert("异常请求！");
				}
			});
		}
		
		// 更新学期信息
		function updateSemester(){	// 更新个人密码
			var form=$('#semester-form').serializeArray();
			$.ajax({
				type: "post",//方法类型
				url: "../admin/updateSemester" ,
				async:true,
				data: form,
				success: function (data) {
					if(data=='1'){
						location.reload();
					}else if(data=="-1"){
						alert("起始日期必须选择星期一");
					}else{
						alert("更新异常");
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