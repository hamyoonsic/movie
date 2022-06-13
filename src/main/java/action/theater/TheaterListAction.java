package action.theater;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.json.simple.JSONObject;

import dao.TheaterDao;
import vo.TheaterVo;

/**
 * Servlet implementation class TheaterListAction
 */
@WebServlet("/theater_list.do")
public class TheaterListAction extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#service(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void service(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// TODO Auto-generated method stub

		List<TheaterVo> list = TheaterDao.getInstance().selectList();
		
		JSONObject json	=	new JSONObject();
		
		json.put("t_list", list);
		String json_str	=	json.toJSONString();
		
		response.setContentType("text/json; charset=utf-8;");
		response.getWriter().print(json_str);
		
		
	}

}

