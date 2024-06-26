package lms.dao;

import java.sql.Connection;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.HashMap;

public class ClassOpenApplyDAO {
	//강의 개수 카운트
	//파라미터 : int classApplyNo, int professorNo, String professorName, String className, 
	//String subjectName, String days, int periodStart, int year, int semester, String state
	//반환 값 : int
	//사용 페이지 : /lms/professor/class/classList.jsp
	public static int selectClassOpenApplyCount(int classApplyNo, int professorNo, String professorName, String className, 
			String subjectName, String days, int periodStart, int year, int semester, String state) throws Exception{
		int cnt = 0;
		String sql = null;
		sql = "SELECT COUNT(*) cnt "
				+ "FROM class_open_apply c "
				+ "INNER JOIN professor p "
				+ "ON c.professor_no = p.professor_no "
				+ "WHERE c.class_apply_no like ? AND c.professor_no like ? AND c.class_name like ? AND "
				+ "c.subject_name like ? AND c.days like ? AND c.period_start like ? AND c.year = ? AND semester = ? AND c.state = ? AND p.name like ?";
		Connection conn = DBHelper.getConnection();
		PreparedStatement stmt = null;
		stmt = conn.prepareStatement(sql);
		// 검색 값이 0으로 들어왔을 때
		if(classApplyNo == 0) {
			stmt.setString(1, "%%");
		} else {
			stmt.setString(1, "%" + classApplyNo + "%");
		}
		// 검색 값이 0으로 들어왔을 때
		if(professorNo == 0) {
			stmt.setString(2, "%%");
		} else {
			stmt.setString(2, "%" + professorNo + "%");
		}
		stmt.setString(3, "%" + className + "%");
		stmt.setString(4, "%" + subjectName + "%");
		stmt.setString(5, "%" + days + "%");
		if(periodStart == 0) {
			stmt.setString(6, "%%");
		} else {
			stmt.setString(6, "%" + periodStart + "%");
		}
		stmt.setInt(7, year);
		stmt.setInt(8, semester);
		stmt.setString(9, state);
		stmt.setString(10, "%" + professorName + "%");
		System.out.println(stmt);
		ResultSet rs = stmt.executeQuery();
		
		if(rs.next()) {
			cnt = rs.getInt("cnt");
		}
		
		return cnt;
	}
	
	//강의 목록
	//파라미터 : int classApplyNo, int professorNo, String professorName, String className, 
	//String department, String subjectName, String days, int periodStart, int year, int semester, String state, int startRow, int rowPerPage
	//반환 값 : ArrayList<HashMap<String, Object>>
	//사용 페이지 : /lms/professor/class/classList.jsp, /lms/professor/class/myClass.jsp
	public static ArrayList<HashMap<String, Object>> selectClassOpenApplyList(int classApplyNo, int professorNo, String professorName, String className, 
			String subjectName, String days, int periodStart, int year, int semester, String state, int startRow, int rowPerPage) throws Exception{
		ArrayList<HashMap<String, Object>> list = new ArrayList<HashMap<String, Object>>();
		String sql = null;
		sql = "SELECT c.class_apply_no classApplyNo, c.professor_no professorNo, p.name professorName, c.class_name className, c.classroom classroom, "
				+ "c.subject_name subjectName, c.days days, c.period_start periodStart, c.year year, c.semester semester, s.credit credit "
				+ "FROM class_open_apply c , subject s, professor p "
				+ "WHERE c.subject_name = s.subject_name AND c.professor_no = p.professor_no AND c.class_apply_no like ? AND c.professor_no like ? "
				+ "AND c.class_name like ? AND c.subject_name like ? AND c.days like ? AND c.period_start like ? AND c.year = ? AND c.semester = ? "
				+ "AND c.state = ? AND p.name like ? "
				+ "LIMIT ?, ?";
		Connection conn = DBHelper.getConnection();
		PreparedStatement stmt = null;
		stmt = conn.prepareStatement(sql);
		// 검색 값이 0으로 들어왔을 때
		if(classApplyNo == 0) {
			stmt.setString(1, "%%");
		} else {
			stmt.setString(1, "%" + classApplyNo + "%");
		}
		// 검색 값이 0으로 들어왔을 때
		if(professorNo == 0) {
			stmt.setString(2, "%%");
		} else {
			stmt.setString(2, "%" + professorNo + "%");
		}
		stmt.setString(3, "%" + className + "%");
		stmt.setString(4, "%" + subjectName + "%");
		stmt.setString(5, "%" + days + "%");
		if(periodStart == 0) {
			stmt.setString(6, "%%");
		} else {
			stmt.setString(6, "%" + periodStart + "%");
		}
		stmt.setInt(7, year);
		stmt.setInt(8, semester);
		stmt.setString(9, state);
		stmt.setString(10, "%" + professorName + "%");
		stmt.setInt(11, startRow);
		stmt.setInt(12, rowPerPage);
		System.out.println(stmt);
		ResultSet rs = stmt.executeQuery();
		
		while(rs.next()) {
			HashMap<String, Object> m = new HashMap<String, Object>();
			m.put("classApplyNo", rs.getInt("classApplyNo"));
			m.put("professorNo", rs.getInt("professorNo"));
			m.put("professorName", rs.getString("professorName"));
			m.put("className", rs.getString("className"));
			m.put("classroom", rs.getString("classroom"));
			m.put("subjectName", rs.getString("subjectName"));
			m.put("days", rs.getString("days"));
			m.put("periodStart", rs.getInt("periodStart"));
			m.put("year", rs.getInt("year"));
			m.put("semester", rs.getInt("semester"));
			m.put("credit", rs.getInt("credit"));
			
			list.add(m);
		}
		
		return list;
	}
	
