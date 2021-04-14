-- CREATE DATABASE
CREATE DATABASE IF NOT EXISTS ClassroomBorrowingManagementSystem;
USE ClassroomBorrowingManagementSystem;

-- CREATE USER
CREATE USER IF NOT EXISTS 'sa'@'localhost' IDENTIFIED BY '123456';
GRANT ALL ON `ClassroomBorrowingManagementSystem`.* TO 'sa'@'localhost';
FLUSH PRIVILEGES;

-- CREATE TABLE
CREATE TABLE IF NOT EXISTS Classroom(
	ID VARCHAR(20) PRIMARY KEY COMMENT '教室ID',
	Name VARCHAR(20) COMMENT '教室名称',
	Type VARCHAR(20) COMMENT '教室类型',
	XiaoQu NVARCHAR(20) COMMENT '校区',
	JiaoXueQu NVARCHAR(20) COMMENT '教学区',
	JiaoXueLou NVARCHAR(20) NOT NULL COMMENT '教学楼',
	Floor TINYINT NOT NULL COMMENT '楼层',
	Capacity SMALLINT UNSIGNED COMMENT '容量'
) CHARSET=utf8 COMMENT '教室信息表';
CREATE TABLE IF NOT EXISTS User(
	ID VARCHAR(20) PRIMARY KEY COMMENT '用户ID',
	Name NVARCHAR(20) COMMENT '用户名',
	Password VARCHAR(30) COMMENT '密码',
	Level CHAR(10) COMMENT '用户等级' CHECK(Level in ('NormalUser','Admin')),
	Phone CHAR(15) COMMENT '电话号码',
	Email CHAR(50) COMMENT '电子邮箱',
	Department NVARCHAR(30) COMMENT '部门'
) CHARSET=utf8 COMMENT '用户信息表';
CREATE TABLE IF NOT EXISTS Application(
	ID INT UNSIGNED AUTO_INCREMENT PRIMARY KEY COMMENT '教室申请表ID',
	UserID VARCHAR(20) NOT NULL COMMENT '申请者ID',
	RoomID VARCHAR(20) NOT NULL COMMENT '教室ID',
	SubmitTime TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '申请表提交时间',
	ZhouCi TINYINT NOT NULL COMMENT '周次',
	XingQi TINYINT NOT NULL COMMENT '星期',
	SJieCi TINYINT NOT NULL COMMENT '开始节次',
	EJieCi TINYINT NOT NULL COMMENT '结束节次',
	Type TEXT NOT NULL COMMENT '使用类型',
	Purpose TEXT NOT NULL COMMENT '用途',
	ReviewerID VARCHAR(20) COMMENT '审批人ID',
	ReviewTime DATETIME COMMENT '审批时间',
	Approval BOOLEAN COMMENT '审批意见',
	ReviewContent TEXT COMMENT '具体审批回复',
	FOREIGN KEY(UserID) REFERENCES User(ID) ON DELETE CASCADE,
	FOREIGN KEY(RoomID) REFERENCES Classroom(ID) ON DELETE CASCADE,
	FOREIGN KEY(ReviewerID) REFERENCES User(ID)
) CHARSET=utf8 COMMENT '教室申请记录表';
CREATE TABLE IF NOT EXISTS RoomStatus(
	ID INT AUTO_INCREMENT PRIMARY KEY COMMENT '教室状态ID',
	RoomID VARCHAR(20) NOT NULL COMMENT '教室ID',
	UserID VARCHAR(20) NOT NULL COMMENT '使用者ID',
	ZhouCi TINYINT NOT NULL COMMENT '周次',
	XingQi TINYINT NOT NULL COMMENT '星期',
	SJieCi TINYINT NOT NULL COMMENT '开始节次',
	EJieCi TINYINT NOT NULL COMMENT '结束节次',
	Type TEXT NOT NULL COMMENT '使用类型',
	Purpose TEXT COMMENT '用途',
	UNIQUE(RoomID, UserID, ZhouCi, XingQi, SJieCi, EJieCi),
	FOREIGN KEY(RoomID) REFERENCES Classroom(ID) ON DELETE CASCADE,
	FOREIGN KEY(UserID) REFERENCES User(ID) ON DELETE CASCADE
) CHARSET=utf8 COMMENT '教室课表';
CREATE TABLE IF NOT EXISTS Semester(
	ID TINYINT PRIMARY KEY AUTO_INCREMENT COMMENT '学期ID',
	SDate DATE COMMENT '起始日期(星期一)',
	TWeeks TINYINT UNSIGNED COMMENT '学期总周数'
) CHARSET=utf8 COMMENT '学期信息表';

