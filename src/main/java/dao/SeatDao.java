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

	
		//single-ton : ��ü 1���� �����ؼ� �������
		static SeatDao single = null;

		public static SeatDao getInstance() {

			//��ü�� ������ �����ض�
			if (single == null)
				single = new SeatDao();

			return single;
		}

		//�ܺο��� �������� ����
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
				//1.Connection������
				conn = DBService.getInstance().getConnection();

				//2.PreparedStatment������
				pstmt = conn.prepareStatement(sql);

				//3.ResultSet������
				rs = pstmt.executeQuery();

				//4.����(record->Vo->list)
				while (rs.next()) {
					//rs�� ����Ű�� ��(���ڵ�)�� ���� �о�´�

					//Vo�� ����
					SeatVo vo = new SeatVo();
					
					vo.setS_idx(rs.getInt("s_idx"));
					vo.setS_name(rs.getString("s_name"));
					vo.setS_check(rs.getString("s_check"));
					vo.setS_price(rs.getString("s_price"));

					//list�߰�
					list.add(vo);
				}

			} catch (Exception e) {
				// TODO: handle exception
				e.printStackTrace();
			} finally {

				try {
					//����(����)�Ǿ����� �ݾƶ�(������������)
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
