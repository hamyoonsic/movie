package action.movie;

import java.io.IOException;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.json.simple.JSONArray;
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
		
		List<TheaterVo> theater_list	=	ShowDao.getInstance().select_Cinema_List(m_idx,c_idx);
		
		JSONObject json				=	new JSONObject();
		JSONObject json2			=	new JSONObject();
		JSONArray jsonAarray		= 	new JSONArray();
		
		String name="";
		String seat	="";
		int		idx;
		String	time;
		//String name="";
		
		
		for(TheaterVo vo : theater_list) {
			idx		=	vo.getT_idx();
			name	=	vo.getT_name();
			seat	=	vo.getT_seat();
			time	=	vo.getT_time();
			
				
			jsonAarray.add(name);
			jsonAarray.add(seat);
			jsonAarray.add(time);
			
			json.put(idx, jsonAarray);
				
			
			
			
			
			
			
		}
		
		String json_str	=	json2.toJSONString();
		
	
		response.setContentType("text/json; charset=utf-8;");
		response.getWriter().print(json_str);
		
		System.out.println(json_str);
	}

}
/*
{
"2":["2包","170籍","9:30,11:30,16:30,18:30"] ,
"2":["3包","170籍","12:00"] ,
"2":["9包","170籍","10:30,11:30"] ,
}

{
"2":["2包","170籍","9:30,11:30,16:30,18:30,20:30","4包","155籍","10:25,13:25,15:25,17:25,19:25,21:25"],
"4":["2包","170籍","9:30,11:30,16:30,18:30,20:30","4包","155籍","10:25,13:25,15:25,17:25,19:25,21:25"]}

*/
