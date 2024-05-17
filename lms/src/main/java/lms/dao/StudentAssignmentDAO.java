package lms.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.HashMap;

public class StudentAssignmentDAO {
	// 제출 과제 상태 수정
	// 파라미터 : int assignmentNo, String state, int studentNo
	// 반환 값 : int
	// 사용페이지 : /lms/professor/classBoard/updatesubmitAssignmentAction.jsp 
	public static int updatesubmitAssignment(int assignmentNo, String state, int studentNo) throws Exception {
		int row = 0;
		
		String sql1 = "UPDATE student_assignment SET state = ? \n"
				+ "WHERE assignment_no = ? AND student_no = ?";

		Connection conn = DBHelper.getConnection();
		PreparedStatement stmt1 = conn.prepareStatement(sql1);
		stmt1.setString(1, state);
		stmt1.setInt(2, assignmentNo);
		stmt1.setInt(3, studentNo);
		System.out.println(stmt1);
		row = stmt1.executeUpdate();
		
		return row;
	}
	
	// 제출 과제 리스트
	// 파라미터 : int classApplyNo, int assignmentNo
	// 반환 값 : ArrayList<HashMap<String, Object>>
	// 사용 페이지 :/lms/professor/classBoard/submitAssignmentList.jsp 
	public static ArrayList<HashMap<String, Object>>selectStudentAssignmentList(int classApplyNo, int assignmentNo) throws Exception {
	
		
		Connection conn = DBHelper.getConnection();
		String sql = "SELECT title, file, content, update_date updateDate,create_date createDate,student_no studentNo\n"
				+ "				FROM student_assignment \n"
				+ "				WHERE assignment_no = ? AND class_apply_no = ? ";
		
		PreparedStatement stmt = conn.prepareStatement(sql);
		stmt.setInt(1,assignmentNo);
		stmt.setInt(2,classApplyNo);
		
		
		System.out.println(stmt);
		    
		ResultSet rs1 = stmt.executeQuery();
		
		 ArrayList<HashMap<String, Object>> list = new ArrayList<HashMap<String,Object>>();
		
		while(rs1.next()) {
		 HashMap<String, Object> m = new HashMap<String, Object>();
	     m.put("title", rs1.getString("title"));
	     m.put("updateDate", rs1.getString("updateDate"));
	     m.put("createDate", rs1.getString("createDate"));
	     m.put("studentNo", rs1.getString("studentNo"));
	     
	     list.add(m);
		}	 
		return list;
	}
	

	//제출 과제 상세보기
	//파라미터 : int assignmentNo, int studentNo
	//반환 값 : HashMap<String, Object>
	//사용 페이지 : /student/classBoard/myClassAssignmentOne.jsp
	public static HashMap<String, Object> selectStudentAssignment(int assignmentNo, int studentNo) throws Exception{
		HashMap<String, Object> map = null;
		String sql = null;
		sql = "SELECT title, file, content, update_date updateDate,create_date createDate, state "
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
			map.put("state", rs.getString("state"));
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
