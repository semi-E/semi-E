package lms.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.HashMap;

public class MyclassDAO {
	
		// 내 강의목록 상세보기
		// 파라미터:
		// 반환 값:
		public static HashMap<String, Object> selectMyClass(int classApplyNo) throws Exception {
			Connection conn = DBHelper.getConnection();
			String sql1 ="";
			
			PreparedStatement stmt1 = conn.prepareStatement(sql1);
			System.out.println(sql1+"<-----SQL1");
			
			stmt1.setInt(1,classApplyNo);
			
			ResultSet rs = stmt1.executeQuery();
			
			if(rs.next()) {
				 HashMap<String, Object> m = new HashMap<String, Object>();
				  m.put("", rs.getInt(""));
			}
			return null;
			
		
		}
		// 학생 자신의 강의 목록
		// 파라미터 :int studentNo,int classApplyNo,int professorNo,String className,
		//String department,String subjectName,String days,int periodStart
		// 반환 값 : ArrayList<HashMap<String, Object>> 
		public static ArrayList<HashMap<String, Object>> selectMyClasslist(int studentNo,int classApplyNo,int professorNo,String className,
				String department,String subjectName,String days,int periodStart) throws Exception {
			
			
			Connection conn = DBHelper.getConnection();
			
			String sql1 = "SELECT c.class_apply_no AS classApplyNo"
					+ ", c.subject_name AS subjectName"
					+ ", c.professor_no AS professorNo"
					+ ", c.class_name AS className"
					+ ", c.period_start AS periodStart"
					+ ", c.days"
					+ ", c.state"
					+ ",c.classroom"
					+ ", c.year"
					+ ", c.semester\r\n"
					+ "FROM class_open_apply c\r\n"
					+ "JOIN my_class m\r\n"
					+ "ON c.class_apply_no = m.class_apply_no\r\n"
					+ "WHERE m.student_no = ?";
				
			PreparedStatement stmt1 = conn.prepareStatement(sql1);
			System.out.println(sql1+"<-----SQL1");
			

			stmt1.setInt(1,studentNo);

			System.out.println(stmt1);

			ResultSet rs = stmt1.executeQuery();

			   
		    ArrayList<HashMap<String, Object>> list = new ArrayList<HashMap<String, Object>>();	 
		    while(rs.next()) {
		        HashMap<String, Object> m = new HashMap<String, Object>();
		        m.put("classApplyNo", rs.getInt("classApplyNo"));
		        m.put("subjectName", rs.getString("subjectName"));
		        m.put("professorNo", rs.getInt("professorNo"));
		        m.put("className", rs.getString("className"));
		        m.put("periodStart", rs.getInt("periodStart"));
		        m.put("days", rs.getString("days"));
		        m.put("state", rs.getString("state"));
		        m.put("calssroom", rs.getString("classroom"));
		        m.put("year", rs.getString("year"));
		        m.put("semester", rs.getInt("semester"));
		        
		     
		        list.add(m);
			
			    }
			
			return list;
		}

}