	//강의 신청 목록
	//파라미터 : int classApplyNo, int professorNo, String professorName, String className, 
	//String department, String subjectName, String days, int periodStart, int year, int semester, int startRow, int rowPerPage
	//반환 값 : ArrayList<HashMap<String, Object>>
	//사용 페이지 : /lms/professor/class/classList.jsp
	public static ArrayList<HashMap<String, Object>> selectClassOpenApplyList(int classApplyNo, int professorNo, String professorName, String className, 
			String subjectName, String days, int periodStart, int year, int semester, int startRow, int rowPerPage) throws Exception{
		ArrayList<HashMap<String, Object>> list = new ArrayList<HashMap<String, Object>>();
		String sql = null;
		sql = "SELECT c.class_apply_no classApplyNo, c.professor_no professorNo, p.name professorName, c.class_name className, c.classroom classroom, "
				+ "c.subject_name subjectName, c.days days, c.period_start periodStart, c.year year, c.semester semester, s.credit credit, c.state state "
				+ "FROM class_open_apply c , subject s, professor p "
				+ "WHERE c.subject_name = s.subject_name AND c.professor_no = p.professor_no AND c.class_apply_no like ? AND c.professor_no like ? "
				+ "AND c.class_name like ? AND c.subject_name like ? AND c.days like ? AND c.period_start like ? AND c.year = ? AND c.semester = ? "
				+ "AND (c.state = '승인 대기' OR '거절') AND p.name like ? "
				+ "LIMIT ?, ?";
		Connection conn = DBHelper.getConnection();
		PreparedStatement stmt = null;
		stmt = conn.prepareStatement(sql);
		// 검색 값이 0으로 들어왔을 때
		if(classApplyNo == 0) {
			stmt.setString(1, "%%");
		} else {
			stmt.setString(1, "%" + classApplyNo + "%");
		}
		// 검색 값이 0으로 들어왔을 때
		if(professorNo == 0) {
			stmt.setString(2, "%%");
		} else {
			stmt.setString(2, "%" + professorNo + "%");
		}
		stmt.setString(3, "%" + className + "%");
		stmt.setString(4, "%" + subjectName + "%");
		stmt.setString(5, "%" + days + "%");
		if(periodStart == 0) {
			stmt.setString(6, "%%");
		} else {
			stmt.setString(6, "%" + periodStart + "%");
		}
		stmt.setInt(7, year);
		stmt.setInt(8, semester);
		stmt.setString(9, "%" + professorName + "%");
		stmt.setInt(10, startRow);
		stmt.setInt(11, rowPerPage);
		System.out.println(stmt);
		ResultSet rs = stmt.executeQuery();
		
		while(rs.next()) {
			HashMap<String, Object> m = new HashMap<String, Object>();
			m.put("classApplyNo", rs.getInt("classApplyNo"));
			m.put("professorNo", rs.getInt("professorNo"));
			m.put("professorName", rs.getString("professorName"));
			m.put("className", rs.getString("className"));
			m.put("classroom", rs.getString("classroom"));
			m.put("subjectName", rs.getString("subjectName"));
			m.put("days", rs.getString("days"));
			m.put("periodStart", rs.getInt("periodStart"));
			m.put("year", rs.getInt("year"));
			m.put("semester", rs.getInt("semester"));
			m.put("credit", rs.getInt("credit"));
			m.put("state", rs.getString("state"));
			
			list.add(m);
		}
		
		return list;
	}
	
