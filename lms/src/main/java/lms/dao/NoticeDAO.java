package lms.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.HashMap;

public class NoticeDAO {
	
	// 공지 리스트 (제목 검색)
	// 파라미터 : String title
	// 사용 페이지: /lms/professor/notice/noticeList.jsp
	// 반환 값 : ArrayList<HashMap<String, Object>> 
	public static ArrayList<HashMap<String, Object>> selectNoticeList (String title , int startRow, int rowperPage) throws Exception {
		
		
		Connection conn = DBHelper.getConnection();
		
		String sql1 = "SELECT  notice_no noticeNo , admin_no adminNo,create_date createDate ,update_date updateDate ,title, content  "
					+ "FROM notice "
					+ "WHERE title like ? "
					+ "LIMIT ? , ?";
			
		PreparedStatement stmt1 = conn.prepareStatement(sql1);
		stmt1.setString(1, "%" + title + "%");
		stmt1.setInt(2, startRow);
		stmt1.setInt(3, rowperPage);
		System.out.println(sql1+"<-----SQL1");
		System.out.println(stmt1);

		ResultSet rs = stmt1.executeQuery();

		   
	    ArrayList<HashMap<String, Object>> list = new ArrayList<HashMap<String, Object>>();	 
	    while(rs.next()) {
	        HashMap<String, Object> m = new HashMap<String, Object>();
	        m.put("noticeNo", rs.getInt("noticeNo"));
	        m.put("adminNo", rs.getInt("adminNo"));
	        m.put("createDate", rs.getString("createDate"));
	        m.put("updateDate", rs.getString("updateDate"));
	        m.put("title", rs.getString("title"));
	        m.put("content", rs.getString("content"));
	     
	        list.add(m);
		
		    }
		
		return list;
	}
	
	//공지 개수 카운트
	//파라미터 : String title
	//반환 값 : int
	//사용 페이지 : /lms/professor/class/classList.jsp
	public static int selectNoticeCount(String title) throws Exception{
		int cnt = 0;
		String sql = null;
		sql = "SELECT COUNT(*) cnt "
				+ "FROM notice "
				+ "WHERE title LIKE ?";
		Connection conn = DBHelper.getConnection();
		PreparedStatement stmt = null;
		stmt = conn.prepareStatement(sql);
		// 검색 값이 0으로 들어왔을 때
		stmt.setString(1, "%" + title + "%");
		
		ResultSet rs = stmt.executeQuery();
		
		if(rs.next()) {
			cnt = rs.getInt("cnt");
		}
		
		return cnt;
	}
	
	
	
	// 공지사항 상세보기
	// 파라미터: int noticeNo
	// 반환 값: HashMap<String, Object>
	public static HashMap<String, Object> selectNotice(int noticeNo) throws Exception {
		Connection conn = DBHelper.getConnection();
		String sql1 ="SELECT notice_no noticeNo,admin_no adminNo, create_date createDate,update_date updateDate,title, content "
				+    "FROM notice "
				+    "WHERE notice_no = ?";
			
		PreparedStatement stmt1 = conn.prepareStatement(sql1);
		System.out.println(sql1+"<-----SQL1");
		
		stmt1.setInt(1,noticeNo);
		
		ResultSet rs1 = stmt1.executeQuery();
		
		HashMap<String, Object> m = new HashMap<String, Object>();
		if(rs1.next()) {
	        m.put("noticeNo", rs1.getInt("noticeNo"));
	        m.put("adminNo", rs1.getString("adminNo"));   
	        m.put("createDate", rs1.getString("createDate"));
	        m.put("updateDate", rs1.getString("updateDate"));
	        m.put("title", rs1.getString("title"));
	        m.put("content", rs1.getString("content"));
	    }
	    return m;
	}
			
	
		
}
