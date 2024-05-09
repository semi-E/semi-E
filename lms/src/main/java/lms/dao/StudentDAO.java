package lms.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.HashMap;


//학생 추가
//파라미터: int studentNo, String name, String department,String pw
//반환 값: int
public class StudentDAO {
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
	//loginStudent
	//Param:id,pw
	//반환값:HashMap<String, Object>
	public static HashMap<String, Object>loginStudent(int id , String pw)throws Exception{
		HashMap<String, Object>resultMap=null;
		//DB접근
		Class.forName("org.mariadb.jdbc.Driver");
		Connection conn = DBHelper.getConnection();

		
		String sql = "SELECT student_no studentNo FROM student WHERE student_no = ? AND pw = ?";
		PreparedStatement stmt = conn.prepareStatement(sql);
		stmt.setInt(1, id);
		stmt.setString(2,pw);
		ResultSet rs=stmt.executeQuery();
		
		if(rs.next()) {
			
			resultMap = new HashMap<String,Object>();
			resultMap.put("professorNo",rs.getInt("studentNo"));
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
