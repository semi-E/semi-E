package lms.dao;

import java.sql.Connection;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

	public class ClassBasketDAO {
		
		public static List<Integer> selectClassBasket(int studentNo) throws Exception{
			List<Integer> list = new ArrayList<>();
			
			String sql = null;
			sql = "SELECT class_apply_no classApplyNo FROM class_basket WHERE student_no = ?";
			Connection conn = DBHelper.getConnection();
			PreparedStatement stmt = null;
			stmt = conn.prepareStatement(sql);
			
			stmt.setInt(1, studentNo);
			System.out.println(stmt);
			ResultSet rs = stmt.executeQuery();
			
			while(rs.next()) {
				list.add(rs.getInt("classApplyNo"));
			}
			
			return list;
		}

		
	
		public static int insertClassBasket(  int classApplyNo, int StudentNo) throws Exception {
			int row = 0;
	
			String sql = "INSERT INTO class_basket "
			+ "(student_no, class_apply_no) "
			+ "VAlUES (?, ?) ";
			
			Connection conn = DBHelper.getConnection();
			PreparedStatement stmt = null; 	
			stmt = conn.prepareStatement(sql);
			
			
			stmt.setInt(1, StudentNo);
			stmt.setInt(2, classApplyNo);
			
			//디버깅
			System.out.println(stmt+" <-- insert stmt");
			
			row = stmt.executeUpdate();
			
			//DB자원 반납
			conn.close();
			return row;
		
		}
		
		//내 장바구니 목록
		//파라미터 : int studentNo
		//반환 값 : ArrayList<HashMap<String, Object>>
		//사용 페이지 : /lms/student/classApply/classBasketList.jsp
		public static ArrayList<HashMap<String, Object>> selectClassBasketList(int studentNo) throws Exception{
			ArrayList<HashMap<String, Object>> list = new ArrayList<HashMap<String, Object>>();
			
			String sql = null;
			sql = "SELECT "
					+ "b.class_apply_no classApplyNo, "
					+ "a.subject_name subjectName, a.class_name className, "
					+ "a.classroom classroom, a.year year, "
					+ "a.semester semester, a.days days, "
					+ "a.period_start periodStart "
					+ "FROM class_basket b JOIN class_open_apply a "
					+ "ON b.class_apply_no = a.class_apply_no "
					+ "WHERE b.student_no = ?";
			Connection conn = DBHelper.getConnection();
			PreparedStatement stmt = null;
			stmt = conn.prepareStatement(sql);
			
			stmt.setInt(1, studentNo);
			System.out.println(stmt);
			ResultSet rs = stmt.executeQuery();
			
			while(rs.next()) {
				HashMap<String, Object> m = new HashMap<String, Object>();
				m.put("classApplyNo", rs.getInt("classApplyNo"));
				m.put("subjectName", rs.getString("subjectName"));
				m.put("className", rs.getString("className"));
				m.put("classroom", rs.getString("classroom"));
				m.put("year", rs.getString("year"));
				m.put("semester", rs.getString("semester"));
				m.put("days", rs.getString("days"));
				m.put("periodStart", rs.getInt("periodStart"));
				list.add(m);
			}
			
			return list;
		}
		

	  //장바구니 삭제
    // 파라미터: classApplyNo, int StudentNo
    // 반환값: int
    // 사용 페이지: addClassBasketAction
    public static int deleteClassBasket(  int classApplyNo, int studentNo) throws Exception {
       int row = 0;
       
       String sql = "DELETE FROM class_basket "
             + "WHERE class_apply_no = ? AND student_no = ?";
       
       Connection conn = DBHelper.getConnection();
       PreparedStatement stmt = null;    
       stmt = conn.prepareStatement(sql);
       
       
       stmt.setInt(1, classApplyNo);
       stmt.setInt(2, studentNo);
       
       //디버깅
       System.out.println(stmt+" <-- delete stmt");
       
       row = stmt.executeUpdate();
       
       //DB자원 반납
       conn.close();
       return row;
    
    }

	
	}
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	

