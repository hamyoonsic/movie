package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import service.DBService;
import vo.TicketVo;

public class TicketDao {
	//single-ton : ��ü 1���� �����ؼ� �������
	static TicketDao single = null;

	public static TicketDao getInstance() {

		//��ü�� ������ �����ض�
		if (single == null)
			single = new TicketDao();

		return single;
	}

	//�ܺο��� �������� ����
	private TicketDao() {
		// TODO Auto-generated constructor stub
	}
	
	
	public List<TicketVo> selectList() {

		List<TicketVo> list = new ArrayList<TicketVo>();

		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql = "select * from ticket";

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
				TicketVo vo = new TicketVo();
				
				vo.setMt_idx(rs.getInt("mt_idx"));
				vo.setMt_date(rs.getString("mt_date"));
				vo.setMt_time(rs.getString("mt_time"));
				vo.setMt_price(rs.getString("mt_price"));
				vo.setMt_number(rs.getString("mt_number"));
				
				vo.setM_idx(rs.getInt("m_idx"));
				vo.setC_idx(rs.getInt("c_idx"));
				vo.setT_idx(rs.getInt("t_idx"));
				vo.setS_idx(rs.getInt("s_idx"));
				vo.setMem_idx(rs.getInt("mem_idx"));

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
