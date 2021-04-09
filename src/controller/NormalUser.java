package controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

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

	@RequestMapping("myApplications")
	public ModelAndView myApplications(HttpServletRequest request, HttpServletResponse response){
		User user=(User)request.getSession().getAttribute("user");
		List<Application> applications=normalUserService.getApplicationsById(user.getId());
		ModelAndView mav=new ModelAndView("normalUser/myApplications");
		mav.addObject("applications", applications);
		return mav;
	}
	
	@RequestMapping("apply")
	public ModelAndView applyRoom(HttpServletRequest request, HttpServletResponse response) {
		ModelAndView mav=new ModelAndView("normalUser/apply");
		return mav;
	}
}
