package controller;

import java.util.Calendar;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Map;

import org.apache.catalina.mapper.Mapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.codec.json.Jackson2JsonEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import entity.Application;
import entity.Classroom;
import entity.Semester;
import entity.User;
import service.AdminService;
import service.UserService;

@Controller
@RequestMapping("admin")
public class Admin {
	@Autowired
	AdminService adminService;
	@Autowired
	UserService userService;
	
	/** 跳转审批界面 */
	@RequestMapping("applications")
	public ModelAndView applications() {
		ModelAndView mav=new ModelAndView("admin/applications-waitApproval");
		mav.addObject("applications",adminService.getApplicationsForApproval());
		return mav;
	}
	
	/** 查看单个待审批申请 */
	@RequestMapping("application")
	public ModelAndView application(int id) {
		ModelAndView mav=new ModelAndView("admin/application-waitApproval");
		mav.addObject("application",adminService.getApplicationById(id));
		return mav;
	}
	
	/** 提交审批 */
	@RequestMapping(value="approve",method = RequestMethod.POST)
	@ResponseBody
	public String approve(Application application) {
		return Integer.toString(adminService.updateReviewOfApplication(application));
	}
	
	
	/**************** 历史审批记录管理 *******************/
	/** 根据教室查找历史审批界面跳转 */
	@RequestMapping("historicalApplications")
	public ModelAndView historicalApplications() {
		ModelAndView mav=new ModelAndView("admin/historicalApplications");
		mav.addObject("allXiaoQu",adminService.getAllXiaoQuOfApplications());
		mav.addObject("applications",adminService.getReviewedApplicationsOf7Days());
		return mav;
	}

	/** 近7天历史申请审批界面跳转 */
	@RequestMapping("getReviewedApplicationsOf7Days")
	public ModelAndView getReviewedApplicationsOf7Days() {
		ModelAndView mav=new ModelAndView("admin/queriedHistoricalApplications");
		mav.addObject("applications",adminService.getReviewedApplicationsOf7Days());
		mav.addObject("applicationsTableTitle","近7天申请审批记录");
		return mav;
	}
	
	/** 申请查询选项动态变化 */
	@RequestMapping("applicationsOption")
	public ModelAndView selectOption(String select,Classroom room) {
		switch (select) {
			case "XiaoQu": {
				ModelAndView mav=new ModelAndView("admin/roomOptions/jiaoXueQu");
				mav.addObject("allJiaoXueQu", adminService.getJiaoXueQuOfAByX(room));
				return mav;
			}case "JiaoXueQu": {
				ModelAndView mav=new ModelAndView("admin/roomOptions/jiaoXueLou");
				mav.addObject("allJiaoXueLou", adminService.getJiaoXueLouOfAByXJ(room));
				return mav;
			}case "JiaoXueLou": {
				ModelAndView mav=new ModelAndView("admin/roomOptions/type");
				mav.addObject("allType", adminService.getTypeOfAByXJJ(room));
				return mav;
			}case "type": {
				ModelAndView mav=new ModelAndView("admin/roomOptions/floor");
				mav.addObject("allFloor", adminService.getFloorOfAByXJJT(room));
				return mav;
			}case "floor": {
				ModelAndView mav=new ModelAndView("admin/roomOptions/room");
				mav.addObject("allRoom", adminService.getRoomIDOfAByXJJTF(room));
				return mav;
			}default:
				throw new IllegalArgumentException("Unexpected value: " + select);
		}
	}
	
	@RequestMapping("queryHistoricalApplications")
	public ModelAndView queryHistoricalApplications(Classroom room,int approval) {
		ModelAndView mav=new ModelAndView("admin/queriedHistoricalApplications");
		mav.addObject("applications",adminService.getApplicationsByRoom(room,approval));
		mav.addObject("applicationsTableTitle","审批历史");
		return mav;
	}
	
	/** 根据用户查找历史审批界面跳转 */
	@RequestMapping("historicalApplicationsByUser")
	public ModelAndView historicalApplicationsByUser() {
		ModelAndView mav=new ModelAndView("admin/historicalApplicationsByUser");
		return mav;
	}

	@RequestMapping("queryHistoricalApplicationsByUserID")
	public ModelAndView queryHistoricalApplicationsByUserID(String userID) {
		ModelAndView mav=new ModelAndView("admin/queriedHistoricalApplications");
		mav.addObject("applications",adminService.getApplicationsByUserID(userID));
		mav.addObject("applicationsTableTitle","审批历史");
		return mav;
	}
	
	@RequestMapping("viewApplication")
	public ModelAndView viewApplication(int id) {
		ModelAndView mav=new ModelAndView("admin/applicationModal");
		mav.addObject("application",adminService.getApplicationById(id));
		mav.addObject("semester",userService.getSemesters().get(0));
		return mav;
	}
	
	@RequestMapping("deleteApplicationByID")
	@ResponseBody
	public String deleteApplicationByID(int id) {
		return Integer.toString(adminService.deleteApplicationByID(id));
	}

	@RequestMapping("updateReadFeedback")
	@ResponseBody
	public String updateReadFeedback(Application application) {
		return Integer.toString(adminService.updateReadFeedback(application));
	}
	

