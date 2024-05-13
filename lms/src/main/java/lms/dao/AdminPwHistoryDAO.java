package lms.dao;

import java.sql.Connection;	
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.*;

public class AdminPwHistoryDAO {
	
	// 관리자 비밀번호 수정
	// 파라미터 : int adminNo, String newPw, String oldPw
	// 반환값 : int
	// 사용 페이지 : updatePwAction.jsp
	public static int insertPw(int adminNo, String newPw) throws Exception {
		
		int row = 0;
		
		String sql = "INSERT INTO admin_pw_history (pw, admin_no) "
				+ "VALUES(?, ?)";
		
		
		Connection conn = DBHelper.getConnection();
		PreparedStatement stmt = null;
		stmt = conn.prepareStatement(sql);
		
		//디버깅
		System.out.println(stmt + "<-- AdminPwHistoryDAO insertPw stmt");
		stmt.setString(1, newPw);
		stmt.setInt(2, adminNo);
		stmt.setInt(3, adminNo);
		
		row = stmt.executeUpdate();
		
		return row;
		
	}
	
	
	//예전 비밀번호가 맞는지 확인
	// 파라미터 : String oldPw
	// 반환값 : int
	// 사용 페이지 : 
	public static int selectOldPw(String oldPw, int adminNo) throws Exception {
		int row = 0;
		
		ArrayList<HashMap<String, Object>> list = new ArrayList<HashMap<String, Object>>();
		
		// DB 접근
		// History 내역을 전부 호출
		String sql = "SELECT pw "
				+ "FROM admin_pw_history "
				+ "WHERE admin_no = ? "
				+ "ORDER BY create_date "
				+ "DESC limit 1";
		Connection conn = DBHelper.getConnection();
		PreparedStatement stmt = null; 	
		ResultSet rs = null;
		stmt=conn.prepareStatement(sql);
		
		//디버깅
		System.out.println(stmt + "<-- AdminPwHistoryDAO checkOldPw stmt");
		
		stmt.setInt(1, adminNo);
		
		rs = stmt.executeQuery();
		
		
		HashMap<String, Object> resultMap = null;
		if(rs.next()) {
			// History 내역과 oldPw가 일치한다면 1을 반환
			if(oldPw.equals(rs.getString("pw"))) {
				row = 1;
			} else {
				row = 0;
			}
		}
		
		conn.close();
		return row;
		
	}
	
	
	
	//예전 비밀번호가 맞는지 확인
	// 파라미터 : String oldPw
	// 반환값 : ArrayList<HashMap<String, Object>>
	// 사용 페이지 : 
	public static int selectNewPw (String newPw, int adminNo) throws Exception{
		int row = 0;
		ArrayList<HashMap<String, Object>> list = new ArrayList<HashMap<String, Object>>();
		
		// DB 접근
		Connection conn = DBHelper.getConnection();
		
		String sql = "SELECT pw FROM admin_pw_history "
				+ "WHERE admin_no = ? "
				+ "ORDER BY create_date DESC LIMIT 3 ";
		PreparedStatement stmt = null; 	
		ResultSet rs = null;
		stmt=conn.prepareStatement(sql);
		
		//디버깅
		System.out.println(stmt+" <-- AdminPwHistoryDAO checkNewPw stmt");
		
		stmt.setInt(1, adminNo);

		rs = stmt.executeQuery();
		
		while(rs.next()) {
			if(newPw.equals(rs.getString("pw"))) { // Pw_History 내역과 비교하여 중복될경우 1을 반환
				row = 1;
			} else { //Pw_History 내역과 비교하여 중복 X -> 0을 반환
				row = 0;
			}
		}
		
		conn.close();
		return row;
	}
	
	//관리자-비밀번호 찾기
	//파라미터 : int id , String email
	//반환값 HashMap<String, Object>
	//사용 페이지: findPwAction.jsp
	//-수정중
	public static HashMap<String , Object>selectPw(int id, String email) throws Exception {
		HashMap<String , Object>resultMap=null;

	    // DB접근
	    Connection conn = DBHelper.getConnection();

	    String sql = "SELECT admin.admin_no adminNo , admin_pw_history.pw ,email "
	    		+"FROM admin,admin_pw_history " 
	    		+"WHERE admin.admin_no = admin_pw_history.admin_no AND admin_pw_history.admin_no= ? "
	    		+"AND (select pw FROM admin_pw_history WHERE admin_no = ? "
	    		+"ORDER BY create_date DESC LIMIT 1)= ? "   
	    		+"ORDER BY create_date DESC LIMIT 1";	  
		PreparedStatement stmt = null;
	    ResultSet rs = null;
	    stmt = conn.prepareStatement(sql);

	    // 디버깅
	    System.out.println(stmt + "AdminPwHistoryDAO findPwAction.jsp stmt");

	    stmt.setInt(1, id);
	    stmt.setInt(2, id);
	    stmt.setString(3, email);

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
