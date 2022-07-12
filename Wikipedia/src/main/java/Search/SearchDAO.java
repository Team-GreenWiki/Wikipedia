package Search;

import java.util.Map;

import javax.servlet.ServletContext;

import utils.JDBConnect;

public class SearchDAO extends JDBConnect {
	
	// 기본생성자 (DB 연결)
	public SearchDAO(ServletContext application) {
		super (application);
	}
	
	// 아이디 찾기
	public String getSearchId (String userName, String userEmail) {
		System.out.println("userName : " + userName);
		System.out.println("userEmail : " + userEmail);
		
		String result = "";
		
		SearchDTO dto = new SearchDTO();
		
		try {
			String query = "SELECT * "
						 + " FROM MEMBER "
						 + " WHERE NAME = ? AND EMAIL = ?";
			
			psmt = con.prepareStatement(query);
			psmt.setString(1, userName);
			psmt.setString(2, userEmail);
			rs = psmt.executeQuery();
			// 유저가 입력한 닉네임과 이메일을 가진 멤버테이블의 아이디 조회
			
			rs.next();
			System.out.println("ID : " + rs.getString("ID"));
			result = rs.getString("ID");
			
		} catch (Exception e) {
			System.out.println("아이디 찾기 중 예외 발생");
			e.printStackTrace();
		}
		
		System.out.println(result);
		return result;
	}
	
	// 비밀번호 찾기
	public String getSearchPw (String userId, String userEmail) {
		
		System.out.println("userId : " + userId);
		System.out.println("userEmail : " + userEmail);
		
		String result2 = "";
		
		SearchDTO dto = new SearchDTO();
		
		try {
			String query = "SELECT * "
						 + " FROM MEMBER "
						 + " WHERE ID = ? AND EMAIL = ?";
			
			psmt = con.prepareStatement(query);
			psmt.setString(1, userId);
			psmt.setString(2, userEmail);
			rs = psmt.executeQuery();
			
			rs.next();
			System.out.println("PW : " + rs.getString("PW"));
			result2 = rs.getString("PW");
			
		} catch (Exception e) {
			System.out.println("비밀번호 찾기 중 예외 발생");
			e.printStackTrace();
		}
		
		System.out.println(result2);
		return result2;
	}
	
	
	
}