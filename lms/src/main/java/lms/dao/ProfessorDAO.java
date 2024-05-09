package lms.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.HashMap;

public class ProfessorDAO {
	
	// 교수 리스트
	// 파라미터 : int professorNo, String department, String name, int startRow, int rowPerPage
	// 반환 값 : ArrayList<HashMap<String, Object>>
	// 사용 페이지 : /admin/professor/professorList.jsp
	public static ArrayList<HashMap<String, Object>> selectProfessorList(int professorNo, String department, String name, int startRow, int rowPerPage) throws Exception{
		ArrayList<HashMap<String, Object>> list = new ArrayList<HashMap<String,Object>>();
		String sql = null;
		Connection conn = DBHelper.getConnection();
		PreparedStatement stmt = null;
		if(professorNo != 0) {
			sql = "SELECT professor_no professorNo, name, department, state "
					+ "FROM professor "
					+ "WHERE professor_no LIKE '%" + professorNo +"%' AND name LIKE ? AND department LIKE ? "
					+ "LIMIT ?, ? ";
			stmt = conn.prepareStatement(sql);
			stmt.setString(1, "%" + department + "%");
			stmt.setString(2, "%" + name + "%");
			stmt.setInt(3, startRow);
			stmt.setInt(4, rowPerPage);
		} else {
			sql = "SELECT professor_no professorNo, name, department, state "
					+ "FROM professor "
					+ "WHERE name LIKE ? AND department LIKE ? "
					+ "LIMIT ?, ?";
			stmt = conn.prepareStatement(sql);
			stmt.setString(1, "%" + name + "%");
			stmt.setString(2, "%" + department + "%");
			stmt.setInt(3, startRow);
			stmt.setInt(4, rowPerPage);
		}
		//디버깅
		System.out.println(stmt);
		ResultSet rs = stmt.executeQuery();
		
		
		while(rs.next()) {
			HashMap<String, Object> m = new HashMap<String, Object>();
			m.put("professorNo", rs.getInt("professorNo"));
			m.put("department", rs.getString("department"));
			m.put("name", rs.getString("name"));
			m.put("state", rs.getString("state"));
			
			list.add(m);
		}
		return list;
	}
	
	public static void main(String[] args) throws Exception {
		//디버깅
		System.out.println(selectProfessorList(0, "", "", 0, 5));
	}
}
