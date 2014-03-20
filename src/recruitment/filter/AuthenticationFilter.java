package recruitment.filter;

import java.io.IOException;

import javax.servlet.FilterChain;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.springframework.web.filter.OncePerRequestFilter;

import recruitment.model.Administrator;
import recruitment.model.Employer;
import recruitment.model.JobSeeker;


public class AuthenticationFilter extends OncePerRequestFilter {
	/**
	 * session中用户名的key
	 */
	private static final String loginUserCode = "login.userCode"; 
	/**
	 * 日志对象
	 */
	private static final Log log = LogFactory.getLog(AuthenticationFilter.class);

	/**
	 * 不需要过滤的url集，逗号分割
	 */
	private String notFilterList;

	/**
	 * 不需要过滤的url
	 */
	private String[] notFilters;

	public void setNotFilterList(String notFilterList) {
		this.notFilterList = notFilterList;
	}

	@Override
	protected void doFilterInternal(HttpServletRequest request,
			HttpServletResponse response, FilterChain filterChain)
			throws ServletException {
		try {
			String url = request.getServletPath();
			HttpSession session = request.getSession();
			JobSeeker js = (JobSeeker) session.getAttribute("user");
			String js_email = js==null?null:js.getEmail();
			
			Employer emp = (Employer) session.getAttribute("emp_user");
			String emp_email = emp==null?null:emp.getEmail();
			
			Administrator admin = (Administrator) session.getAttribute("admin");
			String admin_username = admin==null?null:admin.getUsername();
			//check if user login		
			if(emp_email == null || emp_email.trim().length() ==0) {
				promptTimout("reLogin", request, response);
				return;
			}
			else if (js_email == null || js_email.trim().length() == 0) {
					promptTimout("reLogin", request, response);
					return;
			}
			else if (admin_username == null || admin_username.trim().length() == 0) {
				promptTimout("reLogin", request, response);
				return;
			}
			else{
				filterChain.doFilter(request, response);
			}
		}
		catch (ServletException e) {
			throw e;
		}
		catch (Exception e) {
			log.error("Internal error", e);
			prompt("Internal error", request, response);
			return;
		}
	}

	/*
	 * (non-Javadoc)
	 * 
	 * @see org.springframework.web.filter.GenericFilterBean#initFilterBean()
	 */
	@Override
	protected void initFilterBean() throws ServletException {
		if (notFilterList != null) {
			notFilters = notFilterList.split(" *, *");
		}
	}

	/*
	 * (non-Javadoc)
	 * 
	 * @see org.springframework.web.filter.OncePerRequestFilter#shouldNotFilter(javax.servlet.http.HttpServletRequest)
	 */
	@Override
	protected boolean shouldNotFilter(HttpServletRequest request)
			throws ServletException {
		String url = request.getServletPath();

		if (notFilters != null) {
			for (int i = notFilters.length - 1; i >= 0; i--) {
				if (url.lastIndexOf(notFilters[i]) >= 0) {
					return true;
				}
			}
		}

		return false;
	}

	/**
	 * 不具有访问权限，跳转到指定页面
	 * 
	 * @param msg
	 *            消息内容
	 * @param request
	 *            请求
	 * @param response
	 *            响应
	 * @throws ServletException
	 * @throws IOException
	 */
	private void prompt(String msg, HttpServletRequest request,
			HttpServletResponse response) throws ServletException {
		RequestDispatcher dispatcher = request
				.getRequestDispatcher("/noright.jsp");

		if (dispatcher != null) {
			request.setAttribute("msg", msg);

			try {
				dispatcher.forward(request, response);
			}
			catch (Exception e) {
				throw new ServletException(e);
			}
		}
	}

	/**
	 * session不存在，跳转到登录页面
	 * 
	 * @param msg
	 *            消息内容
	 * @param request
	 *            请求
	 * @param response
	 *            响应
	 * @throws ServletException
	 * @throws IOException
	 */
	private void promptTimout(String msg, HttpServletRequest request,
			HttpServletResponse response) throws Exception {
		StringBuilder rediretPage = new StringBuilder();
//		String queryString = request.getQueryString();

		rediretPage.append(request.getContextPath());
		rediretPage.append("/sessionError.jsp");
//		rediretPage.append("/minilogin.jsp?lastPage=");
//		rediretPage.append(request.getServletPath());
//
//		if (queryString != null) {
//			rediretPage.append("?");
//			rediretPage.append(URLEncoder.encode(queryString, request
//					.getCharacterEncoding()));
//		}

		try {
			response.sendRedirect(rediretPage.toString());
		}
		catch (Exception e) {
			throw new ServletException(e);
		}
		
	}
}