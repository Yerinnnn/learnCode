package user;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

public class UserDAO {
	private Connection conn;  //�����ͺ��̽��� �������ְ� �ϴ� ��ü
	private PreparedStatement pastmt;
	private ResultSet rs;   //��� ������ ���� �� �ִ� ��ü
	
//	�ڿ������� �����ͺ��̽� Ŀ�ؼ��� �̷���� �� �ֵ���
	public UserDAO() {
		try {
			String dbURL = "jdbc:mysql://localhost:3306/learncode";
//			String dbURL = "jdbc:mysql://localhost:3306/learncode?serverTimezone=UTC&useSSL=false";
			String dbID = "root";
			String dbPassword = "yryr0216";
			Class.forName("com.mysql.cj.jdbc.Driver"); //mysql ����̹��� ã�� �� �ֵ���
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
		String SQL ="SELECT password FROM learnCode WHERE username = ?;";
		try {
			//������ sql ������ �����ͺ��̽��� �����ϴ� �������� �ν���Ʈ�� ������
			pastmt = conn.prepareStatement(SQL);
			//���� �߿��� �κ�, sql �ε��� ���� ��ŷ ����� ����ϱ� ���� ����	
			pastmt = setString(1, username); 
			rs = pastmt.executeQuery();   //����� ����
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
private PreparedStatement setString(int i, String username) {
	// TODO Auto-generated method stub
	return null;
}
	
}
