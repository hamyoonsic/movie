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

import dao.ShowDao;
import vo.TheaterVo;

/**
 * Servlet implementation class CinemaCheckAction
 */
@WebServlet("/cinema_check.do")
public class CinemaCheckAction extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#service(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void service(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// TODO Auto-generated method stub
		//request.setCharacterEncoding("utf-8");
		
		int m_idx	=	Integer.parseInt(request.getParameter("m_idx"));
		int c_idx	=	Integer.parseInt(request.getParameter("c_idx"));
		
		List<TheaterVo> theater_list	=	ShowDao.getInstance().select_Theater_List(m_idx,c_idx);
		
		JSONObject json	=	new JSONObject();
		
		int idx	;
		String seat	="";
		//String name="";
		
		for(TheaterVo vo : theater_list) {
			idx	=	vo.getT_idx();
			seat	=	vo.getT_seat();
			
			//name	=	vo.getT_name();
			
			json.put(idx, seat);
			
		}

		String json_str	=	json.toJSONString();
		
		System.out.println(json_str);
		
		response.setContentType("text/json; charset=utf-8;");
		response.getWriter().print(json_str);

	}

}

