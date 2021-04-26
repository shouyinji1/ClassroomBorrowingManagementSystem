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
						<h4 class="small font-weight-bold">${a.RoomID}<span
								class="float-right">${a.countRoomID}次</span></h4>
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
						<h4 class="small font-weight-bold">${u.UserName}<span
								class="float-right">${u.countUserID}次</span></h4>
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
						<h4 class="small font-weight-bold">${f.RoomID}<span
								class="float-right">${f.countRoomID}次</span></h4>
						<div class="progress mb-4">
							<div class="progress-bar ${colorClass[status.index]}" role="progressbar" style="width: ${f.countRoomID/fs[0].countRoomID*100}%"
								aria-valuenow="${f.countRoomID/fs[0].countRoomID*100}" aria-valuemin="0" aria-valuemax="100"></div>
						</div>
					</c:forEach>
				</div>
			</div>
		</div>
	</div>
	<div class="row">
		<div class="col-sm-6">
		</div>
	</div>
</body>
</html>