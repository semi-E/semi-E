package lms.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.HashMap;

public class StudentAssignmentDAO {

	//제출 과제 상세보기
	//파라미터 : int assignmentNo, int studentNo
	//반환 값 : HashMap<String, Object>
	//사용 페이지 : /student/classBoard/myClassAssignmentOne.jsp
	public static HashMap<String, Object> selectStudentAssignment(int assignmentNo, int studentNo) throws Exception{
		HashMap<String, Object> map = new HashMap<String, Object>();
		String sql = null;
		sql = "SELECT title, content, update_date updateDate,create_date createDate "
				+ "FROM student_assignment "
				+ "WHERE assignment_no = ? AND student_no = ? ";
		Connection conn = DBHelper.getConnection();
		PreparedStatement stmt = conn.prepareStatement(sql);
		stmt.setInt(1, assignmentNo);
		stmt.setInt(2, studentNo);
		System.out.println(stmt);
		ResultSet rs = stmt.executeQuery();
		
		if(rs.next()) {
			map.put("title", rs.getString("title"));
			map.put("content", rs.getString("content"));
			map.put("updateDate", rs.getString("updateDate"));
			map.put("createDate", rs.getString("createDate"));
		}
		
		return map;
	}
	
	public static void main(String[] args) {
		// TODO Auto-generated method stub

	}

}