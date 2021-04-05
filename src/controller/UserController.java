package controller;

import java.util.List;

import org.apache.ibatis.annotations.Param;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.servlet.ModelAndView;

import entity.User;
import service.UserService;

@Controller
@RequestMapping("userController")
@SessionAttributes("user")
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
	
	@RequestMapping("/getUserById")
	public ModelAndView getUserById(@Param("id")String id) {
		ModelAndView mav=new ModelAndView("toUpd");
		List<User> list=userService.getUserById(id);
		mav.addObject("list",list);
		return mav;
	}
	
	@RequestMapping("/updUser")
	public String toUpd(User user) {
		userService.updUser(user);
		return "forward:getAllUser";
	}
	
	/** 登录验证 */
	@RequestMapping(value="/login", method = RequestMethod.POST)
	//public @ResponseBody User login(@RequestBody User user) {
	public @ResponseBody String login(@Param("id")String id,
			@Param("password")String password,
			ModelMap modelMap) {
		User user=userService.login(id, password);
		if(user != null) {
			modelMap.addAttribute("user",user);
			return "yes";
		}else {
			return "no";
		}
	}
}