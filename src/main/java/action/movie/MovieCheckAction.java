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
		
		boolean bResult	=	true;
		
		for(ShowVo vo : list) {
			
			if(vo.getC_idx()==null) bResult=false;
			
		}

	}

}

