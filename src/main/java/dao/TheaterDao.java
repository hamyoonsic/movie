package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import service.DBService;
import vo.TheaterVo;

public class TheaterDao {

	//single-ton : 객체 1개만 생성해서 사용하자
	static TheaterDao single = null;

	public static TheaterDao getInstance() {

		//객체가 없으면 생성해라
		if (single == null)
			single = new TheaterDao();

		return single;
	}

	//외부에서 생성하지 말것
	private TheaterDao() {
		// TODO Auto-generated constructor stub
	}
		
	
	
	public List<TheaterVo> selectList() {

		List<TheaterVo> list = new ArrayList<TheaterVo>();

		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql = "select * from theater";

		try {
			//1.Connection얻어오기
			conn = DBService.getInstance().getConnection();

			//2.PreparedStatment얻어오기
			pstmt = conn.prepareStatement(sql);

			//3.ResultSet얻어오기
			rs = pstmt.executeQuery();

			//4.포장(record->Vo->list)
			while (rs.next()) {
				//rs가 가리키는 행(레코드)의 값을 읽어온다

				//Vo로 포장
				TheaterVo vo = new TheaterVo();
				
				vo.setT_idx(rs.getInt("t_idx"));
				vo.setT_name(rs.getString("t_name"));
				vo.setT_name(rs.getString("t_seat"));
				
				
				
				//list추가
				list.add(vo);
			}

		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		} finally {

			try {
				//연결(생성)되었으면 닫아라(생성역순으로)
				if (rs != null)
					rs.close(); //3 
				if (pstmt != null)
					pstmt.close();//2
				if (conn != null)
					conn.close(); //1
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}

		return list;
	}
}