	/*********** 教室维护 ***********/
	/** 教室维护界面跳转 */
	@RequestMapping("roomManagement")
	public ModelAndView roomManagement() {
		ModelAndView mav=new ModelAndView("admin/roomManagement");
		mav.addObject("allXiaoQu",adminService.getAllXiaoQu());
		return mav;
	}

	/** 申请查询选项动态变化 */
	@RequestMapping("roomsOption")
	public ModelAndView roomsOption(String select,Classroom room) {
		switch (select) {
			case "XiaoQu": {
				ModelAndView mav=new ModelAndView("admin/roomOptions/jiaoXueQu");
				mav.addObject("allJiaoXueQu", adminService.getAllJiaoXueQuByXiaoQu(room));
				return mav;
			}case "JiaoXueQu": {
				ModelAndView mav=new ModelAndView("admin/roomOptions/jiaoXueLou");
				mav.addObject("allJiaoXueLou", adminService.getAllJiaoXueLouByXJ(room));
				return mav;
			}case "JiaoXueLou": {
				ModelAndView mav=new ModelAndView("admin/roomOptions/type");
				mav.addObject("allType", adminService.getAllTypeByXJJ(room));
				return mav;
			}case "type": {
				ModelAndView mav=new ModelAndView("admin/roomOptions/floor");
				mav.addObject("allFloor", adminService.getAllFloorByXJJT(room));
				return mav;
			}case "floor": {
				ModelAndView mav=new ModelAndView("admin/roomOptions/room");
				mav.addObject("allRoom", adminService.getAllRoomIDByXJJTF(room));
				return mav;
			}default:
				throw new IllegalArgumentException("Unexpected value: " + select);
		}
	}
	
	@RequestMapping("queryRooms")
	public ModelAndView queryRooms(Classroom room) {
		ModelAndView mav=new ModelAndView("admin/rooms");
		mav.addObject("rooms",adminService.getRoomsByRoomInfo(room));
		return mav;
	}
	
	/** 查看某个教室的相关信息 */
	@RequestMapping("room")
	public ModelAndView room(String roomID) {
		ModelAndView mav=new ModelAndView("admin/room");
		mav.addObject("applications",adminService.getApplicationsByRoomID(roomID));
		mav.addObject("semester",userService.getSemesters().get(0));
		mav.addObject("roomSchedules",adminService.getRoomSchedulesByRoomID(roomID));
		mav.addObject("room",adminService.getRoomByRoomID(roomID));
		return mav;
	}
	
	/** 教室使用统计 */
	@RequestMapping("getRoomStatistic")
	@ResponseBody
	public Map<String, Object> getRoomStatistic(String roomID) {
		Map<String,Object> map=new HashMap<String,Object>();
		map.put("relativeFrequency", adminService.getRelativeFrequencyOfEveryWeek(roomID));
		map.put("frequency", adminService.getFrequencyOfEveryWeek(roomID));
		int tWeeks=userService.getSemesters().get(0).gettWeeks();
		int[] weekSequence=new int[tWeeks];
		for(int i=0;i<tWeeks;i++) {
			weekSequence[i]=i+1;
		}
		map.put("weekSequence", weekSequence);
		return map;
	}
	
	/** 更新教室可用状态 */
	@RequestMapping("updateRoomAvailable")
	@ResponseBody
	public String updateRoomAvailable(Classroom room) {
		return Integer.toString(adminService.updateRoomAvailable(room));
	}

	/*************** 反馈浏览 *****************/
	@RequestMapping("feedbackBrowsing")
	public ModelAndView feedbackBrowsing() {
		ModelAndView mav=new ModelAndView("admin/feedbacks");
		return mav;
	}
	
	@RequestMapping("newFeedbacksTable")
	public ModelAndView newFeedbacksTable() {
		ModelAndView mav=new ModelAndView("admin/feedbackTable/newFeedbacksTable");
		mav.addObject("unreadFeedbacks",adminService.getUnreadFeedbacks());
		mav.addObject("newFeedbackCounter",adminService.getCounterOfNewFeedback());
		return mav;
	}

	@RequestMapping("recentFeedbacksTable")
	public ModelAndView recentFeedbacksTable() {
		ModelAndView mav=new ModelAndView("admin/feedbackTable/recentFeedbacksTable");
		mav.addObject("recentFeedbacks",adminService.getFeedbacksRecent7Days());
		return mav;
	}
	
	@RequestMapping("updateSemester")
	@ResponseBody
	public String updateSemester(Semester semester) {
		Calendar calendar=Calendar.getInstance();
		calendar.setTime(semester.getsDate());
		if(calendar.get(Calendar.DAY_OF_WEEK)==2) {
			return Integer.toString(adminService.updateSemester(semester));
		}else {
			return "-1";	// 日期必须是星期一
		}
	}
	
	
	/** 统计 */
	@RequestMapping("statistic")
	public ModelAndView statistic() {
		ModelAndView mav=new ModelAndView("admin/statistic");
		mav.addObject("as",adminService.getApplicationStatistic());
		mav.addObject("fs",adminService.getFeedbackStatistic());
		mav.addObject("us",adminService.getUserStatistic());
		
		// 进度条颜色
		String[] colorClass= {"bg-danger","bg-warning","","bg-info","bg-success"};
		mav.addObject("colorClass",colorClass);
		return mav;
	}
}