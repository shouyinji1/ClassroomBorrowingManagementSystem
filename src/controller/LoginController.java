package controller;

import javax.servlet.http.HttpSession;

import org.apache.ibatis.annotations.Param;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.SessionAttributes;

import entity.User;
import service.UserService;

@SessionAttributes("user")
@RequestMapping(value="loginController")
@Controller("loginController")
public class LoginController {
	@Autowired
	UserService userService;

	/** 登录验证
	 * 此处提前讲session传入，避免在response之后再创建session的BUG */
	@RequestMapping(value="/login", method = RequestMethod.POST)
	//public @ResponseBody User login(@RequestBody User user) {
	public @ResponseBody String login(@Param("id")String id, @Param("password")String password,
			ModelMap modelMap, HttpSession session) {
		User user=userService.login(id, password);
		if(user != null) {
			modelMap.addAttribute("user",user);
			return "yes";
		}else {
			return "no";
		}
	}
}
