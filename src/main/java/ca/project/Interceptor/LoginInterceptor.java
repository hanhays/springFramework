package ca.project.Interceptor;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import org.springframework.web.servlet.HandlerInterceptor;
import org.springframework.web.servlet.ModelAndView;

import ca.project.DTO.MemberDTO;

public class LoginInterceptor implements HandlerInterceptor{
	
	// pre
	@Override
	public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler)
			throws Exception {
		
		HttpSession session = request.getSession(false);
		if (session != null) {
			if (session.getAttribute("login") != null) {
				session.removeAttribute("login");
			}
		}
		
		return true;
	}
	
	
	// post
	@Override
	public void postHandle(HttpServletRequest request, HttpServletResponse response, Object handler,
			ModelAndView modelAndView) throws Exception {
		
		HttpSession session = request.getSession();
		Object login =  modelAndView.getModelMap().get("login");
		
		// 로그인 성공
		if (login != null) {
			session.setAttribute("login", login);
			response.sendRedirect("/");
		// 로그인 실패
		}else {
			session.setAttribute("msg", false);
			response.sendRedirect("/member/loginui");
		}
		
	}
	
	
	@Override
	public void afterCompletion(HttpServletRequest request, HttpServletResponse response, Object handler, Exception ex)
			throws Exception {
	}
	
}
