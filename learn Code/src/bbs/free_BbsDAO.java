package bbs;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.HashMap;

public class free_BbsDAO {

	private Connection conn;
	private ResultSet rs;
	public int total;

	public free_BbsDAO() {
		try {
			String dbURL = "jdbc:mysql://localhost:3306/learncode";
			String dbID = "root";
			String dbPassword = "yryr0216";
			Class.forName("com.mysql.jdbc.Driver");
			conn = DriverManager.getConnection(dbURL, dbID, dbPassword);
		} catch (Exception e) { // ����ó��
			e.printStackTrace(); // � �������� ���
		}
	}

	public String getDate() {
		String SQL = "SELECT NOW()";
		try {
			PreparedStatement pstmt = conn.prepareStatement(SQL);
			rs = pstmt.executeQuery();
			if (rs.next()) {
				return rs.getString(1); // ��¥ �״�� ��ȯ
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return ""; // ������ ��������μ� �����ͺ��̽� ������ �˸�
	}

	public int getNext() {
		String SQL = "SELECT bbsID FROM free_bbs ORDER BY bbsID DESC ";
		try {
			PreparedStatement pstmt = conn.prepareStatement(SQL);
			rs = pstmt.executeQuery();
			if (rs.next()) {
				return rs.getInt(1) + 1; // 1�� ���ؼ� ���� �Խñ��� ��ȣ�� �� �� �ֵ���
			}
			return 1; // ���簡 ù ��° �Խñ��� ���
		} catch (Exception e) {
			e.printStackTrace();
		}
		return -1; // ������ ��������μ� �����ͺ��̽� ������ �˸�
	}
	
//    public int getBoardListCount(HashMap<String, Object> listOpt)
//    {
//        int result = 0;
//        String opt = (String)listOpt.get("opt"); // �˻��ɼ�(����, ����, �۾��� ��..)
//        String condition = (String)listOpt.get("condition"); // �˻�����
//        
//        try {
//            conn = DBConnection.getConnection();
//            StringBuffer sql = new StringBuffer();
//            
//            if(opt == null)    // ��ü���� ����
//            {
//                sql.append("select count(*) from MEMBER_BOARD");
//                pstmt = conn.prepareStatement(sql.toString());
//                
//                // StringBuffer�� ����.
//                sql.delete(0, sql.toString().length());
//            }
//        }
//    }
//	
//	public int getAll() {
//		total = 0;
//		String SQL = "SELECT COUNT(*) FROM free_bbs WHERE bbsAvailable='1'";
//		try {
//			PreparedStatement pstmt = conn.prepareStatement(SQL);
//			rs = pstmt.executeQuery();
//			
//			if (rs.next()) {
//				total = rs.getInt(1);
//			} else {
//				total = 0;
//			}
//		} catch (Exception e) {
//			e.printStackTrace();
//		}
//		return 0;
//	}

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
		return -1; // ������ ��������μ� �����ͺ��̽� ������ �˸�
	}

	public ArrayList<Bbs> getList(int pageNumber) {
		String SQL = "SELECT * FROM free_bbs WHERE bbsID < ? AND bbsAvailable = 1 ORDER BY bbsID DESC LIMIT 10";
//		bbsID�� Ư���� ���ں��� �۰�, ������ ���� �ʾƼ� available�� 1�� �۵� /order by bbsID�� �ؼ� bbsID�� �������� ����(desc) �ϰ� 10���� ������ 
		ArrayList<Bbs> list = new ArrayList<Bbs>();

		try {
			PreparedStatement pstmt = conn.prepareStatement(SQL);
			pstmt.setInt(1, getNext() - (pageNumber - 1) * 10);
//			getNext: �������� �ۼ��� ���� ��ȣ
			rs = pstmt.executeQuery();
			while (rs.next()) {
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
		String SQL = "SELECT * FROM free_bbs WHERE bbsID < ? AND bbsAvailable = 1 ORDER BY bbsID DESC LIMIT 10";
		try {
			PreparedStatement pstmt = conn.prepareStatement(SQL);
			pstmt.setInt(1, getNext() - (pageNumber - 1) * 10);
			rs = pstmt.executeQuery();
			if (rs.next()) {
				return true;
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return false;
	}
	
	public Bbs getBbs(int bbsID) {
		String SQL = "SELECT * FROM free_bbs WHERE bbsID = ?";
		try {
			PreparedStatement pstmt = conn.prepareStatement(SQL);
			pstmt.setInt(1, bbsID);
			rs = pstmt.executeQuery();
			if (rs.next()) {
				Bbs bbs = new Bbs();
				bbs.setBbsID(rs.getInt(1));
				bbs.setBbsTitle(rs.getString(2));
				bbs.setUsername(rs.getString(3));
				bbs.setBbsDate(rs.getString(4));
				bbs.setBbsContent(rs.getString(5));
				bbs.setBbsAvailable(rs.getInt(6));
				return bbs;
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return null;
	}
	
	public int update(int bbsID, String bbsTitle, String bbsContent) {
		String SQL = "UPDATE free_bbs SET bbsTitle = ?, bbsContent = ? WHERE bbsID = ?";
		try {
			PreparedStatement pstmt = conn.prepareStatement(SQL);
			pstmt.setString(1, bbsTitle);
			pstmt.setString(2, bbsContent);
			pstmt.setInt(3, bbsID);
			return pstmt.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
		}
		return -1; // ������ ��������μ� �����ͺ��̽� ������ �˸�
	}
	
	public int delete(int bbsID) {
		String SQL = "UPDATE free_bbs SET bbsAvailable = 0 WHERE bbsID = ?";
		try {
			PreparedStatement pstmt = conn.prepareStatement(SQL);
			pstmt.setInt(1, bbsID);
			return pstmt.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
		}
		return -1; // ������ ��������μ� �����ͺ��̽� ������ �˸�
	}
}
