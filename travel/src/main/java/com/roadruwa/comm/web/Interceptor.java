package com.roadruwa.comm.web;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.slf4j.MDC;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;

import com.roadruwa.vo.ManagerVo;
import com.roadruwa.vo.UserVo;

public class Interceptor extends HandlerInterceptorAdapter {

	private final Log logger = LogFactory.getLog(getClass());

	@Override
	public boolean preHandle(HttpServletRequest request, HttpServletResponse response,  Object handler)
			throws Exception {

		String uri = request.getRequestURI();
		UserVo userVo = null;
		ManagerVo managerVo = null;
		
		if( uri.equals("")) {
			logger.fatal("##### Start [" + uri + "] ####");
			System.exit(0);
		}else {
			logger.info("##### Start [" + uri + "] ####");
		}
		
		// 로그인 세션을 체크함.
		HttpSession session = request.getSession();
		// Login체크를 해야하고 세션값이 null이면 로그인 페이지로 이동.
		if (session.getAttribute("u_id") == null) {
			response.sendRedirect(request.getContextPath() + "/indexPage.do");
			return false;
		} /*
			 * else if (session.getAttribute("managerid") == null) {
			 * response.sendRedirect(request.getContextPath() +
			 * "/managerlogin/loginForm.do"); return false; }
			 */
		
		return super.preHandle(request, response, handler);
	}

	@Override
	public void postHandle(HttpServletRequest request, HttpServletResponse response, Object handler,
			ModelAndView modelAndView) throws Exception {
		String uri = request.getRequestURI();
		
		logger.info("##### End [" + uri + "] ####");
		MDC.clear();
		super.postHandle(request, response, handler, modelAndView);
	}
}
