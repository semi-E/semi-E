package lms.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.HashMap;

public class DepartmentDAO {
		// 학과 리스트
		// 파라미터 : X
		// 반환 값 : ArrayList<HashMap<String, Object>>
		// 사용 페이지 : /lms/admin/department/departmentList.jsp
		public static ArrayList<HashMap<String, Object>> selectDepartmentList () throws Exception{
			ArrayList<HashMap<String, Object>> list = new ArrayList<HashMap<String, Object>>();
			
			// DB 접근
			Connection conn = DBHelper.getConnection();
			
			String sql = "SELECT * FROM department";
			PreparedStatement stmt = null; 	
			ResultSet rs = null;
			stmt=conn.prepareStatement(sql);
			
			//디버깅
			System.out.println(stmt+" <-- selectDepartmentList stmt");
			
			rs = stmt.executeQuery();
			
			
			HashMap<String, Object> resultMap = null;
			while(rs.next()) {
				resultMap = new HashMap<String, Object>();
				resultMap.put("department", rs.getString("department"));
				resultMap.put("admin_no", rs.getInt("admin_no"));
				list.add(resultMap);
			}
			
			conn.close();
			return list;
		}
		
}
