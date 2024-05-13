package lms.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.HashMap;

public class AttendanceDAO {

	//출결 목록
	//파라미터 : int classApplyNo
	//반환 값 : ArrayList<HashMap<String, Object>>
	//사용 페이지 : /professor/classBoard/attendanceList.jsp
	public static ArrayList<HashMap<String, Object>> selectAttendanceList(int classApplyNo) throws Exception{
		ArrayList<HashMap<String, Object>> list = new ArrayList<HashMap<String,Object>>();
		String sql = null;
		sql = "SELECT a.student_no studentNo, s.name name, a.class_apply_no classApplyNo, a.week week, a.state state "
				+ "FROM attendance a, student s "
				+ "WHERE a.student_no = s.student_no AND a.class_apply_no = ? "
				+ "ORDER BY name ASC, week ASC ";
		Connection conn = DBHelper.getConnection();
		PreparedStatement stmt = conn.prepareStatement(sql);
		stmt.setInt(1, classApplyNo);
		System.out.println(stmt);
		ResultSet rs = stmt.executeQuery();
		
		while(rs.next()) {
			HashMap<String, Object> m = new HashMap<String, Object>();
			m.put("studentNo", rs.getInt("studentNo"));
			m.put("name", rs.getString("name"));
			m.put("classApplyNo", rs.getInt("classApplyNo"));
			m.put("week", rs.getInt("week"));
			m.put("state", rs.getString("state"));
			list.add(m);
		}
		
		return list;
	}
	
	public static void main(String[] args) throws Exception {
		//디버깅
		System.out.println(AttendanceDAO.selectAttendanceList(2));
	}

}
