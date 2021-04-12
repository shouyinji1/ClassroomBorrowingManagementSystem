package controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.ibatis.annotations.Param;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
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
	
	/** 更新申请表 */
	@RequestMapping("updateApplication")
	@ResponseBody
	public String updateApplication(Application application, HttpSession session) {
		System.out.println(application.getRoomID());
		return String.valueOf(normalUserService.updateApplication(application));
	}
	
	@RequestMapping("apply")
	public ModelAndView apply(HttpServletRequest request, HttpServletResponse response) {
		ModelAndView mav=new ModelAndView("normalUser/apply");
		mav.addObject("allXiaoQu", normalUserService.getAllXiaoQu());
		return mav;
	}
	
	/** 申请查询选项动态变化 */
	@RequestMapping("selectOption")
	public ModelAndView selectOption(String select,String xiaoQu,String jiaoXueLou,String floor) {
		switch (select) {
			case "XiaoQu": {
				ModelAndView mav=new ModelAndView("normalUser/selectOptions/jiaoXueLou");
				mav.addObject("allJiaoXueLou", normalUserService.getAllJiaoXueLouByXiaoQu(xiaoQu));
				return mav;
			}
			case "JiaoXueLou": {
				ModelAndView mav=new ModelAndView("normalUser/selectOptions/type");
				mav.addObject("allType", normalUserService.getAllTypeByXiaoquJiaoxuelou(xiaoQu, jiaoXueLou));
				return mav;
			}
			case "type": {
				ModelAndView mav=new ModelAndView("normalUser/selectOptions/floor");
				//mav.addObject("allFloor", normalUserService.getAllFloorByXJT(xiaoQu, jiaoXueLou));
				return mav;
			}
			default:
				throw new IllegalArgumentException("Unexpected value: " + select);
		}
	}
}
