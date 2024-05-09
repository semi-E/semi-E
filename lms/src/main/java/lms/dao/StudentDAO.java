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
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	public static void main(String[] args) {
		// TODO Auto-generated method stub

	}
	
}
