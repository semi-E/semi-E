package lms.dao;

import java.sql.*;
import java.util.*;

public class AdminDAO {
	

	// 관리자 리스트
	// 파라미터 : X
	// 반환 값 : ArrayList<HashMap<String, Object>>
	// 사용 페이지 : /lms/admin/admins/adminList.jsp
	public static ArrayList<HashMap<String, Object>> selectAdminList () throws Exception{
		ArrayList<HashMap<String, Object>> list = new ArrayList<HashMap<String, Object>>();
		
		// DB 접근
		Connection conn = DBHelper.getConnection();
		
		String sql = "SELECT * FROM admin";
		PreparedStatement stmt = null; 	
		ResultSet rs = null;
		stmt=conn.prepareStatement(sql);
		
		//디버깅
		System.out.println(stmt+" <-- selectAdminList stmt");
		
		rs = stmt.executeQuery();
		
		
		HashMap<String, Object> resultMap = null;
		while(rs.next()) {
			resultMap = new HashMap<String, Object>();
			resultMap.put("admin_no", rs.getString("admin_no"));
			resultMap.put("name", rs.getString("name"));
			resultMap.put("gender", rs.getString("gender"));
			resultMap.put("birthday", rs.getString("birthday"));
			resultMap.put("phone", rs.getString("phone"));
			resultMap.put("address", rs.getString("address"));
			resultMap.put("email", rs.getString("email"));
			resultMap.put("grade", rs.getString("grade"));
			list.add(resultMap);
		}
		
		conn.close();
		return list;
	}
	
	// 관리자 추가
	// 파라미터 : int adminNo, String grade, String name
	// 반환 값 : int
	// 사용 페이지 : /lms/admin/admins/addAdminAction.jsp 
	public static int insertAdmin(  int adminNo,
									String name,
									String grade) throws Exception {
		int row = 0;
		
		String sql = "INSERT INTO admin "
				+ "(admin_no, NAME, grade) "
				+ "VAlUES (?, ?, ?) ";
		
		Connection conn = DBHelper.getConnection();
		PreparedStatement stmt = null; 	
		stmt = conn.prepareStatement(sql);
		
		
		stmt.setInt(1, adminNo);
		stmt.setString(2, name);
		stmt.setString(3, grade);
		//디버깅
		System.out.println(stmt+" <-- insertAdmin stmt");
		
		row = stmt.executeUpdate();
		
		//DB자원 반납
		conn.close();
		return row;
		
	}
	
	// 관리자 삭제
	// 파라미터 : int adminNo
	// 반환 값 : int
	// 사용 페이지 : /lms/admin/admins/deleteAdminAction.jsp
	public static int deleteAdmin( int adminNo ) throws Exception {
		int row = 0;
		
		String sql = "DELETE FROM admin "
				+ "WHERE admin_no= ?" ;
		Connection conn = DBHelper.getConnection();
		PreparedStatement stmt = null; 	
		stmt = conn.prepareStatement(sql);
		
		//디버깅
		System.out.println(stmt+" <-- deleteAdmin stmt");
		
		stmt.setInt(1, adminNo);
		row = stmt.executeUpdate();
		
		//DB자원 반납
		conn.close();
		return row;
	}

	//관리자 로그인
	//파라미터 : int id, String pw
	//반환값:HashMap<String, Object>
	//사용 페이지 :/lms/loginAction.jsp
	public static HashMap<String, Object>selectAdmin(int id , String pw)throws Exception{
		HashMap<String, Object>resultMap=null;
		//DB접근
		Class.forName("org.mariadb.jdbc.Driver");
		Connection conn = DBHelper.getConnection();

		
		String sql = "SELECT admin_pw_history.admin_no , admin_pw_history.pw ,grade, name "
				+"FROM admin,admin_pw_history "
				+"WHERE admin.admin_no = admin_pw_history.admin_no AND admin_pw_history.admin_no= ? "
				+"AND (select pw FROM admin_pw_history WHERE admin_no = ? "
				+"ORDER BY create_date DESC LIMIT 1)= ? ORDER BY create_date DESC LIMIT 1";
		PreparedStatement stmt = conn.prepareStatement(sql);
		
		//디버깅
		System.out.println(stmt+" <-- loginAdmin stmt");
		
		stmt.setInt(1, id);
		stmt.setInt(2, id);
		stmt.setString(3,pw);
		
		ResultSet rs=stmt.executeQuery();
		
		if(rs.next()) {
			
			resultMap = new HashMap<String,Object>();
			resultMap.put("adminNo",rs.getInt("admin_no"));
			resultMap.put("grade",rs.getString("grade"));
			resultMap.put("name",rs.getString("name"));
			
			//디버깅
			System.out.println(rs.getInt("admin_no"));
			System.out.println(rs.getString("grade"));
		}
		//DB자원 반납
		conn.close();
		return resultMap;
		}
	
		// 마이페이지 정보 변경
		// 파라미터 : String email, int phone, String address, String gender, String birthday
		// 반환 값 : int
		// 사용 페이지 : /lms/admin/updateMyPageAction.jsp
		public static int updateAdmin(  int adminNo,
										String email,
										String phone,
										String address,
										String gender,
										String birthday ) throws Exception {
			int row = 0;
			
			String sql = "UPDATE admin SET "
					+ "email = ?, "
					+ "phone = ?, "
					+ "address = ?, "
					+ "gender = ?, "
					+ "birthday = ? "
					+ "WHERE admin_no = ?";
			
			
			Connection conn = DBHelper.getConnection();
			PreparedStatement stmt = null; 	
			stmt = conn.prepareStatement(sql);
			
			//디버깅
			System.out.println(stmt+" <-- updateAdmin stmt");
			
			stmt.setString(1, email);
			stmt.setString(2, phone);
			stmt.setString(3, address);
			stmt.setString(4, gender);
			stmt.setString(5, birthday);
			stmt.setInt(6, adminNo);
			
			row = stmt.executeUpdate();
			
			//DB자원 반납
			conn.close();
			return row;
		}
		
		
		//관리자 상세보기
		//파라미터 : int adminNo
		//반환 값 : HashMap<String, Object>
		//사용 페이지 : /lms/admin/myPage.jsp
		public static HashMap<String, Object> selectAdmin(int adminNo) throws Exception{
			HashMap<String, Object> map = new HashMap<String, Object>();
			String sql = null;
			sql = "SELECT admin_no adminNo, name, gender, birthday, phone, address, email, grade "
					+ "FROM admin "
					+ "WHERE admin_no = ? ";
			Connection conn = DBHelper.getConnection();
			PreparedStatement stmt = conn.prepareStatement(sql);
			stmt.setInt(1, adminNo);
			System.out.println(stmt);
			ResultSet rs = stmt.executeQuery();
			if(rs.next()) {
				map.put("adminNo", rs.getInt("adminNo"));
				map.put("name", rs.getString("name"));
				map.put("gender", rs.getString("gender"));
				map.put("birthday", rs.getString("birthday"));
				map.put("phone", rs.getString("phone"));
				map.put("address", rs.getString("address"));
				map.put("email", rs.getString("email"));
				map.put("grade", rs.getString("grade"));
			}
			
			return map;
		}
		
		
		
		
		//디버깅 용
		public static void main(String[] args) {
			// TODO Auto-generated method stub
			
		}
		
		
		
		
		
	
}