	//강의 신청 개수 카운트
	//파라미터 : int classApplyNo, int professorNo, String professorName, String className, 
	//String subjectName, String days, int periodStart, int year, int semester
	//반환 값 : int
	//사용 페이지 : /lms/professor/class/classOpneApplyList.jsp
	public static int selectClassOpenApplyCount(int classApplyNo, int professorNo, String professorName, String className, 
			String subjectName, String days, int periodStart, int year, int semester) throws Exception{
		int cnt = 0;
		String sql = null;
		sql = "SELECT COUNT(*) cnt "
				+ "FROM class_open_apply c "
				+ "INNER JOIN professor p "
				+ "ON c.professor_no = p.professor_no "
				+ "WHERE c.class_apply_no like ? AND c.professor_no like ? AND c.class_name like ? AND "
				+ "c.subject_name like ? AND c.days like ? AND c.period_start like ? AND c.year = ? AND semester = ? AND (c.state = '승인 대기' OR '거절') AND p.name like ?";
		Connection conn = DBHelper.getConnection();
		PreparedStatement stmt = null;
		stmt = conn.prepareStatement(sql);
		// 검색 값이 0으로 들어왔을 때
		if(classApplyNo == 0) {
			stmt.setString(1, "%%");
		} else {
			stmt.setString(1, "%" + classApplyNo + "%");
		}
		// 검색 값이 0으로 들어왔을 때
		if(professorNo == 0) {
			stmt.setString(2, "%%");
		} else {
			stmt.setString(2, "%" + professorNo + "%");
		}
		stmt.setString(3, "%" + className + "%");
		stmt.setString(4, "%" + subjectName + "%");
		stmt.setString(5, "%" + days + "%");
		if(periodStart == 0) {
			stmt.setString(6, "%%");
		} else {
			stmt.setString(6, "%" + periodStart + "%");
		}
		stmt.setInt(7, year);
		stmt.setInt(8, semester);
		stmt.setString(9, "%" + professorName + "%");
		System.out.println(stmt);
		ResultSet rs = stmt.executeQuery();
		
		if(rs.next()) {
			cnt = rs.getInt("cnt");
		}
		
		return cnt;
	}
	
	//강의 개설 신청
	//파라미터 : int professorNo, String subjcetName, String className, String days, int periodStart, int year, int semester
	//반환 값 : int
	//사용 페이지 : addClassOpenApplyAction.jsp
	public static int insertClassOpenApplyAction(int professorNo, String subjectName, String className, String days, int periodStart, int year, int semester) throws Exception {
		int row = 0;
		String sql = null;
		sql = "INSERT INTO class_open_apply (professor_no, subject_name, class_name, days, period_start, year, semester) "
				+ "VALUES (?, ?, ?, ?, ?, ?, ?)";
		Connection conn = DBHelper.getConnection();
		PreparedStatement stmt = null;
		stmt = conn.prepareStatement(sql);
		stmt.setInt(1, professorNo);
		stmt.setString(2, subjectName);
		stmt.setString(3, className);
		stmt.setString(4, days);
		stmt.setInt(5, periodStart);
		stmt.setInt(6, year);
		stmt.setInt(7, semester);
		System.out.println(stmt);
		row = stmt.executeUpdate();
		
		return row;
	}
	
	//강의 개설 신청 취소
	//파라미터 : int classApplyNo, int professorNo
	//반환 값 : int
	//사용 페이지 : deleteClassOpenApplyAction.jsp
	public static int deleteClassOpenApplyAction(int classApplyNo, int professorNo) throws Exception {
		int row = 0;
		String sql = null;
		sql = "DELETE FROM class_open_apply "
				+ "WHERE class_apply_no = ? AND professor_no = ?";
		Connection conn = DBHelper.getConnection();
		PreparedStatement stmt = null;
		stmt = conn.prepareStatement(sql);
		stmt.setInt(1, classApplyNo);
		stmt.setInt(2, professorNo);
		System.out.println(stmt);
		row = stmt.executeUpdate();
		
		return row;
	}
	
	
	//강의 목록
	//파라미터 : int professorNo, String state
	//반환 값 : ArrayList<HashMap<String, Object>>
	//사용 페이지 : /lms/professor/classBoard/myClassBoardList.jsp
	public static ArrayList<HashMap<String, Object>> selectMyClassOpenApplyList(int professorNo, String state) throws Exception{
		ArrayList<HashMap<String, Object>> list = new ArrayList<HashMap<String, Object>>();
		String sql = null;
		sql = "SELECT c.class_apply_no classApplyNo, "
				+ "c.class_name className, "
				+ "c.classroom classroom, "
				+ "c.subject_name subjectName, "
				+ "c.days days, c.period_start periodStart, "
				+ "c.year year, c.semester semester, s.credit credit "
				+ "FROM class_open_apply c , subject s, professor p "
				+ "WHERE c.subject_name = s.subject_name "
				+ "AND c.professor_no = p.professor_no "
				+ "AND p.professor_no = ? "
				+ "AND c.state = ?";
		Connection conn = DBHelper.getConnection();
		PreparedStatement stmt = null;
		stmt = conn.prepareStatement(sql);
		stmt.setInt(1, professorNo);
		stmt.setString(2, state);
		System.out.println(stmt);
		ResultSet rs = stmt.executeQuery();
		
		while(rs.next()) {
			HashMap<String, Object> m = new HashMap<String, Object>();
			m.put("classApplyNo", rs.getInt("classApplyNo"));
			m.put("className", rs.getString("className"));
			m.put("classroom", rs.getString("classroom"));
			m.put("subjectName", rs.getString("subjectName"));
			m.put("days", rs.getString("days"));
			m.put("periodStart", rs.getInt("periodStart"));
			m.put("year", rs.getInt("year"));
			m.put("semester", rs.getInt("semester"));
			m.put("credit", rs.getInt("credit"));
			
			list.add(m);
		}
		
		return list;
	}

	
	
