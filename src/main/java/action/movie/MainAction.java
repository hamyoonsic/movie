package action.movie;

import java.io.IOException;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.CinemaDao;
import dao.MovieDao;
import dao.TheaterDao;
import vo.CinemaVo;
import vo.MovieVo;
import vo.TheaterVo;

/**
 * Servlet implementation class MainAction
 */
@WebServlet("/main.do")
public class MainAction extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#service(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void service(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// TODO Auto-generated method stub
		
		
		List<MovieVo> movie_list	=	MovieDao.getInstance().selectList();
		//List<TheaterVo> theater_list	=	TheaterDao.getInstance().selectList();
		List<CinemaVo> cinema_list	=	CinemaDao.getInstance().selectList();
		
		
		request.setAttribute("movie_list", movie_list);
		//request.setAttribute("theater_list", theater_list);
		request.setAttribute("cinema_list", cinema_list);
		

		//forward
		String forward_page = "main.jsp?menu=ticket";
		RequestDispatcher disp = request.getRequestDispatcher(forward_page);
		disp.forward(request, response);

	}

}