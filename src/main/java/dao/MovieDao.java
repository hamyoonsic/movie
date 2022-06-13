package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import service.DBService;
import vo.MovieVo;

public class MovieDao {
	
		//single-ton : 객체 1개만 생성해서 사용하자
		static MovieDao single = null;

		public static MovieDao getInstance() {

			//객체가 없으면 생성해라
			if (single == null)
				single = new MovieDao();

			return single;
		}

		//외부에서 생성하지 말것
		private MovieDao() {
			// TODO Auto-generated constructor stub
		}
	

	
		public List<MovieVo> selectList() {

			List<MovieVo> list = new ArrayList<MovieVo>();

			Connection conn = null;
			PreparedStatement pstmt = null;
			ResultSet rs = null;
			String sql = "select * from movie";

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
					MovieVo vo = new MovieVo();
					
					vo.setM_idx(rs.getInt("m_idx"));
					vo.setM_name(rs.getString("m_name"));
					vo.setM_rate(rs.getString("m_rate"));
					vo.setM_release(rs.getString("m_release"));
					vo.setM_r_time(rs.getString("m_r_time"));
					vo.setM_age(rs.getString("m_age"));
					
					

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
