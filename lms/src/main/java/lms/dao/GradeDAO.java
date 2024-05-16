package lms.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.HashMap;

public class GradeDAO {
	
	//성적 개수 카운트
	//파라미터 :int currentPage, int studentNo, int classApplyNo, String name 
	//반환 값 : int
	//사용 페이지 : /lms/professor/classBoard/gradeList.jsp
	public static int selectGradeCount(String name) throws Exception{
		int cnt = 0;
		String sql = null;
		sql = "SELECT COUNT(*) cnt "
				+ "FROM grade g, student "
				+ "WHERE g.student_no = s.student_no "
				+ "AND s.name LIKE ? ";
		Connection conn = DBHelper.getConnection();
		PreparedStatement stmt = null;
		stmt = conn.prepareStatement(sql);
		// 검색 값이 0으로 들어왔을 때
		
		stmt.setString(1, "%" + name + "%");
		
		System.out.println(stmt);
		ResultSet rs = stmt.executeQuery();
		
		if(rs.next()) {
			cnt = rs.getInt("cnt");
		}
		
		return cnt;
	}

	
	
	
	
	//강의 목록
	//파라미터 : int studentNo, int classApplyNo, int startRow, int rowPerPage
	//반환 값 : ArrayList<HashMap<String, Object>>
	//사용 페이지 : /lms/professor/class/classList.jsp, /lms/professor/class/myClass.jsp
	public static ArrayList<HashMap<String, Object>> selectGradeList(int studentNo, String name,  int startRow, int rowPerPage) throws Exception{
		ArrayList<HashMap<String, Object>> list = new ArrayList<HashMap<String, Object>>();
		String sql = null;
		
		sql = "SELECT g.class_apply_no classApplyNo, c.class_name className,"
				+ "g.student_no studentNo, s.department department, s.name name, s.state state, g.mid_exam midExam, g.final_exam finalExam "
				+ "FROM grade g, student s, class_open_apply c "
				+ "WHERE g.student_no = s.student_no AND g.class_apply_no = c.class_apply_no "
				+ "AND s.name LIKE ? "
				+ "LIMIT ?, ?";
		
		
		Connection conn = DBHelper.getConnection();
		PreparedStatement stmt = null;
		stmt = conn.prepareStatement(sql);
		stmt.setString(1, "%" + name + "%");
		stmt.setInt(2, startRow);
		stmt.setInt(3, rowPerPage);
		System.out.println(stmt);
		ResultSet rs = stmt.executeQuery();
		
		while(rs.next()) {
			HashMap<String, Object> m = new HashMap<String, Object>();
			m.put("classApplyNo", rs.getInt("classApplyNo"));
			m.put("className", rs.getInt("className"));
			m.put("studentNo", rs.getString("studentNo"));
			m.put("department", rs.getString("department"));
			m.put("name", rs.getString("name"));
			m.put("state", rs.getString("state"));
			m.put("midExam", rs.getString("midExam"));
			m.put("finalExam", rs.getInt("finalExam"));
			
			list.add(m);
		}
		
		return list;
	}
	
	
	//전체 성적 수 카운트
	//파라미터 : int professorNo, String department, String name
	//반환 값 : int
	//사용 페이지 : admin/professor/professorList.jsp
	public static int selectGradeCount(int studentNo, String name, String className) throws Exception {
		int cnt = 0;
		String sql = null;
		Connection conn = DBHelper.getConnection();
		PreparedStatement stmt = null;
		
		sql = "SELECT c.class_apply_no classApplyNo, "
				+ "c.class_name className, "
				+ "s.student_no studentNo, "
				+ "s.name NAME, "
				+ "g.mid_exam midExam, "
				+ "g.final_exam finalExam "
				+ "FROM grade g, student s, class_open_apply c "
				+ "WHERE g.student_no = s.student_no "
				+ "AND c.class_apply_no = g.class_apply_no "
				+ "AND s.name LIKE ? "
				+ "AND s.studentno LIKE ? "
				+ "AND c.class_name LIKE ? ";
		
		stmt = conn.prepareStatement(sql);
		stmt.setString(1, "%" + name + "%");
		stmt.setInt(2, studentNo);
		stmt.setString(3, "%" + className + "%");
		//디버깅
		System.out.println(stmt);
		ResultSet rs = stmt.executeQuery();
		if(rs.next()) {
			cnt = rs.getInt("cnt");
		}
		
		return cnt;
	}
	
	
	//성적 목록
	//파라미터 : int studentNo, String name, String className, int startRow, int rowPerPage
	//반환 값 : ArrayList<HashMap<String, Object>>
	//사용 페이지 : /lms/professor/classBoard/gradeList.jsp
	public static ArrayList<HashMap<String, Object>> selectGradeList(int studentNo, String name, String className, int startRow, int rowPerPage) throws Exception{
		ArrayList<HashMap<String, Object>> list = new ArrayList<HashMap<String, Object>>();
		String sql = null;
		
		sql = "SELECT c.class_apply_no classApplyNo, "
				+ "c.class_name className, "
				+ "s.student_no studentNo, "
				+ "s.name NAME, "
				+ "g.mid_exam midExam, "
				+ "g.final_exam finalExam "
				+ "FROM grade g, student s, class_open_apply c "
				+ "WHERE g.student_no = s.student_no "
				+ "AND c.class_apply_no = g.class_apply_no "
				+ "AND s.name LIKE ? "
				+ "AND s.studentNo LIKE ? "
				+ "AND c.class_name LIKE ? "
				+ "LIMIT ?, ?";
		
		
		Connection conn = DBHelper.getConnection();
		PreparedStatement stmt = null;
		stmt = conn.prepareStatement(sql);
		
		// 검색 값이 0으로 들어왔을 때
		if(	studentNo == 0) {
			stmt.setString(1, "%%");
		} else {
			stmt.setString(1, "%" + studentNo + "%");
		}
		stmt.setString(2, "%" + name + "%");
		
		stmt.setString(3, "%" + className + "%");
		stmt.setInt(4, startRow);
		stmt.setInt(5, rowPerPage);
		System.out.println(stmt);
		ResultSet rs = stmt.executeQuery();
		
		while(rs.next()) {
			HashMap<String, Object> m = new HashMap<String, Object>();
			m.put("classApplyNo", rs.getInt("classApplyNo"));
			m.put("className", rs.getInt("className"));
			m.put("studentNo", rs.getString("studentNo"));
			m.put("department", rs.getString("department"));
			m.put("name", rs.getString("name"));
			m.put("state", rs.getString("state"));
			m.put("midExam", rs.getString("midExam"));
			m.put("finalExam", rs.getInt("finalExam"));
			
			list.add(m);
		}
		
		return list;
	}

}
