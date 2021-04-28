package service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import dao.NormalUserDao;
import dao.UserDao;
import entity.Application;
import entity.Classroom;
import entity.RoomSchedule;
import entity.Semester;
import service.NormalUserService;

@Service("normalUserService")
public class NormalUserServiceImpl implements NormalUserService {
	@Autowired
	NormalUserDao normalUserDao;
	@Autowired
	UserDao userDao;

	@Override
	/** 查询某一用户的所有申请记录 */
	public List<Application> getApplicationsByUserId(String userID) {
		// TODO Auto-generated method stub
		List<Application> applications=normalUserDao.getApplicationsByUserId(userID);
		
		// 设置申请记录的状态
		Semester semester=userDao.getSemesters().get(0);
		for(Application application:applications) {
			application.setStatus(semester);
		}
		return applications;
	}
	
	@Override
	/** 查询指定申请记录的所有信息 */
	public Application getApplicationById(int id) {
		// TODO Auto-generated method stub
		Application application =normalUserDao.getApplicationById(id);
		// 设置申请记录的状态
		application.setStatus(userDao.getSemesters().get(0));
		return application;
	}

	@Override
	/** 更新申请信息
	 * @return 0:更新成功，1:与已有教室安排冲突，2:与已有申请记录冲突
	 *  */
	public int updateApplication(Application application) {
		// TODO Auto-generated method stub
		return normalUserDao.updateApplication(application);
	}

	@Override
	public int deleteApplicationById(int id) {
		// TODO Auto-generated method stub
		return normalUserDao.deleteApplicationById(id);
	}

	@Override
	public List<String> getAllXiaoQu() {
		// TODO Auto-generated method stub
		return normalUserDao.getAllXiaoQu();
	}

	@Override
	public List<String> getAllJiaoXueQuByXiaoQu(String xiaoQu) {
		// TODO Auto-generated method stub
		return normalUserDao.getAllJiaoXueQuByXiaoQu(xiaoQu);
	}

	@Override
	public List<String> getAllJiaoXueLouByXJ(String xiaoQu, String jiaoXueQu) {
		// TODO Auto-generated method stub
		return normalUserDao.getAllJiaoXueLouByXJ(xiaoQu, jiaoXueQu);
	}

	@Override
	public List<String> getAllTypeByXJJ(String xiaoQu, String jiaoXueQu, String jiaoXueLou) {
		// TODO Auto-generated method stub
		return normalUserDao.getAllTypeByXJJ(xiaoQu, jiaoXueQu, jiaoXueLou);
	}

	@Override
	public List<String> getAllFloorByXJJT(String xiaoQu, String jiaoXueQu,
			String jiaoXueLou,String type) {
		// TODO Auto-generated method stub
		return normalUserDao.getAllFloorByXJJT(xiaoQu, jiaoXueQu, jiaoXueLou, type);
	}

	@Override
	public List<String> getAllRoomIDByXJJTF(String xiaoQu, String jiaoXueQu, String jiaoXueLou,
			String type,String floor) {
		// TODO Auto-generated method stub
		return normalUserDao.getAllRoomIDByXJJTF(xiaoQu, jiaoXueQu, jiaoXueLou, type, floor);
	}

	/** 查询满足查询条件的教室,含星期，节次 */
	@Override
	public List<Classroom> getRoomsByApply(Application application) {
		// TODO Auto-generated method stub
		List<Classroom> rooms=normalUserDao.getRoomsByApply(application);
		String floor=application.getClassroom().getFloor();
		String roomID=application.getRoomID();
		String capacity=application.getClassroom().getCapacity();
		if(floor !=null && !floor.equals("")) {	// 筛选楼层
			floor=floor.trim();
			for(int i=rooms.size()-1;i>=0;i--) {
				if(!rooms.get(i).getFloor().equals(floor)) {
					rooms.remove(i);
				}
			}
		}
		if(roomID !=null && !roomID.equals("")) {	// 筛选教室
			roomID=roomID.trim();
			for(int i=rooms.size()-1;i>=0;i--) {
				if(!rooms.get(i).getId().trim().equals(roomID))
					rooms.remove(i);
			}
		}
		if(capacity!=null && !capacity.equals("")) {	// 筛选容量
			int cap=Integer.parseInt(capacity);
			for(int i=rooms.size()-1;i>=0;i--) {
				if(Integer.parseInt(rooms.get(i).getCapacity())<cap)
					rooms.remove(i);
			}
		}
		return rooms;
	}

