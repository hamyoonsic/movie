package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import service.DBService;
import vo.CinemaVo;

public class CinemaDao {
		//single-ton : ��ü 1���� �����ؼ� �������
		static CinemaDao single = null;

		public static CinemaDao getInstance() {

			//��ü�� ������ �����ض�
			if (single == null)
				single = new CinemaDao();

			return single;
		}

		//�ܺο��� �������� ����
		private CinemaDao() {
			// TODO Auto-generated constructor stub
		}
		
		public List<CinemaVo> selectList() {

			List<CinemaVo> list = new ArrayList<CinemaVo>();

			Connection conn = null;
			PreparedStatement pstmt = null;
			ResultSet rs = null;
			String sql = "select * from cinema";

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
					CinemaVo vo = new CinemaVo();
					
					vo.setC_idx(rs.getInt("c_idx"));
					vo.setC_name(rs.getString("c_name"));
					vo.setC_location(rs.getString("c_location"));

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
