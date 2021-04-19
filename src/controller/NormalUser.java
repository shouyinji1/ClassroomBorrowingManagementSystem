package controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.ibatis.annotations.Param;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import dao.NormalUserDao;
import entity.Application;
import entity.Classroom;
import entity.Semester;
import entity.User;
import service.NormalUserService;
import service.UserService;

@Controller
@RequestMapping("normalUser")
public class NormalUser {
	@Autowired
	NormalUserService normalUserService;
	@Autowired
	UserService userService;

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
		ModelAndView mav = null;
		switch (application.getStatus()) {
			case 1:	// 待审批
				mav=new ModelAndView("normalUser/applicationUpdate/waitApproval");
				break;
			case 2:	// 审批通过，不可反馈
				mav=new ModelAndView("normalUser/applicationUpdate/approve");
				break;
			case 3:	// 审批通过，可反馈
				mav=new ModelAndView("normalUser/applicationUpdate/feedback");
				break;
			case 4:	// 审批不通过
				mav=new ModelAndView("normalUser/applicationUpdate/oppose");
				break;
			case 5:	// 过期
				mav=new ModelAndView("normalUser/applicationUpdate/aging");
				break;
			case 6:	// 教室不可用
				mav=new ModelAndView("normalUser/applicationUpdate/unavailable");
				break;
			default:
				return null;
		}
		mav.addObject("application",application);
		return mav;
	}
	
	/** 更新申请表 */
	@RequestMapping("updateApplication")
	@ResponseBody
	public String updateApplication(Application application, HttpSession session) {
		return String.valueOf(normalUserService.updateApplication(application));
	}
	
	/** 删除申请 */
	@RequestMapping("deleteApplicationById")
	@ResponseBody
	public String deleteApplicationById(int id) {
		return Integer.toString(normalUserService.deleteApplicationById(id));
	}
	
	@RequestMapping("apply")
	public ModelAndView apply(HttpServletRequest request, HttpServletResponse response) {
		ModelAndView mav=new ModelAndView("normalUser/apply");
		mav.addObject("allXiaoQu", normalUserService.getAllXiaoQu());
		
		// 计算前台可选的周次和星期
		List<Semester> semesters=userService.getSemesters();
		int daysDiff=(int)util.DateTool.periodDay(semesters.get(0).getsDate());
		int txingQi=daysDiff%7+1+1;	// 明日星期几
		int zhouCi=daysDiff/7+1;	// 周本周次
		if(txingQi==8) {	// 如果明天是星期日，前端展示的周次选项将从下周开始。
			zhouCi++;
			txingQi=1;
			if(zhouCi>semesters.get(0).gettWeeks()) {
				return new ModelAndView("本学期已结束");
			}
		}
		mav.addObject("txingQi",txingQi);
		mav.addObject("zhouCi",zhouCi);
		mav.addObject("semester",semesters.get(0));
		return mav;
	}
	
	/** 申请查询选项动态变化 */
	@RequestMapping("selectOption")
	public ModelAndView selectOption(String select,String xiaoQu,String jiaoXueQu,String jiaoXueLou,
			String type,String floor) {
		switch (select) {
			case "XiaoQu": {
				ModelAndView mav=new ModelAndView("normalUser/selectOptions/jiaoXueQu");
				mav.addObject("allJiaoXueQu", normalUserService.getAllJiaoXueQuByXiaoQu(xiaoQu));
				return mav;
			}case "JiaoXueQu": {
				ModelAndView mav=new ModelAndView("normalUser/selectOptions/jiaoXueLou");
				mav.addObject("allJiaoXueLou", normalUserService.getAllJiaoXueLouByXJ(xiaoQu, jiaoXueQu));
				return mav;
			}case "JiaoXueLou": {
				ModelAndView mav=new ModelAndView("normalUser/selectOptions/type");
				mav.addObject("allType", normalUserService.getAllTypeByXJJ(xiaoQu, jiaoXueQu,jiaoXueLou));
				return mav;
			}case "type": {
				ModelAndView mav=new ModelAndView("normalUser/selectOptions/floor");
				mav.addObject("allFloor", normalUserService.getAllFloorByXJJT(xiaoQu,jiaoXueQu,
						jiaoXueLou,type));
				return mav;
			}case "floor": {
				ModelAndView mav=new ModelAndView("normalUser/selectOptions/room");
				mav.addObject("allRoom", normalUserService.getAllRoomIDByXJJTF(xiaoQu,jiaoXueQu,
						jiaoXueLou,type,floor));
				return mav;
			}default:
				throw new IllegalArgumentException("Unexpected value: " + select);
		}
	}
	
	@RequestMapping(value="queryRooms",method=RequestMethod.POST)
	//public ModelAndView queryRooms(String xiaoQu,String jiaoXueLou,String type,String floor,String roomID,
	//		String capacity,String status,String zhouCi,String xingQi,String sJieCi,String eJieCi) {
	public ModelAndView queryRooms(Classroom room,Application application) {
		application.setType(null);
		application.setClassroom(room);
		ModelAndView mav=new ModelAndView("normalUser/rooms");
		mav.addObject("rooms",normalUserService.getRoomsByApply(application));
		return mav;
	}
	
	@RequestMapping("applyRoom")
	public ModelAndView applyRoom(Application application,HttpSession session) {
		application.setClassroom(normalUserService.getClassroomById(application.getRoomID()));
		ModelAndView mav=new ModelAndView("normalUser/apply-Modal");
		return mav;
	}
	
	@RequestMapping(value="submitApplication",method = RequestMethod.POST)
	@ResponseBody
	public String submitApplication(Application application) {
		return Integer.toString(normalUserService.insertApplication(application));
	}
}
