package bbs;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

public class free_BbsDAO {
	
	private Connection conn;
	private ResultSet rs;
	
	public free_BbsDAO() {
		try {
			String dbURL = "jdbc:mysql://localhost:3306/learncode";
			String dbID = "root";
			String dbPassword = "yryr0216";
			Class.forName("com.mysql.jdbc.Driver");
			conn = DriverManager.getConnection(dbURL, dbID, dbPassword);
		} catch (Exception e) {   //예외처리
			e.printStackTrace();   //어떤 오류인지 출력
		}
	}
	
	public String getDate() {
		String SQL = "SELECT NOW()";
		try {
			PreparedStatement pstmt = conn.prepareStatement(SQL);
			rs = pstmt.executeQuery();
			if (rs.next()) {
				return rs.getString(1); //날짜 그대로 반환
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return ""; //빈문장을 출력함으로서 데이터베이스 오류를 알림
	}
	
	public int getNext() {
		String SQL = "SELECT bbsID FROM free_bbs ORDER BY bbsID DESC ";
		try {
			PreparedStatement pstmt = conn.prepareStatement(SQL);
			rs = pstmt.executeQuery();
			if (rs.next()) {
				return rs.getInt(1) + 1; //1을 더해서 다음 게시글의 번호가 들어갈 수 있도록 
			}
			return 1; //현재가 첫 번째 게시글일 경우
		} catch (Exception e) {
			e.printStackTrace();
		}
		return -1; //빈문장을 출력함으로서 데이터베이스 오류를 알림
	}
	
	public int write(String bbsTitle, String username, String bbsContent) {
		String SQL = "INSERT INTO free_bbs VALUE (?, ?, ?, ?, ?, ?)";
		try {
			PreparedStatement pstmt = conn.prepareStatement(SQL);
			pstmt.setInt(1, getNext());
			pstmt.setString(2, bbsTitle);
			pstmt.setString(3, username);
			pstmt.setString(4, getDate());
			pstmt.setString(5, bbsContent);
			pstmt.setInt(6, 1);
			return pstmt.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
		}
		return -1; //빈문장을 출력함으로서 데이터베이스 오류를 알림
	}
	
	public ArrayList<Bbs> getList(int pageNumber) {
		String SQL = "SELECT * FROM free_bbs WHERE bbsID < ? AND bbsAvailable = 1 ORDER BY bbsID DESC LIMIT 10";
		ArrayList<Bbs> list = new ArrayList<Bbs>();
		
		try {
			PreparedStatement pstmt = conn.prepareStatement(SQL);
			pstmt.setInt(1, getNext() - (pageNumber - 1) * 10);
			rs = pstmt.executeQuery();
			if (rs.next()) {
				Bbs bbs = new Bbs();
				bbs.setBbsID(rs.getInt(1));
				bbs.setBbsTitle(rs.getString(2));
				bbs.setUsername(rs.getString(3));
				bbs.setBbsDate(rs.getString(4));
				bbs.setBbsContent(rs.getString(5));
				bbs.setBbsAvailable(rs.getInt(6));
				list.add(bbs);
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return list;
	}
	
	public boolean nextPage(int pageNumber) {
		
	}
	
}
