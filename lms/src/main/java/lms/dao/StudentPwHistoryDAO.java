package lms.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.HashMap;

public class StudentPwHistoryDAO {
	//학생 비밀번호 변경
		// 파라미터 : int studentNo, String oldpw,String newpw
		// 반환 값 : int
		public static int insertPw(int studentNo, String oldpw,String newpw) throws Exception{
					int row = 0;
					Connection conn = DBHelper.getConnection();
					
					//insert 문에 조건 두개 추가 
					//1. 기존의 비밀번호가 일치할 때
					//2. 새로 생성되는 비밀번호가 가장 최근에 만들어진 비밀먼호 3개와 동일하지 않을 때
					//NOT EXISTS -> 하위 커리의 결과가 비어있는 경우에만 외부 쿼리의 조건이 참이 됨.
					String sql1 = "INSERT INTO student_pw_history (pw, student_no)\n"
							+ "SELECT ?,?\n"
							+ "WHERE (\n"
							+ "    SELECT pw\n"
							+ "    FROM student_pw_history\n"
							+ "    WHERE student_no = ?\n"
							+ "    ORDER BY create_date DESC\n"
							+ "    LIMIT 1\n"
							+ ") = ?\n"
							+ "AND NOT EXISTS (\n"
							+ "    SELECT pw\n"
							+ "    FROM (\n"
							+ "        SELECT pw\n"
							+ "        FROM student_pw_history\n"
							+ "        WHERE student_no = ?\n"
							+ "        ORDER BY create_date DESC\n"
							+ "        LIMIT 3\n"
							+ "    ) AS recent_pw\n"
							+ "    WHERE pw = ?\n"
							+ ")";

					PreparedStatement stmt1 = conn.prepareStatement(sql1);
					System.out.println(sql1+"<-----SQL1");
					
					stmt1.setString(1,newpw);
					stmt1.setInt(2, studentNo);	
					stmt1.setInt(3, studentNo);
					stmt1.setString(4, oldpw);
					stmt1.setInt(5, studentNo);
					stmt1.setString(6,newpw);
					System.out.println(stmt1+"<------stmt1");
					
					row = stmt1.executeUpdate();
					
					conn.close();
					
					return row;
				}
		
		//교수-비밀번호 찾기
		//파라미터 : int id , String email
		//반환값 HashMap<String, Object>
		//사용 페이지: findPwAction.jsp
		public static HashMap<String , Object>selectPw(int id, String email) throws Exception {
			HashMap<String , Object>resultMap=null;
		    // DB접근
		    Connection conn = DBHelper.getConnection();

		    String sql = "SELECT  student_pw_history.student_no, email, pw "
		    		+ "FROM student "
		    		+ "JOIN student_pw_history ON student.student_no = student_pw_history.student_no "
		    		+ "WHERE student.student_no = ? AND student.email = ? "
		    		+ "ORDER BY create_date DESC LIMIT 1";	  
			PreparedStatement stmt = null;
		    ResultSet rs = null;
		    stmt = conn.prepareStatement(sql);

		    // 디버깅
		    System.out.println(stmt + "studentPwHistoryDAO findPwAction.jsp stmt");

		    stmt.setInt(1, id);
		    stmt.setString(2, email);

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
