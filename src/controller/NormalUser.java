package controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

@Controller
@RequestMapping("normalUser")
public class NormalUser {
	@RequestMapping("borrowRecord")
	public ModelAndView borrowRecord(HttpServletRequest request, HttpServletResponse response){
		ModelAndView mav=new ModelAndView("normalUser/borrowRecord");
		return mav;
	}
}