-- INSERT
INSERT INTO Semester VALUES(1,'2021-03-01',20);
INSERT INTO User VALUES('A00001','dlsf','123456','Admin','12345678901','abc@abc.com','abc');
INSERT INTO User VALUES('A00002','蓝叠','123456','Admin','12345678911','abd@abc.com','计算机学院');
INSERT INTO User VALUES('U00001','klsd','654321','NormalUser','12345678900','aba@abc.com','abc');
INSERT INTO User VALUES('U00002','klsd','654321','NormalUser','12345678902','abc1@abc.com','马克思主义学院');
INSERT INTO User VALUES('U00003','张三','654321','NormalUser','12345678903','abc3@abc.com','计算机学院');
INSERT INTO User VALUES('U00004','李四','654321','NormalUser','12345678904','abc4@abc.com','应用技术学院');
INSERT INTO User VALUES('U00005','王二麻','654321','NormalUser','12345678904','abc4@abc.com','机械学院');
INSERT INTO Classroom VALUES('C00001','xxxxx','sdlfj','jwioe','计算机学院','ld',1,60);
INSERT INTO Classroom VALUES('1#201','sdf','普通教室','北京路校区','abc','1',2,100);
INSERT INTO Classroom VALUES('1#202','sdf','多媒体教室','北京路校区','abc','1',2,50);
INSERT INTO Classroom VALUES('1#203','sdf','计算机教室','北京路校区','abc','1',2,50);
INSERT INTO Classroom VALUES('2#101','sdf','会议室','北京路校区','abc','2',1,60);
INSERT INTO Classroom VALUES('11#101','sdf','多媒体教室','枚乘路校区','计算机学院','11',1,50);
INSERT INTO Classroom VALUES('11#102','sdf','计算机教室','枚乘路校区','计算机学院','11',1,50);
INSERT INTO Classroom VALUES('12#101','sdf','普通教室','枚乘路校区','计算机学院','12',1,100);
INSERT INTO Classroom VALUES('22#201','sdf','会议室','枚乘路校区','应用技术学院','22',2,60);
INSERT INTO Classroom VALUES('111#301','sdf','多媒体教室','萧湖校区','abc','111',3,50);
INSERT INTO Classroom VALUES('111#302','sdf','计算机教室','萧湖校区','abc','111',3,50);
INSERT INTO Classroom VALUES('123#301','sdf','普通教室','萧湖校区','abc','123',3,100);
INSERT INTO Classroom VALUES('222#301','sdf','会议室','萧湖校区','abc','222',3,60);
INSERT INTO Classroom VALUES('YFJ0101','sdf','阶梯教室','枚乘路校区','abc','逸夫楼',1,300);
INSERT INTO Classroom VALUES('YFJ0202','sdf','阶梯教室','北京路校区','abc','逸夫楼',2,300);
INSERT INTO Classroom VALUES('YFJ0303','sdf','阶梯教室','萧湖校区','abc','逸夫楼',3,300);
INSERT INTO Application(UserID,RoomID,ZhouCi,XingQi,SJieCi,EJieCi,Type,Purpose) VALUES('U00001','C00001',10,1,1,2,'教学活动','给学生上课');
INSERT INTO Application(UserID,RoomID,ZhouCi,XingQi,SJieCi,EJieCi,Type,Purpose) VALUES('U00001','C00001',10,1,5,7,'教学活动','给学生上课');
INSERT INTO Application(UserID,RoomID,ZhouCi,XingQi,SJieCi,EJieCi,Type,Purpose) VALUES('U00001','123#301',10,2,1,2,'文娱活动','班级活动庆祝会');
INSERT INTO Application(UserID,RoomID,ZhouCi,XingQi,SJieCi,EJieCi,Type,Purpose) VALUES('U00001','22#201',10,1,3,3,'会议','开班会');
INSERT INTO Application(UserID,RoomID,ZhouCi,XingQi,SJieCi,EJieCi,Type,Purpose,ReviewerID,ReviewTime,Approval,ReviewContent) VALUES('U00001','11#102',7,1,1,2,'教学活动','给学生上课','A00001',CURRENT_TIMESTAMP,1,'通过，可以');
INSERT INTO RoomStatus(RoomID,UserID,ZhouCi,XingQi,SJieCi,EJieCi,Type) VALUES('11#102','U00001',7,1,1,2,'教学活动');
INSERT INTO RoomStatus(RoomID,UserID,ZhouCi,XingQi,SJieCi,EJieCi,Type) VALUES('11#101','U00001',7,1,3,4,'课表课程');


DROP DATABASE ClassroomBorrowingManagementSystem;