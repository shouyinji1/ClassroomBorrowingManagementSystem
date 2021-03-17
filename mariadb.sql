-- CREATE DATABASE
CREATE DATABASE IF NOT EXISTS ClassroomBorrowingManagementSystem;
USE ClassroomBorrowingManagementSystem;

-- CREATE USER
CREATE USER IF NOT EXISTS 'sa'@'localhost' IDENTIFIED BY '123456'
GRANT ALL ON `ClassroomBorrowingManagementSystem`.* TO 'sa'@'localhost';
FLUSH PRIVILEGES;

-- CREATE TABLE
CREATE TABLE IF NOT EXISTS Classroom(
	No VARCHAR(20) PRIMARY KEY COMMENT '教室ID',
	XiaoQu NVARCHAR(20) COMMENT '校区',
	JiaoXueQu NVARCHAR(20) COMMENT '教学区',
	JiaoXueLou NVARCHAR(20) NOT NULL COMMENT '教学楼',
	Capacity SMALLINT COMMENT '容量'
) CHARSET=utf8 COMMENT '教室信息表';