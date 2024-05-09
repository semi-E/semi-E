package lms.dao;

import java.sql.Connection;	
import java.sql.PreparedStatement;
import java.util.*;

public class AdminPwHistoryDAO {
	
	// 관리자 비밀번호 수정
	// 파라미터 : int adminNo, String newPw, String oldPw
	// 반환값 : int
	// 사용 페이지 : updatePwAction.jsp
	public static int insertPw( int adminNo, String newPw, String oldPw) throws Exception {
		
		int row = 0;
		
		String sql = "";
		
		Connection conn = DBHelper.getConnection();
		PreparedStatement stmt = null;
		stmt = conn.prepareStatement(sql);
		stmt.setInt(1, adminNo);
		stmt.setString(2, oldPw);
		System.out.println("DAO addCustomer --> "+stmt);
		
		row = stmt.executeUpdate();
		
		return row;
		
	}
}
