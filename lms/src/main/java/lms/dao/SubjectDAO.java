package lms.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.HashMap;

public class SubjectDAO {

	//과목 개수 카운트
	//파라미터 : String subjectName
	//반환 값 : int
	//사용페이지 : /professor/class/subjectList.jsp
	public static int selectSubjectCount(String subjectName) throws Exception {
		int cnt = 0;
		String sql = null;
		sql = "SELECT COUNT(*) cnt "
				+ "FROM subject "
				+ "WHERE subject_name like ? ";
		Connection conn = DBHelper.getConnection();
		PreparedStatement stmt = null;
		stmt = conn.prepareStatement(sql);
		stmt.setString(1, "%" + subjectName + "%");
		System.out.println(stmt);
		ResultSet rs = stmt.executeQuery();
		
		if(rs.next()) {
			cnt = rs.getInt("cnt");
		}
		
		return cnt;
	}
	
	//과목 목록
	//파라미터 : String subjectName, int startRow, int rowPerPage
	//반환 값 : ArrayList<HashMap<String, Object>>
	//사용 페이지 : /professor/class/subjectList.jsp//lms/admin/subjects/subjectList.jsp
	public static ArrayList<HashMap<String, Object>> selectSubjectList(String subjectName, int startRow, int rowPerPage) throws Exception{
		ArrayList<HashMap<String, Object>> list = new ArrayList<HashMap<String,Object>>();
		String sql = null;
		sql = "SELECT subject_name subjectName, admin_no adminNo, credit "
				+ "FROM subject "
				+ "WHERE subject_name like ? "
				+ "LIMIT ?, ?";
		System.out.println("SQL Query: " + sql);
		Connection conn = DBHelper.getConnection();
		PreparedStatement stmt = null;
		stmt = conn.prepareStatement(sql);
		stmt.setString(1, "%" + subjectName + "%");
		stmt.setInt(2, startRow);
		stmt.setInt(3, rowPerPage);
		ResultSet rs = stmt.executeQuery();
		
		while(rs.next()) {
			HashMap<String, Object> m = new HashMap<String, Object>();
			m.put("subjectName", rs.getString("subjectName"));
			m.put("adminNo", rs.getInt("adminNo"));
			m.put("credit", rs.getInt("credit"));
			
			list.add(m);
		}
		
		return list;
	}
	
	//과목 추가
	//파라미터 : String subjectName,int credit
	//반환 값 : int
	//사용 페이지 :/subjects/addSubjectAction.jsp
	public static int insertSubject(String subjectName, int adminNO, int credit)throws Exception{
		int row=0;
		String sql="INSERT INTO subject(subject_name , admin_no , credit) "
				+"VALUES (?,?,?)";
		//DB접근
		Connection conn = DBHelper.getConnection();
		PreparedStatement stmt = null;
		stmt= conn.prepareStatement(sql);
		
		stmt.setString(1,subjectName);
		stmt.setInt(2,adminNO);
		stmt.setInt(3,credit);
		//디버깅
		System.out.println(stmt + "<--addSubject stmt" );
		row=stmt.executeUpdate();
		
		conn.close();
		return row;
	}
	
	//과목 삭제
	//파라미터 : String subjectName
	//반환 값 : int
	//사용 페이지 :/subjects/deleteSubjectAction.jsp
	public static int deleteSubject(String subjectName)throws Exception{
		int row=0;
		String sql="DELETE FROM subject "
				+"WHERE subject_name= ? ";
		//DB접근
		Connection conn = DBHelper.getConnection();
		PreparedStatement stmt = null;
		stmt =conn.prepareStatement(sql);
		stmt.setString(1, subjectName);
		//디버깅
		System.out.println(stmt + "<--deleteSubject stmt");
		row=stmt.executeUpdate();
		
		conn.close();
		return row;
	}
	
	
	public static void main(String[] args) {
		// TODO Auto-generated method stub

	}
	

}
