package lms.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.HashMap;



public class StudentDAO {
		//학생 리스트 페이징
		//파라미터 : int studentNo,String name ,String department
		//반환값 : int
		public static int selectstudentCount(int studentNo,String name ,String department) throws Exception{
			int cnt = 0;
			Connection conn = DBHelper.getConnection();
			PreparedStatement stmt = null;
			if(studentNo != 0) {
				String sql = "SELECT count(*) cnt "
						+ "FROM student "
						+ "WHERE student_no LIKE '%" + studentNo +"%' AND department LIKE ? AND name LIKE ? ";
				stmt = conn.prepareStatement(sql);
				stmt.setString(1, "%" + department + "%");
				stmt.setString(2, "%" + name + "%");
			} else {
				String sql = "SELECT count(*) cnt "
						+ "FROM student "
						+ "WHERE department LIKE ? AND name LIKE ? ";
				stmt = conn.prepareStatement(sql);
				stmt.setString(1, "%" + department + "%");
				stmt.setString(2, "%" + name + "%");
			}
			
			System.out.println(stmt);
			ResultSet rs = stmt.executeQuery();
			if(rs.next()) {
				cnt = rs.getInt("cnt");
			}
			
			return cnt;
		}
		
	
	
	
	
	//학생정보 수정
	//파라미터 : int studentNo, String department, String state
	//반환값 : int
	public static int updatestudent(int studentNo, String department,String state) throws Exception{
		int row = 0;
		Connection conn = DBHelper.getConnection();
		
		
		String sql1 = "UPDATE student SET department = ?, state = ? WHERE student_no = ?";
		PreparedStatement stmt1 = conn.prepareStatement(sql1);
		System.out.println(sql1+"<-----SQL1");
		
		stmt1.setString(1, department);
		stmt1.setString(2, state);
		stmt1.setInt(3, studentNo);
		System.out.println(stmt1+"<------stmt1");
		
		row = stmt1.executeUpdate();
		
		conn.close();
		
		return row;
	}
	
	
	
	//학생정보 상세보기
	//파라미터 : int studentNo
	//반환값 : HashMap<String, Object>
	public static HashMap<String,Object> selectStudent(int studentNo) throws Exception {
		Connection conn = DBHelper.getConnection();
		String sql = "SELECT * FROM student WHERE student_no = ?";
		PreparedStatement stmt1 = conn.prepareStatement(sql);
		stmt1.setInt(1,studentNo);
		ResultSet rs1 = stmt1.executeQuery();
		
		HashMap<String, Object> m = new HashMap<String, Object>();
		if(rs1.next()) {
			
			m.put("student_no", rs1.getString("student_no"));
			m.put("name", rs1.getString("name"));	
			m.put("gender", rs1.getString("gender"));
			m.put("birthday", rs1.getString("birthday"));
			m.put("phone", rs1.getInt("phone"));
			m.put("address", rs1.getInt("address"));
			m.put("state", rs1.getString("state"));
			m.put("email", rs1.getString("email"));
			m.put("department", rs1.getString("department"));
			
		}
		
		conn.close();
		return m;
		
		
	}
	
	//학생 리스트
	// 파라미터 : int studentNo, String name, String department,int startRow, int rowPerpage
	//반환값 :  ArrayList<HashMap<String,Object>>
	public static ArrayList<HashMap<String,Object>> selectstudentList(int studentNo, String name, String department, int startRow, int rowPerPage) 
	        throws Exception {   
	    Connection conn = DBHelper.getConnection();
	    String sql = "SELECT student_no studentNo, name, department, state "
	                + "FROM student "
	                + "WHERE (student_no = ? OR ? = 0) "
	                + "AND department LIKE ? "
	                + "AND name LIKE ? "
	                + "LIMIT ?, ?";
	    
	    PreparedStatement stmt = conn.prepareStatement(sql);
	    stmt.setInt(1, studentNo);
	    stmt.setInt(2, studentNo);
	    stmt.setString(3, "%" + department + "%");
	    stmt.setString(4, "%" + name + "%");
	    stmt.setInt(5, startRow);
	    stmt.setInt(6, rowPerPage);

	    //디버깅
	    System.out.println(stmt);
	    
	    ResultSet rs = stmt.executeQuery();
	    
	    ArrayList<HashMap<String, Object>> list = new ArrayList<HashMap<String,Object>>();
	    
	    while(rs.next()) {
	        HashMap<String, Object> m = new HashMap<String, Object>();
	        m.put("studentNo", rs.getInt("studentNo"));
	        m.put("department", rs.getString("department"));
	        m.put("name", rs.getString("name"));
	        m.put("state", rs.getString("state"));
	        
	        list.add(m);
	    }
	    return list;
	}
		
	
	//학생 추가
	//파라미터: int studentNo, String name, String department,String pw
	//반환 값: int
	public static int insertStudent(int student_no, String name, String department) 
			throws Exception{
		int row = 0;
		Connection conn = DBHelper.getConnection();
		
		
		String sql1 = "INSERT INTO student (student_no, name, department) VALUES (?, ?, ?)";
		PreparedStatement stmt1 = conn.prepareStatement(sql1);
		System.out.println(sql1+"<-----SQL1");
		
		stmt1.setInt(1, student_no);
		stmt1.setString(2, name);
		stmt1.setString(3, department);
		System.out.println(stmt1+"<------stmt1");
		
		row = stmt1.executeUpdate();
		
		conn.close();
		
		return row;
	
	}
	//학생 로그인
	//파라미터: int id, Strung pw
	//반환값:HashMap<String, Object>
	public static HashMap<String, Object>selectStudent(int id , String pw)throws Exception{
		HashMap<String, Object>resultMap=null;
		//DB접근
		Class.forName("org.mariadb.jdbc.Driver");
		Connection conn = DBHelper.getConnection();

		
		String sql = "SELECT student_pw_history.student_no studentNo ,student_pw_history.pw  "
					+ "FROM student,student_pw_history "
					+ "WHERE student.student_no = student_pw_history.student_no "
					+ "AND student_pw_history.student_no = ? "
					+ "AND student_pw_history.pw = ? " ;
		PreparedStatement stmt = conn.prepareStatement(sql);
		stmt.setInt(1, id);
		stmt.setString(2,pw);
		ResultSet rs=stmt.executeQuery();
		
		if(rs.next()) {
			
			resultMap = new HashMap<String,Object>();
			resultMap.put("studentNo",rs.getInt("studentNo"));
			//디버깅
			System.out.println(rs.getInt("studentNo"));	
		}
		//DB자원 반납
		conn.close();
		return resultMap;
		}

	
	public static void main(String[] args) {
		// TODO Auto-generated method stub

	}
	
}
