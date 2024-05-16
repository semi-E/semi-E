package lms.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.HashMap;

public class AssignmentDAO {
	// 과제 수정
	// 파라미터 : int classApplyNo, String title, String content, String endDate
	// 반환 값 : int
	// 사용 페이지 : /lms/professor/classBoard/updateAssignmentAction.jsp 
	public static int updateAssignment(int classApplyNo, String title, String content, String endDate,int assignmentNo ) throws Exception {
		int row = 0;
		
		Connection conn = DBHelper.getConnection();
		
		String sql1 ="UPDATE assignment SET "
				+ "class_Apply_no = ?"
				+ ",title = ?"
				+ ",content = ?"
				+ ", end_date = ?\n"
				+ "WHERE assignment_no = ?";
		
		PreparedStatement stmt1 = conn.prepareStatement(sql1);
		stmt1.setInt(1, classApplyNo);
		stmt1.setString(2, title);
		stmt1.setString(3, content);
		stmt1.setString(4, endDate);
		stmt1.setInt(5, assignmentNo);
		System.out.println(stmt1);
		
		
		row = stmt1.executeUpdate();
		
		return row;
	}
	
	
	
	
	
	
	
	// 과제 추가
	// 파라미터 : int classApplyNo, String title, String content, String endDate
	// 반환 값 : int
	// 사용 페이지 : /lms/professor/classBoard/addAssignmentAction.jsp 
	public static int insertAssignment (int classApplyNo, String title, String content, String endDate) throws Exception {
		int row = 0;
		
		Connection conn = DBHelper.getConnection();
		
		String sql1 ="INSERT INTO assignment (class_Apply_no,title,content,end_date) VALUES (?,?,?,?)";
		
		PreparedStatement stmt1 = conn.prepareStatement(sql1);
		stmt1.setInt(1, classApplyNo);
		stmt1.setString(2, title);
		stmt1.setString(3, content);
		stmt1.setString(4, endDate);
		System.out.println(stmt1);
			
		row = stmt1.executeUpdate();
					
		return row;
	}
	
	
	
	//과제 목록
	//파라미터 : int classApplyNo, int startRow, int rowPerPage
	//반환 값 : ArrayList<HashMap<String, Object>>
	//사용 페이지 : /student/classBoard/myClassAssignmentList.jsp
	// /professor/classBoard/assignmentList.jsp
	public static ArrayList<HashMap<String, Object>> selectAssignmentList(int classApplyNo,int startRow, int rowPerPage) throws Exception{
		ArrayList<HashMap<String, Object>> list = new ArrayList<HashMap<String,Object>>();
		String sql = null;
		sql = "SELECT assignment_no assignmentNo, title title, end_date endDate, create_date createDate \n"
				+ "FROM assignment \n"
				+ "WHERE class_apply_no = ? \n"
				+ "LIMIT ?, ?;";
		Connection conn = DBHelper.getConnection();
		PreparedStatement stmt = conn.prepareStatement(sql);
		stmt.setInt(1, classApplyNo);
		stmt.setInt(2, startRow);
		stmt.setInt(3, rowPerPage);
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
	//파라미터 : int assignmentNo
	//반환 값 : HashMap<String, Object>
	//사용 페이지 : /student/classBoard/myClassAssignmentOne.jsp
	// /professor/classBoard/assignmentList.jsp
	public static HashMap<String, Object> selectAssignment(int assignmentNo) throws Exception{
		HashMap<String, Object> map = new HashMap<String, Object>();
		String sql = null;
		sql = "SELECT class_apply_no classApplyNo, title title, content content, end_date endDate, create_date createDate "
				+ "FROM assignment "
				+ "WHERE assignment_no = ?";
		Connection conn = DBHelper.getConnection();
		PreparedStatement stmt = conn.prepareStatement(sql);
		stmt.setInt(1, assignmentNo);
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
		System.out.println(AssignmentDAO.selectAssignment(2));
	}

}
