package lms.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
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
		
		System.out.println("empLoginAction stmt -->"+stmt);
		rs = stmt.executeQuery();
		
		
		HashMap<String, Object> resultMap = null;
		if(rs.next()) {
			resultMap = new HashMap<String, Object>();
			resultMap.put("empId", rs.getString("empId"));
			resultMap.put("empName", rs.getString("empName"));
			resultMap.put("grade", rs.getInt("grade"));
		}
		
		conn.close();
		return list;
	}
	
	// 관리자 추가
	// 파라미터 : int adminNo, String grade, String name
	// 반환 값 : int
	// 사용 페이지 : /lms/admin/admins/addAdminAction.jsp 
	public static int insertAdmin(  int adminNo,
									String grade,
									String name ) throws Exception {
		int row = 0;
		
		String sql = "INSERT INTO admin"
				+ " (admin_no, NAME, grade)"
				+ " VAlUES (?, ?, ?)";
		
		Connection conn = DBHelper.getConnection();
		PreparedStatement stmt = null; 	
		stmt = conn.prepareStatement(sql);
		stmt.setInt(1, adminNo);
		stmt.setString(2, grade);
		stmt.setString(3, name);
		
		row = stmt.executeUpdate();
		
		return row;
		
	}
	
	// 관리자 삭제
	// 파라미터 : int adminNo
	// 반환 값 : int
	// 사용 페이지 : /lms/admin/admins/deleteAdminAction.jsp
	public static int deleteAdmin( int adminNo ) throws Exception {
		int row = 0;
		
		String sql = "DELETE FROM admin"
				+ " WHERE admin_no= ?" ;
		Connection conn = DBHelper.getConnection();
		PreparedStatement stmt = null; 	
		stmt = conn.prepareStatement(sql);
		stmt.setInt(1, adminNo);
		row = stmt.executeUpdate();
		
		return row;
	}

	
	//디버깅 용
	public static void main(String[] args) {
		// TODO Auto-generated method stub
		
	}

}
