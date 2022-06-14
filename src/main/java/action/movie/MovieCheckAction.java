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
		
		System.out.println(m_idx);
		
		List<ShowVo> cinema_list	=	ShowDao.getInstance().select_C_idx_List(m_idx);
		
		System.out.println(cinema_list.size());
		
		JSONObject json	=	new JSONObject();
		StringBuilder c_list= new StringBuilder();
		
		json.put("∞≠≥≤Cgv", false);
		json.put("»´¥ÎCgv", false);
		json.put("ø¨≥≤Cgv", false);
		json.put("Ω≈√ÃCgv", false);
		
		for(ShowVo vo : cinema_list) {
			
			if(vo.getC_idx()==1) {
				json.put("∞≠≥≤Cgv", true);
			}
			if(vo.getC_idx()==2) {
				json.put("»´¥ÎCgv", true);
			}
			if(vo.getC_idx()==3) {
				json.put("ø¨≥≤Cgv", true);
			}
			if(vo.getC_idx()==4) {
				json.put("Ω≈√ÃCgv", true);
			}
			
		}
		
		
		String json_str	=	json.toJSONString();
		
		System.out.println(json_str);
		
		response.setContentType("text/json; charset=utf-8;");
		response.getWriter().print(json_str);
		
		
		
		

	}

}

