package action.movie;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.json.simple.JSONObject;

import dao.CinemaDao;
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
		
		
		
		List<CinemaVo> cinema_list	=	ShowDao.getInstance().select_Cinema_List(m_idx);
		
		
		
		JSONObject json	=	new JSONObject();
		
		int idx;
		String name="";
		
		for(CinemaVo vo : cinema_list) {
			
			idx	=	vo.getC_idx();
			name	=	vo.getC_name();
			json.put(idx, name);
			
		}
		
		
		String json_str	=	json.toJSONString();
		
		System.out.println(json_str);
		
		response.setContentType("text/json; charset=utf-8;");
		response.getWriter().print(json_str);
		
		
		
		

	}

}

