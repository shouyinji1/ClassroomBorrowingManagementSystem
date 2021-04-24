package controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.ibatis.annotations.Param;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.bind.support.SessionStatus;
import org.springframework.web.servlet.ModelAndView;

import entity.Semester;
import entity.User;
import service.AdminService;
import service.UserService;

@RequestMapping(value="userController")
@Controller("userController")
public class UserController {
	@Autowired
	UserService userService;
	@Autowired
	AdminService adminService;
	
	@RequestMapping("/getAllUser")
	public ModelAndView getAllUser() {
		// 创建一个List集合用于接收Service层方法的返回值
		List<User> listUser=userService.getAllUser();
		// 创建一个ModelAndView对象，括号里面的参数是指定要跳转到哪个JSP页面
		ModelAndView mav=new ModelAndView("getAll");
		// 通过addObject()方法，我们把要存的值存了进去
		mav.addObject("listUser",listUser);
		// 最后把ModelAndView对象返回出去
		return mav;
	}
	
	@RequestMapping("/getUserById")
	public ModelAndView getUserById(@Param("id")String id) {
		ModelAndView mav=new ModelAndView("toUpd");
		List<User> list=userService.getUserById(id);
		mav.addObject("list",list);
		return mav;
	}
	
	/**
	 * @return 更新用户信息，不包括密码 */
	@RequestMapping("updateUserInfo")
	@ResponseBody
	public String updateUserInfo(User user,HttpServletRequest request) {
		int status=userService.updUser(user);
		if (status==1) {
			User newUser=(User)request.getSession().getAttribute("user");
			newUser.setEmail(user.getEmail());
			newUser.setPhone(user.getPhone());
			request.getSession().setAttribute("user", newUser);
		}
		return Integer.toString(status);
	}
	
	@RequestMapping("updatePassword")
	@ResponseBody
	public String updatePassword(String password,String newPassword,HttpServletRequest request) {
			User newUser=(User)request.getSession().getAttribute("user");
			User user=new User();
			user.setId(newUser.getId());
			user.setPassword(password);
			user.setNewPassword(newPassword);
			int status=userService.updatePasssword(user);
			if(status==1) {
				newUser.setPassword(newPassword);
				request.getSession().setAttribute("user", newUser);
			}
			return Integer.toString(status);
	}
	
	/** 首页跳转 */
	@RequestMapping("toIndex")
	public ModelAndView toIndex(HttpServletRequest request,HttpServletResponse response) {
		User user=(User)request.getSession().getAttribute("user");
		ModelAndView mav;
		if(user == null)
			mav=new ModelAndView("redirect:/login.html");
		else if(user.getLevel().equals("Admin")) {
			mav=new ModelAndView("admin/index");
			mav.addObject("newFeedbackCounter",adminService.getCounterOfNewFeedback());
			Semester semester=null;
			try {
				semester=userService.getSemesters().get(0);
			} catch (IndexOutOfBoundsException e) {	// 学期信息表没有记录
				// TODO: handle exception
				userService.insertSemester();
				semester=userService.getSemesters().get(0);
			}
			if(semester.getsDate()==null) {
				mav.addObject("mustSetSDate",true);
			}else {
				mav.addObject("mustSetSDate",false);
			}
			mav.addObject("semester",semester);
		}else 
			mav=new ModelAndView("normalUser/index");
		// 最后把ModelAndView对象返回出去
		return mav;
		//return "forward:normalUser/index";
	}
	
	@RequestMapping("logout")
	public String logout(SessionStatus status) {
		status.setComplete();
		return "redirect:/login.html";
	}
}