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
import vo.TheaterVo;
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
		String sql = "select distinct c_idx,c_name from show_cinema_view where m_idx=?";
				 

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

	public List<TheaterVo> select_Theater_List(int m_idx,int c_idx) {

		List<TheaterVo> list = new ArrayList<TheaterVo>();

		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql = "select distinct t_idx,t_name,t_seat from show_theater_view where m_idx=? and c_idx=?";

		try {
			//1.Connection������
			conn = DBService.getInstance().getConnection();

			//2.PreparedStatment������
			pstmt = conn.prepareStatement(sql);
			
			pstmt.setInt(1, m_idx);
			pstmt.setInt(2, c_idx);
			

			//3.ResultSet������
			rs = pstmt.executeQuery();

			//4.����(record->Vo->list)
			while (rs.next()) {
				//rs�� ����Ű�� ��(���ڵ�)�� ���� �о�´�

				//Vo�� ����
				TheaterVo vo = new TheaterVo();
				
				vo.setT_idx(rs.getInt("t_idx"));
				vo.setT_name(rs.getString("t_name"));
				vo.setT_seat(rs.getString("t_seat"));
				
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
