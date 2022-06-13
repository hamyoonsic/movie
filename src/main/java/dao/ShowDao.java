package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import service.DBService;
import vo.ShowVo;

public class ShowDao {
		
	
	//single-ton : ��ü 1���� �����ؼ� �������
	static ShowDao single = null;

	public static ShowDao getInstance() {

		//��ü�� ������ �����ض�
		if (single == null)
			single = new ShowDao();

		return single;
	}

	//�ܺο��� �������� ����
	private ShowDao() {
		// TODO Auto-generated constructor stub
	}
	
	public List<ShowVo> selectList(int m_idx) {

		List<ShowVo> list = new ArrayList<ShowVo>();

		
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql = "select * from show where m_idx=?";

		try {
			//1.Connection������
			conn = DBService.getInstance().getConnection();

			//2.PreparedStatment������
			pstmt = conn.prepareStatement(sql);
			
			pstmt.setInt(1, m_idx);

			//3.ResultSet������
			rs = pstmt.executeQuery();

			//4.����(record->Vo->list)
			while (rs.next()) {
				//rs�� ����Ű�� ��(���ڵ�)�� ���� �о�´�

				//Vo�� ����
				ShowVo vo = new ShowVo();
				
				vo.setM_idx(m_idx);
				vo.setC_idx(rs.getInt("c_idx"));
				vo.setT_idx(rs.getInt("t_idx"));
				vo.setS_idx(rs.getInt("s_idx"));

				
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
