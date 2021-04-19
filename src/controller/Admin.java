package controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import dao.UserDao;
import entity.Application;
import entity.Classroom;
import entity.Semester;
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
	
	/** 历史申请界面跳转 */
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
				ModelAndView mav=new ModelAndView("admin/applicationsOptions/jiaoXueQu");
				mav.addObject("allJiaoXueQu", adminService.getJiaoXueQuOfAByX(room));
				return mav;
			}case "JiaoXueQu": {
				ModelAndView mav=new ModelAndView("admin/applicationsOptions/jiaoXueLou");
				mav.addObject("allJiaoXueLou", adminService.getJiaoXueLouOfAByXJ(room));
				return mav;
			}case "JiaoXueLou": {
				ModelAndView mav=new ModelAndView("admin/applicationsOptions/type");
				mav.addObject("allType", adminService.getTypeOfAByXJJ(room));
				return mav;
			}case "type": {
				ModelAndView mav=new ModelAndView("admin/applicationsOptions/floor");
				mav.addObject("allFloor", adminService.getFloorOfAByXJJT(room));
				return mav;
			}case "floor": {
				ModelAndView mav=new ModelAndView("admin/applicationsOptions/room");
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
	
	@RequestMapping("viewApplication")
	public ModelAndView viewApplication(int id) {
		ModelAndView mav=new ModelAndView("admin/applicationModal");
		mav.addObject("application",adminService.getApplicationById(id));
		return mav;
	}
}
