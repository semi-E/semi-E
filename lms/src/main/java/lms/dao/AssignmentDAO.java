package lms.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.HashMap;

public class AssignmentDAO {
	
	//과제 목록
	//파라미터 : int classApplyNo, int studentNo, int startRow, int rowPerPage
	//반환 값 : ArrayList<HashMap<String, Object>>
	//사용 페이지 : /student/classBoard/myClassAssignmentList.jsp
	public static ArrayList<HashMap<String, Object>> selectAssignmentList(int classApplyNo, int studentNo,
			int startRow, int rowPerPage) throws Exception{
		ArrayList<HashMap<String, Object>> list = new ArrayList<HashMap<String,Object>>();
		String sql = null;
		sql = "SELECT a.assignment_no assignmentNo, a.title title, a.end_date endDate, a.create_date createDate "
				+ "FROM assignment a, my_class m "
				+ "WHERE a.class_apply_no = m.class_apply_no AND a.class_apply_no = ? AND m.student_no = ? "
				+ "LIMIT ?, ?";
		Connection conn = DBHelper.getConnection();
		PreparedStatement stmt = conn.prepareStatement(sql);
		stmt.setInt(1, classApplyNo);
		stmt.setInt(2, studentNo);
		stmt.setInt(3, startRow);
		stmt.setInt(4, rowPerPage);
		System.out.println(stmt);
		ResultSet rs = stmt.executeQuery();
		
		while(rs.next()) {
			HashMap<String, Object> m = new HashMap<String, Object>();
			m.put("assignmentNo", rs.getInt("assignmentNo"));
			m.put("title", rs.getString("title"));
			m.put("endDate", rs.getString("endDate"));
			m.put("createDate", rs.getString("createDate"));
			
			list.add(m);
		}
		
		
		return list;
	}
	
	//과제 개수 카운트
	//파라미터 : int classApplyNo
	//반환 값 : int
	//사용 페이지 : /student/classBoard/myClassAssignmentList.jsp
	public static int selectAssignmentCount(int classApplyNo) throws Exception{
		int cnt = 0;
		String sql = null;
		sql = "SELECT COUNT(*) cnt "
				+ "FROM assignment "
				+ "WHERE class_apply_no = ? ";
		Connection conn = DBHelper.getConnection();
		PreparedStatement stmt = conn.prepareStatement(sql);
		stmt.setInt(1, classApplyNo);
		System.out.println(stmt);
		ResultSet rs = stmt.executeQuery();
		
		if(rs.next()) {
			cnt = rs.getInt("cnt");
		}
		
		return cnt;
	}
	
	//과제 상세보기
	//파라미터 : int assignmentNo, int studentNo
	//반환 값 : HashMap<String, Object>
	//사용 페이지 : /student/classBoard/myClassAssignmentOne.jsp
	public static HashMap<String, Object> selectAssignment(int assignmentNo, int studentNo) throws Exception{
		HashMap<String, Object> map = new HashMap<String, Object>();
		String sql = null;
		sql = "SELECT a.class_apply_no classApplyNo, a.title title, a.content content, a.end_date endDate, a.create_date createDate "
				+ "FROM assignment a, my_class m "
				+ "WHERE a.class_apply_no = m.class_apply_no AND a.assignment_no = ? AND m.student_no = ? ";
		Connection conn = DBHelper.getConnection();
		PreparedStatement stmt = conn.prepareStatement(sql);
		stmt.setInt(1, assignmentNo);
		stmt.setInt(2, studentNo);
		System.out.println(stmt);
		ResultSet rs = stmt.executeQuery();
		
		if(rs.next()) {
			map.put("classApplyNo", rs.getInt("classApplyNo"));
			map.put("title", rs.getString("title"));
			map.put("content", rs.getString("content"));
			map.put("endDate", rs.getString("endDate"));
			map.put("createDate", rs.getString("createDate"));
		}
		
		return map;
	}
	
	public static void main(String[] args) throws Exception {
		//디버깅
		//System.out.println(AssignmentDAO.selectAssignmentList(2, 0, 10));
		//System.out.println(AssignmentDAO.selectAssignmentCount(2));
		System.out.println(AssignmentDAO.selectAssignment(2, 20240103));
	}

}
