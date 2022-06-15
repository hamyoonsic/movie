package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import service.DBService;
import vo.CinemaVo;
import vo.ShowVo;
import vo.CinemaVo;

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
	
	public List<CinemaVo> select_Cinema_List(int m_idx) {
		

		List<CinemaVo> list = new ArrayList<CinemaVo>();

		
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql = "select distinct show_cinema_view.m_idx, cinema.c_idx,cinema.c_name,cinema.c_location from show_cinema_view left outer join cinema on show_cinema_view.c_idx=cinema.c_idx where show_cinema_view.m_idx=? order by c_idx"; 

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

				CinemaVo vo	=	new CinemaVo();
				
				vo.setC_idx(rs.getInt("c_idx"));
				vo.setC_name(rs.getString("c_name"));
				vo.setC_location(rs.getString("c_location"));

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
