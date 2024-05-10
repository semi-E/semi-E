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
					+ "WHERE professor_no LIKE '%" + professorNo +"%' AND department LIKE ? AND name LIKE ? "
					+ "LIMIT ?, ? ";
			stmt = conn.prepareStatement(sql);
			stmt.setString(1, "%" + department + "%");
			stmt.setString(2, "%" + name + "%");
			stmt.setInt(3, startRow);
			stmt.setInt(4, rowPerPage);
		} else {
			sql = "SELECT professor_no professorNo, name, department, state "
					+ "FROM professor "
					+ "WHERE department LIKE ? AND name LIKE ? "
					+ "LIMIT ?, ?";
			stmt = conn.prepareStatement(sql);
			stmt.setString(1, "%" + department + "%");
			stmt.setString(2, "%" + name + "%");
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
	
	//교수 로그인
	//파라미터: int id, String pw
	//반환값:HashMap<String, Object>
	public static HashMap<String, Object>selectProfessor(int id , String pw)throws Exception{
		HashMap<String, Object>resultMap=null;
	//DB접근
	Class.forName("org.mariadb.jdbc.Driver");
	Connection conn = DBHelper.getConnection();

	
	String sql = "SELECT professor_pw_history.professor_no professorNo ,professor_pw_history.pw  "
				+ "FROM professor,professor_pw_history "
				+ "WHERE professor.professor_no = professor_pw_history.professor_no "
				+ "AND professor_pw_history.professor_no = ? "
				+ "AND professor_pw_history.pw = ? ";
	PreparedStatement stmt = conn.prepareStatement(sql);
	stmt.setInt(1, id);
	stmt.setString(2,pw);
	ResultSet rs=stmt.executeQuery();
	
	if(rs.next()) {
		
		resultMap = new HashMap<String,Object>();
		resultMap.put("professorNo",rs.getInt("professorNo"));
		//디버깅
		System.out.println(rs.getInt("professorNo"));
		
	}
	//DB자원 반납
	conn.close();
	return resultMap;
	}
	
	//교수 등록
	//파라미터 : int professorNo, String name, String department
	//반환 값 : int
	//사용페이지 : /admin/professor/addProfessorAction.jsp
	public static int insertProfessor(int professorNo, String name, String department) throws Exception {
		int row = 0;
		String sql = null;
		sql = "INSERT INTO professor (professor_no, name, department) VALUES(?, ?, ?)";
		Connection conn = DBHelper.getConnection();
		PreparedStatement stmt = conn.prepareStatement(sql);
		stmt.setInt(1, professorNo);
		stmt.setString(2, name);
		stmt.setString(3, department);
		System.out.println(stmt);
		row = stmt.executeUpdate();
		
		return row;
	}
	
	//교수 상세보기
	//파라미터 : int professorNo
	//반환 값 : HashMap<String, Object>
	//사용 페이지 : /admin/professor/professorOne.jsp, /professor/myPage.jsp, /professor/updateMyPageForm.jsp
	public static HashMap<String, Object> selectProfessor(int professorNo) throws Exception{
		HashMap<String, Object> map = new HashMap<String, Object>();
		String sql = null;
		sql = "SELECT professor_no professorNo, name, department, gender, birthday, phone, address, state, email, office_no officeNo "
				+ "FROM professor "
				+ "WHERE professor_no = ? ";
		Connection conn = DBHelper.getConnection();
		PreparedStatement stmt = conn.prepareStatement(sql);
		stmt.setInt(1, professorNo);
		System.out.println(stmt);
		ResultSet rs = stmt.executeQuery();
		if(rs.next()) {
			map.put("professorNo", rs.getInt("professorNo"));
			map.put("name", rs.getString("name"));
			map.put("department", rs.getString("department"));
			map.put("gender", rs.getString("gender"));
			map.put("birthday", rs.getString("birthday"));
			map.put("phone", rs.getString("phone"));
			map.put("address", rs.getString("address"));
			map.put("state", rs.getString("state"));
			map.put("email", rs.getString("email"));
			map.put("officeNo", rs.getString("officeNo"));
			
		}
		
		return map;
	}
	
	//교수 정보 수정
	//파라미터 : int professorNo, String department, String state, String officeNo
	//반환 값 : int
	//사용 페이지 : /admin/professor/updateProfessorAction.jsp
	public static int updateProfessor(int professorNo, String department, String state, String officeNo) throws Exception {
		int row = 0;
		String sql = null;
		sql = "UPDATE professor "
				+ "SET department = ?, state = ?, office_no = ? "
				+ "WHERE professor_no = ?";
		Connection conn = DBHelper.getConnection();
		PreparedStatement stmt = conn.prepareStatement(sql);
		stmt.setString(1, department);
		stmt.setString(2, state);
		stmt.setString(3, officeNo);
		stmt.setInt(4, professorNo);
		System.out.println(stmt);
		row = stmt.executeUpdate();
		
		return row;
	}
	
	//교수 인원 카운트
	//파라미터 : int professorNo, String department, String name
	//반환 값 : int
	//사용 페이지 : admin/professor/professorList.jsp
	public static int selectProfessorCount(int professorNo, String department, String name) throws Exception {
		int cnt = 0;
		String sql = null;
		Connection conn = DBHelper.getConnection();
		PreparedStatement stmt = null;
		if(professorNo != 0) {
			sql = "SELECT count(*) cnt "
					+ "FROM professor "
					+ "WHERE professor_no LIKE '%" + professorNo +"%' AND department LIKE ? AND name LIKE ? ";
			stmt = conn.prepareStatement(sql);
			stmt.setString(1, "%" + department + "%");
			stmt.setString(2, "%" + name + "%");
		} else {
			sql = "SELECT count(*) cnt "
					+ "FROM professor "
					+ "WHERE department LIKE ? AND name LIKE ? ";
			stmt = conn.prepareStatement(sql);
			stmt.setString(1, "%" + department + "%");
			stmt.setString(2, "%" + name + "%");
		}
		//디버깅
		System.out.println(stmt);
		ResultSet rs = stmt.executeQuery();
		if(rs.next()) {
			cnt = rs.getInt("cnt");
		}
		
		return cnt;
	}
	
	//교수 마이페이지 수정
	//파라미터 : int professorNo, String gender, String birthday, String phone, String email
	//반환 값 : int
	//사용 페이지 : /professor/updateMyPageAction.jsp
	public static int updateProfessor(int professorNo, String gender, String birthday, String phone, String email) throws Exception {
		int row = 0;
		String sql = null;
		sql = "UPDATE professor "
				+ "SET gender = ?, birthday = ?, phone = ?, email = ? "
				+ "WHERE professor_no = ?";
		Connection conn = DBHelper.getConnection();
		PreparedStatement stmt = null;
		stmt = conn.prepareStatement(sql);
		stmt.setString(1, gender);
		stmt.setString(2, birthday);
		stmt.setString(3, phone);
		stmt.setString(4, email);
		stmt.setInt(5, professorNo);
		System.out.println(stmt);
		row = stmt.executeUpdate();
		
		return row;
	}
	
	public static void main(String[] args) throws Exception {
		//디버깅
		//System.out.println(selectProfessorList(0, "", "", 0, 5));
		//System.out.println(selectProfessorCountint(202410, "", ""));
	}
}
