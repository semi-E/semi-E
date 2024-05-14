package lms.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.HashMap;

public class ProfessorPwHistoryDAO {
	
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
					+ "WHERE ( "
					+ "SELECT pw "
					+ "FROM professor_pw_history "
					+ "WHERE professor_no = ? "
					+ "ORDER BY create_date DESC "
					+ " LIMIT 1 "
				+ ") = ? "
				+ "AND NOT EXISTS ( "
					+ "SELECT pw "
					+ "FROM ( "
						+ "SELECT pw "
						+ "FROM professor_pw_history "
						+ "WHERE professor_no =? "
						+ "ORDER BY create_date DESC "
						+ " LIMIT 3 "
					+ ") AS recent_pw "
					+ " WHERE pw = ? "
				+ ");";
		Connection conn = DBHelper.getConnection();
		PreparedStatement stmt = conn.prepareStatement(sql);
		stmt.setString(1, newPw);
		stmt.setInt(2, professorNo);
		stmt.setInt(3, professorNo);
		stmt.setString(4, oldPw);
		stmt.setInt(5, professorNo);
		stmt.setString(6, newPw);
		System.out.println(stmt);
		row = stmt.executeUpdate();
		
		return row;
	}
	
	public static void main(String[] args) {
		
	}
	
		//교수-비밀번호 찾기
		//파라미터 : int id , String email
		//반환값 HashMap<String, Object>
		//사용 페이지: findPwAction.jsp
		public static HashMap<String , Object>selectPw(int id, String email) throws Exception {
			HashMap<String , Object>resultMap=null;

		    // DB접근
		    Connection conn = DBHelper.getConnection();

		    String sql = "SELECT  professor_pw_history.professor_no, email, pw "
		    		+ "FROM professor "
		    		+ "JOIN professor_pw_history ON professor.professor_no = professor_pw_history.professor_no "
		    		+ "WHERE professor.professor_no = ? AND professor.email = ? "
		    		+ "ORDER BY create_date DESC LIMIT 1";	  
			PreparedStatement stmt = null;
		    ResultSet rs = null;
		    stmt = conn.prepareStatement(sql);

		    // 디버깅
		    System.out.println(stmt + "professorPwHistoryDAO findPwAction.jsp stmt");

		    stmt.setInt(1, id);
		    stmt.setString(2, email);

		    rs = stmt.executeQuery();

		    if (rs.next()) {
	        	resultMap = new HashMap<String,Object>();
	        	resultMap.put("pw",rs.getString("pw"));
	        	//디버깅
	        	System.out.println("pw");
		        }
		    conn.close();
		    return resultMap;
		    }
		}

