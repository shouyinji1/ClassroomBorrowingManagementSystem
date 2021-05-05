<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<body>
	<div class="row">
		<div class="col-sm-6">
			<!-- 教室借用量TOP5卡片 -->
			<div class="card shadow mb-4">
				<div class="card-header py-3">
					<h6 class="m-0 font-weight-bold text-primary">教室借用量TOP5</h6>
				</div>
				<div class="card-body">
					<c:forEach items="${as}" var="a" varStatus="status">
						<h4 class="small font-weight-bold">
							<span data-trigger="hover" data-html="true" data-toggle="popover" title="教室信息" 
								data-content="教室名称：${a.Name}</br>
									教室编号：${a.ID}</br>
									教室类型：${a.Type}</br>
									校区：${a.XiaoQu}</br>
									教学区：${a.JiaoXueQu}</br>
									教学楼：${a.JiaoXueLou}</br>
									楼层：${a.Floor}</br>
									容量：${a.Capacity}">${a.ID}</span>
							<span class="float-right">${a.countRoomID}次</span>
						</h4>
						<div class="progress mb-4">
							<div class="progress-bar ${colorClass[status.index]}" role="progressbar" style="width: ${a.countRoomID/as[0].countRoomID*100}%"
								aria-valuenow="${a.countRoomID/as[0].countRoomID*100}" aria-valuemin="0" aria-valuemax="100"></div>
						</div>
					</c:forEach>
				</div>
			</div>

			<!-- 用户借用次数TOP5卡片 -->
			<div class="card shadow mb-4">
				<div class="card-header py-3">
					<h6 class="m-0 font-weight-bold text-primary">用户借用次数TOP5</h6>
				</div>
				<div class="card-body">
					<c:forEach items="${us}" var="u" varStatus="status">
						<h4 class="small font-weight-bold">
							<span data-trigger="hover" data-html="true" data-toggle="popover" title="用户信息" 
								data-content="用户名：${u.Name}</br>
									用户编号：${u.ID}</br>
									部门：${u.Department}</br>
									电话：${u.Phone}</br>
									邮箱：${u.Email}</br>">${u.Name}</span>
							<span class="float-right">${u.countUserID}次</span>
						</h4>
						<div class="progress mb-4">
							<div class="progress-bar ${colorClass[status.index]}" role="progressbar" style="width: ${u.countUserID/us[0].countUserID*100}%"
								aria-valuenow="${u.countUserID/us[0].countUserID*100}" aria-valuemin="0" aria-valuemax="100"></div>
						</div>
					</c:forEach>
				</div>
			</div>
		</div>
		
		<div class="col-sm-6">
			<!-- 教室反馈量TOP5 -->
			<div class="card shadow mb-4">
				<div class="card-header py-3">
					<h6 class="m-0 font-weight-bold text-primary">教室反馈量TOP5</h6>
				</div>
				<div class="card-body">
					<c:forEach items="${fs}" var="f" varStatus="status">
						<h4 class="small font-weight-bold">
							<span data-trigger="hover" data-html="true" data-toggle="popover" title="教室信息" 
								data-content="教室名称：${f.Name}</br>
									教室编号：${f.ID}</br>
									教室类型：${f.Type}</br>
									校区：${f.XiaoQu}</br>
									教学区：${f.JiaoXueQu}</br>
									教学楼：${f.JiaoXueLou}</br>
									楼层：${f.Floor}</br>
									容量：${f.Capacity}">${f.ID}</span>
							<span class="float-right">${f.countRoomID}次</span>
						</h4>
						<div class="progress mb-4">
							<div class="progress-bar ${colorClass[status.index]}" role="progressbar" style="width: ${f.countRoomID/fs[0].countRoomID*100}%"
								aria-valuenow="${f.countRoomID/fs[0].countRoomID*100}" aria-valuemin="0" aria-valuemax="100"></div>
						</div>
					</c:forEach>
				</div>
			</div>
		</div>
	</div>
	<script type="text/javascript">
		// 激活popover插件
		$(function () { $("[data-toggle='popover']").popover(); });
	</script>
</body>
</html>