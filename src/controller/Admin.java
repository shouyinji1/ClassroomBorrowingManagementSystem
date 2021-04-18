package controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import entity.Application;
import service.AdminService;

@Controller
@RequestMapping("admin")
public class Admin {
	@Autowired
	AdminService adminService;
	
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
}
