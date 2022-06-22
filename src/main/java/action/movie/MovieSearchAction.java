package action.movie;

import java.io.IOException;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.json.simple.JSONObject;

import dao.MovieDao;
import vo.MovieVo;

/**
 * Servlet implementation class MovieSearchAction
 */
@WebServlet("/movie_search.do")
public class MovieSearchAction extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#service(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void service(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// TODO Auto-generated method stub

		
		
		request.setCharacterEncoding("utf-8");
		
		
		String search_text =request.getParameter("search_text");
		
		List<MovieVo> list = MovieDao.getInstance().selectSearchMovieList(search_text);
		
		request.setAttribute("list", list);
		
		String forward_page = "/content/movie_search_list.jsp";
		RequestDispatcher disp = request.getRequestDispatcher(forward_page);
		disp.forward(request, response);
		
		

		
		
	}

}
