import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.ShowDao;
import vo.CinemaVo;
import vo.ShowVo;

/**
 * Servlet implementation class MovieCheckAction
 */
@WebServlet("/movie_check.do")
public class MovieCheckAction extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#service(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void service(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// TODO Auto-generated method stub

		request.setCharacterEncoding("utf-8");
		
		int m_idx	=	Integer.parseInt(request.getParameter("m_idx"));
		
		List<ShowVo> list	=	ShowDao.getInstance().selectList(m_idx);
		
		//List<CinemaVo> c_list	=	new ArrayList<CinemaVo>();
		
		//선택한 영화 idx번호를 통해 그 영화에 해당하는 상영관.극장정보 좌석 날짜 
		//정보를 얻어온다
		
		// ???
		
		// 날짜를 선택하면 이미 값이 있는 테이블의 값을 읽어오는 건지?
		
		// 상영하는 날짜만?
		
		// 날짜를 정하면 그 날짜가 테이블에 insert되는건지...
		
		

	}

}

