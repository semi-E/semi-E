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
	
	public static void main(String[] args) {
		
	}
}
