package controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.ibatis.annotations.Param;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import entity.Application;
import entity.User;
import service.NormalUserService;

@Controller
@RequestMapping("normalUser")
public class NormalUser {
	@Autowired
	NormalUserService normalUserService;

	/** 跳转我的申请表页面 */
	@RequestMapping("myApplications")
	public ModelAndView myApplications(HttpServletRequest request, HttpServletResponse response){
		User user=(User)request.getSession().getAttribute("user");
		List<Application> applications=normalUserService.getApplicationsByUserId(user.getId());
		ModelAndView mav=new ModelAndView("normalUser/myApplications");
		mav.addObject("applications", applications);
		return mav;
	}
	
	/** 跳转申请表修改页面 */
	@RequestMapping("applicationUpdate")
	public ModelAndView applicationUpdate(@Param("id")int id,HttpServletRequest request, HttpServletResponse response) {
		Application application=normalUserService.getApplicationById(id);
		ModelAndView mav=new ModelAndView("normalUser/applicationUpdate");
		mav.addObject("application",application);
		return mav;
	}
	
	@RequestMapping("apply")
	public ModelAndView applyRoom(HttpServletRequest request, HttpServletResponse response) {
		ModelAndView mav=new ModelAndView("normalUser/apply");
		return mav;
	}
}
