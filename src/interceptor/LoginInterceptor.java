package interceptor;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;

import entity.User;

public class LoginInterceptor extends HandlerInterceptorAdapter{
	@Override
	public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler)
			throws Exception {
		// TODO Auto-generated method stub
		User user=(User)request.getSession().getAttribute("user");

		String servletPath = request.getServletPath();
		//System.out.println("path: "+servletPath);
    	if(servletPath.contains("login.html")
    			||servletPath.contains(".js")
    			||servletPath.contains(".css")) {
    		return true;
    	}
		if (user==null) {
			// 防止未登录用户使用系统功能
			response.sendRedirect("../login.html");
			return false;
		}else if(user.getLevel().equals("NormalUser") && servletPath.contains("/admin/")) {
			// 防止用户访问到管理员的功能
			response.sendRedirect("../login.html");
			return false;
		}else if(user.getLevel().equals("Admin") && servletPath.contains("/normalUser/")) {
			// 防止管理员访问到用户的功能
			response.sendRedirect("../login.html");
			return false;
		}
		return true;
	}
	
	@Override
	public void postHandle(HttpServletRequest request, HttpServletResponse response, Object handler,
			ModelAndView modelAndView) throws Exception {
		// TODO Auto-generated method stub
		super.postHandle(request, response, handler, modelAndView);
	}
	
	@Override
	public void afterCompletion(HttpServletRequest request, HttpServletResponse response, Object handler, Exception ex)
			throws Exception {
		// TODO Auto-generated method stub
		super.afterCompletion(request, response, handler, ex);
	}
}
