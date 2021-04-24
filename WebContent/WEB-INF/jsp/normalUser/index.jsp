<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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
                    <span>借用记录</span></a>
            </li>
            <li class="nav-item" id="nav-item2">
                <a class="nav-link" href="#">
                    <i class="fas fa-fw fa-table"></i>
                    <span>申请教室</span></a>
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

                    <!-- Sidebar Toggle (Topbar) -->
                    <button id="sidebarToggleTop" class="btn btn-link d-md-none rounded-circle mr-3">
                        <i class="fa fa-bars"></i>
                    </button>

                    <!-- Topbar Search -->
                    <form
                        class="d-none d-sm-inline-block form-inline mr-auto ml-md-3 my-2 my-md-0 mw-100 navbar-search">
                        <div class="input-group">
                            <input type="text" class="form-control bg-light border-0 small" placeholder="搜索..."
                                aria-label="Search" aria-describedby="basic-addon2">
                            <div class="input-group-append">
                                <button class="btn btn-primary" type="button">
                                    <i class="fas fa-search fa-sm"></i>
                                </button>
                            </div>
                        </div>
                    </form>

                    <!-- Topbar Navbar -->
                    <ul class="navbar-nav ml-auto">

                        <!-- Nav Item - Search Dropdown (Visible Only XS) -->
                        <li class="nav-item dropdown no-arrow d-sm-none">
                            <a class="nav-link dropdown-toggle" href="#" id="searchDropdown" role="button"
                                data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                                <i class="fas fa-search fa-fw"></i>
                            </a>
                            <!-- Dropdown - Messages -->
                            <div class="dropdown-menu dropdown-menu-right p-3 shadow animated--grow-in"
                                aria-labelledby="searchDropdown">
                                <form class="form-inline mr-auto w-100 navbar-search">
                                    <div class="input-group">
                                        <input type="text" class="form-control bg-light border-0 small"
                                            placeholder="Search for..." aria-label="Search"
                                            aria-describedby="basic-addon2">
                                        <div class="input-group-append">
                                            <button class="btn btn-primary" type="button">
                                                <i class="fas fa-search fa-sm"></i>
                                            </button>
                                        </div>
                                    </div>
                                </form>
                            </div>
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
    
	<script type="text/javascript">
		// 左侧菜单栏点击变色效果，同时加载页面
		$(function(){
			$("#nav-item1").click(function() {
				$("li").removeClass('active');  // 删除其他元素的样式
				$(this).addClass('active');	// 添加当前元素的样式
				$( "#page-content" ).load( "../normalUser/myApplications" );
				//turnPage("../normalUser/myApplications");
			});
			$("#nav-item2").click(function() {
				$("li").removeClass('active');  // 删除其他元素的样式
				$(this).addClass('active');	// 添加当前元素的样式
				//turnPage("../normalUser/apply");
				$( "#page-content" ).load( "../normalUser/apply" );
			});
		});

		$(document).ready(function() {
			$( "#page-content" ).load( "../normalUser/myApplications" );
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
		function updateMyPassword(){	// 更新个人信息
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
	</script>
</body>
</html>