	/** 查询符合条件的可用教室，不含节次 */
	public List<Classroom> getRoomsByApplyNoJieCi(Application application){
		List<Classroom> rooms=normalUserDao.getRoomsByApplyNoTime(application);
		Semester semester=userDao.getSemesters().get(0);
		int[][] arrange=new int[8][13];
		for(int j=rooms.size()-1;j>=0;j--) {
			boolean free=false;	// 教室是否空闲标志
			// 获取教室安排
			Application a=new Application();
			a.setRoomID(rooms.get(j).getId());
			a.setZhouCi(application.getZhouCi());
			List<Application> applications=normalUserDao.getApplicationsByRoomIDAndZhouCi(a);
			List<RoomSchedule> roomSchedules=normalUserDao.getRoomSchedulesByRoomIDAndZhouCi(a);
			
			// 模拟时间占用
			for(Application appl:applications) {
				appl.setStatus(semester);
				if(appl.getStatus()==1 || appl.getStatus()==2 || appl.getStatus()==3) {
					for(int i=appl.getsJieCi();i<=appl.geteJieCi();i++) {
						arrange[appl.getXingQi()][i]=1;	// 占用
					}
				}
			}
			for(RoomSchedule roomSchedule:roomSchedules) {
				for(int i=roomSchedule.getsJieCi();i<=roomSchedule.geteJieCi();i++) {
					arrange[roomSchedule.getXingQi()][i]=1;	// 占用
				}
			}

			// 统计空余教室
			int sXingQi=1;	// 起始星期
			if(application.getZhouCi()==semester.getZhouCiNow())
				sXingQi=semester.getXingQiNow()+1;
			freeArrange:
			if(application.getXingQi()<=0) {	// 前台没选星期
				for(int i=sXingQi;i<=7;i++) {
					if(application.getsJieCi()>0 && application.geteJieCi()>0) {	// 前台选了节次
						for(int k=application.getsJieCi();k<=application.geteJieCi();k++) {
							if(arrange[i][k]==0) {
								free=true;
								break freeArrange;
							}
						}
					}else {	// 前台没选节次
						for(int k=1;k<=12;k++) {
							if(arrange[i][k]==0) {
								free=true;
								break freeArrange;
							}
						}
					}
				}
			}else {	// 前台选了星期，没选节次
				for(int i=1;i<=12;i++) {
					if(arrange[application.getXingQi()][i]==0) {
						free=true;
						break;
					}
				}
			}
			if(free==false) {
				rooms.remove(j);
			}

			// arrange置零
			for(int i=1;i<=7;i++) {
				for(int k=1;k<=12;k++) {
					arrange[i][k]=0;
				}
			}
			System.out.println(application.getsJieCi());

		}
		return rooms;
	}
	
	@Override
	public Classroom getClassroomById(String id) {
		// TODO Auto-generated method stub
		return normalUserDao.getClassroomById(id);
	}

	@Override
	public int insertApplication(Application application) {
		// TODO Auto-generated method stub
		return normalUserDao.insertApplication(application);
	}

	@Override
	public int updateFeedback(Application application) {
		// TODO Auto-generated method stub
		return normalUserDao.updateFeedback(application);
	}

	@Override
	public List<Application> getFeedbacksByRoomID(String roomID) {
		// TODO Auto-generated method stub
		return normalUserDao.getFeedbacksByRoomID(roomID);
	}

	@Override
	public String[][][] getRoomArrangeByRoomIDAndZhouCi(Application application) {
		// TODO Auto-generated method stub
		List<Application> applications=normalUserDao.getApplicationsByRoomIDAndZhouCi(application);
		List<RoomSchedule> roomSchedules=normalUserDao.getRoomSchedulesByRoomIDAndZhouCi(application);
		String[][][] arrange=new String[8][13][2];
		Semester semester=userDao.getSemesters().get(0);

		// 过去、今天的时间不可选
		if(application.getZhouCi()==semester.getZhouCiNow()) {
			int xingQiNow=semester.getXingQiNow();
			for(int i=1;i<=xingQiNow;i++) {
				for(int j=1;j<=12;j++) {
					arrange[i][j][0]="#F0F0F0";	// 过去、今天的时间不可选，浅灰色
				}
			}
		}
		// 标记占用或拟占用教室
		for(Application a: applications) {
			a.setStatus(semester);
			if(a.getStatus()==1) {
				for(int i=a.getsJieCi();i<=a.geteJieCi();i++) {
					arrange[a.getXingQi()][i][0]="pink";	// 待审批借用，前台显示粉红色
					arrange[a.getXingQi()][i][1]=a.getType();
				}
			}else if(a.getStatus()==2 || a.getStatus()==3) {
				for(int i=a.getsJieCi();i<=a.geteJieCi();i++) {
					arrange[a.getXingQi()][i][0]="red";	// 已确定借用，前台显示红色
					arrange[a.getXingQi()][i][1]=a.getType();
				}
			}
		}
		for(RoomSchedule roomSchedule:roomSchedules) {
			for(int i=roomSchedule.getsJieCi();i<=roomSchedule.geteJieCi();i++) {
				arrange[roomSchedule.getXingQi()][i][0]="red";
				arrange[roomSchedule.getXingQi()][i][1]=roomSchedule.getType();
			}
		}
		return arrange;
	}
}
