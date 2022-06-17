package action.movie;

import java.io.IOException;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.ShowDao;
import vo.TheaterVo;

/**
 * Servlet implementation class TheatCheckAction
 */
@WebServlet("/theater_check.do")
public class TheatCheckAction extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#service(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void service(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// TODO Auto-generated method stub
		
		int c_idx	=	Integer.parseInt(request.getParameter("c_idx"));
		
		List<TheaterVo> theater_list	=	ShowDao.getInstance().select_Theater_List(c_idx);

	
	}

}