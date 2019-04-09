package user;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

public class UserDAO {
	private Connection conn;  //데이터베이스에 접근해주게 하는 객체
	private PreparedStatement pastmt;
	private ResultSet rs;   //어떠한 정보를 담을 수 있는 객체
	
//	자연스럽게 데이터베이스 커넥션이 이루어질 수 있도록
	public UserDAO() {
		try {
			String dbURL = "jdbc:mysql://localhost:3306/learncode";
//			String dbURL = "jdbc:mysql://localhost:3306/learncode?serverTimezone=UTC&useSSL=false";
			String dbID = "root";
			String dbPassword = "yryr0216";
			Class.forName("com.mysql.cj.jdbc.Driver"); //mysql 드라이버를 찾을 수 있도록
//			드라이버: mysql에 접속할 수 있도록 매개체 역할을 해주는 하나의 라이브러리
			conn = DriverManager.getConnection(dbURL, dbID, dbPassword);
//			이렇게 접속이 완료되면 conn에 데이터가 담기게 되는 것
		} catch (Exception e) {   //예외처리
			e.printStackTrace();   //어떤 오류인지 출력
		}
	}
//	여기까지는 접속을 하게 해주는 부분/이제부터는 실제로 로그인을 시도하는 함수 생성
	
	public int login(String username, String password) {
//		인스턴스로 받아온 사용자 아이디가 디비에 존재하는지, 존재한다면 비밀번호는 무엇인지 비교
		String SQL ="SELECT password FROM learnCode WHERE username = ?;";
		try {
			//정해진 sql 문장을 데이터베이스에 삽입하는 형식으로 인스턴트를 가져옴
			pastmt = conn.prepareStatement(SQL);
			//가장 중요한 부분, sql 인덱션 같은 해킹 기법을 방어하기 위한 수단	
			pastmt = setString(1, username); 
			rs = pastmt.executeQuery();   //결과값 삽입
			if (rs.next()) {   //결과가 존재한다면 실행
				if (rs.getString(1).equals(password)) {   //디비의 비밀번호와 같다면
					return 1;   //로그인 성공
				}
				else
					return 0; // 비밀번호 불일치
				
			}
			return -1; // 아이디가 없음
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		return -2; // 데이터베이스 오류
	}
private PreparedStatement setString(int i, String username) {
	// TODO Auto-generated method stub
	return null;
}
	
}
