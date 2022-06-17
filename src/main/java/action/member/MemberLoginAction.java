package action.member;
//·Î±×ÀÎ
import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import dao.MemberDao;
import vo.MemberVo;

/**
 * Servlet implementation class MemberLoginAction
 */
@WebServlet("/login.do")
public class MemberLoginAction extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#service(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void service(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// TODO Auto-generated method stub

		// /movie/login.do?m_id=chladlud50&m_pwd=ddvd
		
		request.setCharacterEncoding("utf-8");
		
		
		String mem_id = request.getParameter("mem_id");
		String mem_pwd = request.getParameter("mem_pwd");
		
		//System.out.println(mem_id);
		MemberVo user = MemberDao.getInstance().selectOne(mem_id);
		
		
		
		if(user==null) {
			response.sendRedirect("login_form.do?reason=fail_id ");
			return;
			
			
		}
		
		if(user.getMem_pwd().equals(mem_pwd)==false) {
			
			//session tracking
			response.sendRedirect("login_form.do?reason=fail_pwd&mem_id="+mem_id);
			return;
			
			
		}
		
		HttpSession session = request.getSession();
		session.setAttribute("user", user);
		
		response.sendRedirect("main.jsp");
		
		
		
		
	}

}
