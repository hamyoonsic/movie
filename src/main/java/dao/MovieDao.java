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
	
		//single-ton : ��ü 1���� �����ؼ� �������
		static MovieDao single = null;

		public static MovieDao getInstance() {

			//��ü�� ������ �����ض�
			if (single == null)
				single = new MovieDao();

			return single;
		}

		//�ܺο��� �������� ����
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
					MovieVo vo = new MovieVo();
					
					vo.setM_idx(rs.getInt("m_idx"));
					vo.setM_name(rs.getString("m_name"));
					vo.setM_rate(rs.getString("m_rate"));
					vo.setM_release(rs.getString("m_release"));
					vo.setM_r_time(rs.getString("m_r_time"));
					vo.setM_age(rs.getString("m_age"));
					
					

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