	// 강의 상세보기
	// 파라미터: int classApplyNo int professorNo
	// 반환 값: HashMap<String, Object>
	public static HashMap<String, Object> selecMyClassOpenApply( int classApplyNo, int professorNo ) throws Exception {
		Connection conn = DBHelper.getConnection();
		String sql1 ="SELECT subject_name subjectName, class_name className, period_start periodStart, "
				+ "days, create_date createDate, update_date updateDate, state, admin_no adminNo , classroom "
				+ "FROM class_open_apply "
				+ "WHERE class_apply_no = ? AND professor_no = ?";
			
		PreparedStatement stmt1 = conn.prepareStatement(sql1);
		System.out.println(sql1+"<-----SQL1");
		
		stmt1.setInt(1,classApplyNo);
		stmt1.setInt(2,professorNo);
		
		ResultSet rs1 = stmt1.executeQuery();
		
		HashMap<String, Object> m = new HashMap<String, Object>();
		if(rs1.next()) {
	        m.put("subjectName", rs1.getString("subjectName"));   
	        m.put("className", rs1.getString("className"));
	        m.put("periodStart", rs1.getInt("periodStart"));
	        m.put("days", rs1.getString("days"));
	        m.put("createDate", rs1.getString("createDate"));
	        m.put("updateDate", rs1.getString("updateDate"));
	        m.put("state", rs1.getString("state"));
	        m.put("adminNo", rs1.getInt("adminNo"));
	        m.put("classroom", rs1.getString("classroom"));
	    }
	    return m;
	}
	//강의신청 수정
	//파라미터: int classApplyNo, String classRoom , Sting state
	//반환값 : int
	//사용페이지 : updateClassOpenApplyAction.jsp
	public static int updateClassOpenApply(String classRoom,String state, int classApplyNo)throws Exception{
		int row= 0;
		String sql= null;
			sql="UPDATE class_open_apply "
				+ "SET  classRoom = ? , state = ? , update_date = NOW() "
				+ "WHERE class_apply_no = ?";
		Connection conn = DBHelper.getConnection();
		PreparedStatement stmt = null;
		stmt = conn.prepareStatement(sql); 
		stmt.setString(1, classRoom);
		stmt.setString(2, state);
		stmt.setInt(3, classApplyNo);
		
		System.out.println(stmt + "<--updateClassOpenApply param stmt");
		row=stmt.executeUpdate();
		
		conn.close();
		return row;
	}
	
	//과목신청번호 검색으로 과목 삭제 검증
	//파라미터 : subjectName
	//반환 값 : int
	//사용 페이지: /lms/admin/subject/deleteSubject.jsp
	public static int selectClassOpenApply(String subjectName)throws Exception{
		int row = 0;
		String  sql="select subject_name subjectName "
				+ "from class_open_apply "
				+ "where subject_name = ?";
		
		Connection conn = DBHelper.getConnection();
		PreparedStatement stmt = null;
		stmt = conn.prepareStatement(sql);
		
		
		stmt.setString(1, subjectName);
		//디버깅
		System.out.println(stmt + "<-- select class_open_apply stmt");
		ResultSet rs=stmt.executeQuery();
		
		if(rs.next()) {
			row=1;
			
		}
		conn.close();
		return row;
	}
	
	
	public static void main(String[] args) throws Exception {
		//디버깅
		//System.out.println(ClassOpenApplyDAO.selectClassOpenApplyCount(0, 0, "", "", "", 0, 2024, 1, "승인"));
		System.out.println(ClassOpenApplyDAO.selectClassOpenApplyList(0, 0, "", "", "", "", 0, 2024, 1, "승인", 0, 10));
		//System.out.println(ClassOpenApplyDAO.selectClassOpenApplyList(0, 0, "", "", "", "", 0, 2024, 1, 0, 10));

	}

}
