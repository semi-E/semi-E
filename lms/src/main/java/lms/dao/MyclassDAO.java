package lms.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.HashMap;

public class MyclassDAO {
	
		// 내 강의목록 상세보기
		// 파라미터: int classApplyNo
		// 반환 값: HashMap<String, Object>
		public static HashMap<String, Object> selectMyClass(int classApplyNo) throws Exception {
			Connection conn = DBHelper.getConnection();
			String sql1 ="SELECT c.class_apply_no AS classApplyNo,\r\n"
					+ "       c.subject_name AS subjectName,\r\n"
					+ "       c.professor_no AS professorNo,\r\n"
					+ "       c.class_name AS className,\r\n"
					+ "       c.period_start AS periodStart,\r\n"
					+ "       c.days,\r\n"
					+ "       c.state,\r\n"
					+ "       c.classroom,\r\n"
					+ "       c.year,\r\n"
					+ "       c.semester\r\n"
					+ "FROM class_open_apply c\r\n"
					+ "JOIN my_class m \r\n"
					+ "ON c.class_apply_no = m.class_apply_no\r\n"
					+ "JOIN student s \r\n"
					+ "ON m.student_no = s.student_no\r\n"
					+ "WHERE c.class_apply_no = ?;\r\n";
				
			PreparedStatement stmt1 = conn.prepareStatement(sql1);
			System.out.println(sql1+"<-----SQL1");
			
			stmt1.setInt(1,classApplyNo);
			
			ResultSet rs1 = stmt1.executeQuery();
			
			HashMap<String, Object> m = new HashMap<String, Object>();
			if(rs1.next()) {
		        m.put("classApplyNo", rs1.getInt("classApplyNo"));
		        m.put("subjectName", rs1.getString("subjectName"));   
		        m.put("professorNo", rs1.getInt("professorNo"));
		        m.put("className", rs1.getString("className"));
		        m.put("periodStart", rs1.getString("periodStart"));
		        m.put("days", rs1.getString("days"));
		        m.put("state", rs1.getString("state"));
		        m.put("classroom", rs1.getString("classroom"));
		        m.put("year", rs1.getString("year"));
		        m.put("semester", rs1.getString("semester"));
		    }
		    return m;
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
		
		
		// 수정 중
		// 나의 수강 목록에 추가
		// 파라미터 : int classApplyNo, int studentNo
		// 반환 값 : int
		// 사용 페이지 : /lms/student/classApply/addMyClassAction.jsp 
		public static int insertMyClass(int studentNo, int classApplyNo) throws Exception {
			int row = 0;
			
			String sql = "INSERT INTO my_class "
						+"VALUES( ?, ?)";
			
			Connection conn = DBHelper.getConnection();
			PreparedStatement stmt = null; 	
			stmt = conn.prepareStatement(sql);
			
			
			stmt.setInt(1, studentNo);
			stmt.setInt(1, classApplyNo);
			//디버깅
			System.out.println(stmt+" <-- insertMyClass stmt");
			
			row = stmt.executeUpdate();
			
			//DB자원 반납
			conn.close();
			return row;
			
		}

}
