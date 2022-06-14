package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import service.DBService;
import vo.MemberVo;

public class MemberDao {

	
	//single-ton : ��ü 1���� �����ؼ� �������!
	//����ƽ��ü�� ������ �ϳ��� ���������.
	static MemberDao single = null;

	//����ƽ�� ������ ����ƽ���θ�
	public static MemberDao getInstance() {

		//��ü�� ������ �����ض� ȣ��� �ѹ��� ��ü�� ����
		if (single == null)
			single = new MemberDao();

		return single;
	}

	//�ܺο��� ��ü�� �������� ���ϰ� ����
	private MemberDao() {
		// TODO Auto-generated constructor stub
	}
	
	
public MemberVo selectOne(String mem_id) {
   		
   		MemberVo vo = null;
   		Connection conn = null;
   		PreparedStatement pstmt = null;
   		ResultSet rs = null;
   		
   		//											   1<-parameter index 
   		String sql = "select * from member where mem_id=?";
   		
   		try {
   			//1.Connection������(dbcp�� �� �ִ°��� �������� ��, ����Ǿ��ִ� Ŀ�ؼ� ��������)
   			conn = DBService.getInstance().getConnection();
   			
   			//2.PreparedStatment������//���ó�� ��ü ����    sqló�� ��ü 
   			pstmt = conn.prepareStatement(sql);
   			
   			//3.pstmt����// ������ ���̽��� ���� ���̽� �ƴ�
   			pstmt.setString(1, mem_id);
   			
   			
   			//4.ResultSet������//�߰�,���� �� �� 
   			rs = pstmt.executeQuery();
   			
   			//5.����(record->Vo)
   			if (rs.next()) {
   				//rs�� ����Ű�� ��(���ڵ�)�� ���� �о�´�
   				
   				//Vo�� ����
   				vo = new MemberVo();
   				
   				vo.setMem_idx(rs.getInt("mem_idx"));
   				vo.setMem_name(rs.getString("mem_name"));
   				vo.setMem_id(rs.getString("mem_id"));
   				vo.setMem_pwd(rs.getString("mem_pwd"));
   				vo.setMem_zipcode(rs.getString("mem_zipcode"));
   				vo.setMem_addr(rs.getString("mem_addr"));
   				vo.setMem_grade(rs.getString("mem_grade"));
   				vo.setMem_ip(rs.getString("mem_ip"));
   				vo.setMem_regdate(rs.getString("mem_regdate"));
   				
   				
   				
   				
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
   		
   		return vo;
   	}

public int insert(MemberVo vo) { // ȣ���� ����ڰ� ������ ��
	// TODO Auto-generated method stub
	
	int res = 0;
	
	Connection		   conn  = null;
	PreparedStatement  pstmt = null;
	
	
	String sql = "insert into member values(seq_member_mem_idx.nextVal,?,?,?,?,?,?,?,sysdate)";
	
	
	try {
		//1.Connection ������
		conn = DBService.getInstance().getConnection();
		
		//2.PreparedStatement ������
		pstmt = conn.prepareStatement(sql); // ĳ��
		
		//3.pstmt�� ����ó���� parameter ��������
		pstmt.setString(1, vo.getMem_name());
		pstmt.setString(2, vo.getMem_id());
		pstmt.setString(3, vo.getMem_pwd());
		pstmt.setString(4, vo.getMem_zipcode());
		pstmt.setString(5, vo.getMem_addr());
		pstmt.setString(6, vo.getMem_grade());
		pstmt.setString(7, vo.getMem_ip());
	
		
		//4.DML(insert/update/delete)��� ����, res�� ó���� �������ȯ
		res = pstmt.executeUpdate();
		
		
		
	} catch (Exception e) {
		// TODO: handle exception
		e.printStackTrace();
		
	}finally {
		
		try {
			//�ݱ� (���� ����)
			if(pstmt != null) pstmt.close(); // 2
			if(conn != null) conn.close();   // 1
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}	
	}
	
	//������ 0���� ������ ��� ����!
	return res;
}
	
	
	
	
	
	
	
}
