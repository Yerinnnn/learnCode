package user;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

public class UserDAO {
	private Connection conn;  //�����ͺ��̽��� �������ְ� �ϴ� ��ü
	private PreparedStatement pstmt;
	private ResultSet rs;   //��� ������ ���� �� �ִ� ��ü
	
//	�ڿ������� �����ͺ��̽� Ŀ�ؼ��� �̷���� �� �ֵ���
	public UserDAO() {
		try {
//			3306:�츮 ��ǻ�Ϳ� ��ġ�� mysql ��ü
			String dbURL = "jdbc:mysql://localhost:3306/learncode";
//			String dbURL = "jdbc:mysql://localhost:3306/learncode?serverTimezone=UTC&useSSL=false";
			String dbID = "root";
			String dbPassword = "yryr0216";
			Class.forName("com.mysql.jdbc.Driver"); //mysql ����̹��� ã�� �� �ֵ���
//			����̹�: mysql�� ������ �� �ֵ��� �Ű�ü ������ ���ִ� �ϳ��� ���̺귯��
			conn = DriverManager.getConnection(dbURL, dbID, dbPassword);
//			�̷��� ������ �Ϸ�Ǹ� conn�� �����Ͱ� ���� �Ǵ� ��
		} catch (Exception e) {   //����ó��
			e.printStackTrace();   //� �������� ���
		}
	}
//	��������� ������ �ϰ� ���ִ� �κ�/�������ʹ� ������ �α����� �õ��ϴ� �Լ� ����
	
	public int login(String username, String password) {
//		�ν��Ͻ��� �޾ƿ� ����� ���̵� ��� �����ϴ���, �����Ѵٸ� ��й�ȣ�� �������� ��
		String SQL ="SELECT password FROM USER WHERE username = ?;";
		try {
			//������ sql ������ �����ͺ��̽��� �����ϴ� �������� �ν���Ʈ�� ������
			pstmt = conn.prepareStatement(SQL);
			//���� �߿��� �κ�, sql �ε��� ���� ��ŷ ����� ����ϱ� ���� ����	
			pstmt.setString(1, username); 
			rs = pstmt.executeQuery();   //����� ����
			if (rs.next()) {   //����� �����Ѵٸ� ����
				if (rs.getString(1).equals(password)) {   //����� ��й�ȣ�� ���ٸ�
					return 1;   //�α��� ����
				}
				else
					return 0; // ��й�ȣ ����ġ
				
			}
			return -1; // ���̵� ����
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		return -2; // �����ͺ��̽� ����
	}

	
	public int register(User user) {   //user Ŭ������ �̿��� �ν��Ͻ�, �� ���� ������ �Է¹��� �� �ֵ���
		String SQL = "INSERT INTO USER VALUES (?, ?, ?);";
		try {
			pstmt = conn.prepareStatement(SQL);
			pstmt.setString(1, user.getUsername());
			pstmt.setString(2, user.getPassword());
			pstmt.setString(3, user.getEmail());
			return pstmt.executeUpdate();   //�ش� statement�� ������ �� ����� ���� �� �ֵ��� �մϴ�
			//insert �������� ������ 0 �̻��� ���ڰ� ��ȯ�Ǳ� ������ -1�� �ƴ϶�� ��� ����
		}
		catch (Exception e){
			e.printStackTrace();
		}
		return -1;	//�����ͺ��̽� ����
	}
	
}
