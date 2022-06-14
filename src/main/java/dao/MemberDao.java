package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import service.DBService;
import vo.MemberVo;

public class MemberDao {

	
	//single-ton : 객체 1개만 생성해서 사용하자!
	//스태틱객체는 무조건 하나만 만들어진다.
	static MemberDao single = null;

	//스태틱은 무조건 스태틱으로만
	public static MemberDao getInstance() {

		//객체가 없으면 생성해라 호출된 한번만 객체를 생성
		if (single == null)
			single = new MemberDao();

		return single;
	}

	//외부에서 객체를 생성하지 못하게 막음
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
   			//1.Connection얻어오기(dbcp에 들어가 있는것을 가져오는 것, 연결되어있는 커넥션 가져오기)
   			conn = DBService.getInstance().getConnection();
   			
   			//2.PreparedStatment얻어오기//명령처리 객체 생성    sql처리 객체 
   			pstmt = conn.prepareStatement(sql);
   			
   			//3.pstmt셋팅// 데이터 베이스는 제로 베이스 아님
   			pstmt.setString(1, mem_id);
   			
   			
   			//4.ResultSet얻어오기//추가,삭제 및 등 
   			rs = pstmt.executeQuery();
   			
   			//5.포장(record->Vo)
   			if (rs.next()) {
   				//rs가 가리키는 행(레코드)의 값을 읽어온다
   				
   				//Vo로 포장
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
   		
   		return vo;
   	}

public int insert(MemberVo vo) { // 호출한 사용자가 전달한 값
	// TODO Auto-generated method stub
	
	int res = 0;
	
	Connection		   conn  = null;
	PreparedStatement  pstmt = null;
	
	
	String sql = "insert into member values(seq_member_mem_idx.nextVal,?,?,?,?,?,?,?,sysdate)";
	
	
	try {
		//1.Connection 얻어오기
		conn = DBService.getInstance().getConnection();
		
		//2.PreparedStatement 얻어오기
		pstmt = conn.prepareStatement(sql); // 캐싱
		
		//3.pstmt의 변수처리된 parameter 설정과정
		pstmt.setString(1, vo.getMem_name());
		pstmt.setString(2, vo.getMem_id());
		pstmt.setString(3, vo.getMem_pwd());
		pstmt.setString(4, vo.getMem_zipcode());
		pstmt.setString(5, vo.getMem_addr());
		pstmt.setString(6, vo.getMem_grade());
		pstmt.setString(7, vo.getMem_ip());
	
		
		//4.DML(insert/update/delete)명령 실행, res는 처리된 행수를반환
		res = pstmt.executeUpdate();
		
		
		
	} catch (Exception e) {
		// TODO: handle exception
		e.printStackTrace();
		
	}finally {
		
		try {
			//닫기 (열린 역순)
			if(pstmt != null) pstmt.close(); // 2
			if(conn != null) conn.close();   // 1
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}	
	}
	
	//리턴을 0으로 받으면 명령 실패!
	return res;
}
	
	
	
	
	
	
	
}
