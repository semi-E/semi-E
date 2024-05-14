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
		HashMap<String, Object> map = null;
		String sql = null;
		sql = "SELECT title, file, content, update_date updateDate,create_date createDate "
				+ "FROM student_assignment "
				+ "WHERE assignment_no = ? AND student_no = ? ";
		Connection conn = DBHelper.getConnection();
		PreparedStatement stmt = conn.prepareStatement(sql);
		stmt.setInt(1, assignmentNo);
		stmt.setInt(2, studentNo);
		System.out.println(stmt);
		ResultSet rs = stmt.executeQuery();
		
		if(rs.next()) {
			map =  new HashMap<String, Object>();
			map.put("title", rs.getString("title"));
			map.put("file", rs.getString("file"));
			map.put("content", rs.getString("content"));
			map.put("updateDate", rs.getString("updateDate"));
			map.put("createDate", rs.getString("createDate"));
		}
		
		return map;
	}
	
	//과제 제출
	//파라미터 : int assignmentNo, int studentNo, int classApplyNo, String title, String content, String file
	//반환 값 : int
	//사용 페이지 : /student/classBoard/submitMyClassAssignmentAction.jsp
	public static int insertStudentAssignment(int assignmentNo, int studentNo, int classApplyNo, String title, String content, String file) throws Exception {
		int row = 0;
		
		String sql = null;
		sql = "INSERT INTO student_assignment "
				+ "(assignment_no, student_no, class_apply_no, title, content, file) "
				+ "VALUES (?, ?, ?, ?, ?, ?)";
		Connection conn = DBHelper.getConnection();
		PreparedStatement stmt = conn.prepareStatement(sql);
		stmt.setInt(1, assignmentNo);
		stmt.setInt(2, studentNo);
		stmt.setInt(3, classApplyNo);
		stmt.setString(4, title);
		stmt.setString(5, content);
		stmt.setString(6, file);
		System.out.println(stmt);
		row = stmt.executeUpdate();
		
		return row;
	}
	
	//과제 수정
	//파라미터 : int assignmentNo, int studentNo, String title, String content, String file
	//반환 값 : int
	//사용 페이지 : /student/classBoard/updateMyClassAssignmentAction.jsp
	public static int updateStudentAssignment(int assignmentNo, int studentNo, String title, String content, String file) throws Exception {
		int row = 0;
		
		String sql = null;
		Connection conn = DBHelper.getConnection();
		PreparedStatement stmt = null;
		if(file == null) {
			sql = "UPDATE student_assignment "
					+ "SET title = ?, content = ? "
					+ "WHERE assignment_no = ? AND student_no = ?";
			stmt = conn.prepareStatement(sql);
			stmt.setString(1, title);
			stmt.setString(2, content);
			stmt.setInt(3, assignmentNo);
			stmt.setInt(4, studentNo);	
		} else {
			sql = "UPDATE student_assignment "
					+ "SET title = ?, content = ?, file = ? "
					+ "WHERE assignment_no = ? AND student_no = ?";
			stmt = conn.prepareStatement(sql);
			stmt.setString(1, title);
			stmt.setString(2, content);
			stmt.setString(3, file);
			stmt.setInt(4, assignmentNo);
			stmt.setInt(5, studentNo);
		}
		System.out.println(stmt);
		
		row = stmt.executeUpdate();
		
		return row;
	}
		
	public static void main(String[] args) {
		// TODO Auto-generated method stub

	}

}
