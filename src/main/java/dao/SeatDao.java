package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import service.DBService;
import vo.SeatVo;

public class SeatDao {

	
		//single-ton : 객체 1개만 생성해서 사용하자
		static SeatDao single = null;

		public static SeatDao getInstance() {

			//객체가 없으면 생성해라
			if (single == null)
				single = new SeatDao();

			return single;
		}

		//외부에서 생성하지 말것
		private SeatDao() {
			// TODO Auto-generated constructor stub
		}
		
		public List<SeatVo> selectList() {

			List<SeatVo> list = new ArrayList<SeatVo>();

			Connection conn = null;
			PreparedStatement pstmt = null;
			ResultSet rs = null;
			String sql = "select * from seat";

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
					SeatVo vo = new SeatVo();
					
					vo.setS_idx(rs.getInt("s_idx"));
					vo.setS_name(rs.getString("s_name"));
					vo.setS_check(rs.getString("s_check"));
					vo.setS_price(rs.getString("s_price"));

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
