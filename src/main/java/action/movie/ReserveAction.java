package action.movie;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class ReserveAction
 */
@WebServlet("/reserve.do")
public class ReserveAction extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#service(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		int movie_idx = Integer.parseInt(request.getParameter("movie_idx"));
		int cinema_idx = Integer.parseInt(request.getParameter("cinema_idx"));
		int day = Integer.parseInt(request.getParameter("day"));
		String time = request.getParameter("time");
		int theater_idx = Integer.parseInt(request.getParameter("theater_idx"));
		
		request.setAttribute("movie_idx", movie_idx);
		request.setAttribute("cinema_idx", cinema_idx);
		request.setAttribute("day", day);
		request.setAttribute("time", time);
		request.setAttribute("theater_idx", theater_idx);
		
		//forward
		String forward_page = "main.jsp?menu=m_info";
		RequestDispatcher disp = request.getRequestDispatcher(forward_page);
		disp.forward(request, response);
	}

}
