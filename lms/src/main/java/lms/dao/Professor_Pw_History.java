package lms.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;

public class Professor_Pw_History {
	
	//교수 등록시 비밀번호 설정
	//파라미터 : int professorNo
	//반환값 : int
	//사용페이지 : /admin/professor/addProfessorAction.jsp
	public static int insertProfessorPwHistory(int professorNo) throws Exception {
		int row = 0;
		String sql = "INSERT INTO professor_pw_history (professor_no) VALUES(?)";
		Connection conn = DBHelper.getConnection();
		PreparedStatement stmt = conn.prepareStatement(sql);
		stmt.setInt(1, professorNo);
		System.out.println(stmt);
		row = stmt.executeUpdate();
		
		return row;
	}
	
	//교수 페이지에서 비밀번호 변경
	//파라미터 : int professorNo, String oldPw, String newPw
	//반환 값 : int
	//사용 페이지 : /professor/updatePwAction.jsp
	public static int insertProfessorPwHistory(int professorNo, String oldPw, String newPw) throws Exception {
		int row = 0;
		
		String sql = "INSERT INTO professor_pw_history "
				+ "(pw, professor_no) "
				+ "SELECT ?, ? "
				+ "FROM professor_pw_history "
				+ "WHERE professor_no = ? AND pw = ? AND pw != ? ORDER BY create_date LIMIT 0,3";
		Connection conn = DBHelper.getConnection();
		PreparedStatement stmt = conn.prepareStatement(sql);
		stmt.setString(1, newPw);
		stmt.setInt(2, professorNo);
		stmt.setInt(3, professorNo);
		stmt.setString(4, oldPw);
		stmt.setString(5, newPw);
		System.out.println(stmt);
		row = stmt.executeUpdate();
		
		return row;
	}
	
	public static void main(String[] args) {
		
	}
}
