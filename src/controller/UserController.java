package controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import entity.User;
import service.UserService;

@Controller
@RequestMapping("userController")
public class UserController {
	@Autowired
	UserService userService;
	
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
}