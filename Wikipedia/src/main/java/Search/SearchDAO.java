package Search;

import java.util.Map;

import javax.servlet.ServletContext;

import utils.JDBConnect;

public class SearchDAO extends JDBConnect{
	
	// 기본생성자 (DB 연결)
	public SearchDAO(ServletContext application) {
		super (application);
	}
	
	// 아이디 찾기
	public SearchDTO getSearchId (String userName, String userEmail) {
		
		SearchDTO dto = new SearchDTO();
		
		try {
			String query = "SELECT * "
						 + " FROM MEMBER "
						 + " WHERE NAME = ? AND EMAIL = ?";
			
			psmt = con.prepareStatement(query);
			psmt.setString(1, "userName");
			psmt.setString(2, "userEmail");
			rs = psmt.executeQuery();
			
			while (rs.next()) {
				dto.setName(rs.getString("NAME"));
				dto.setEmail(rs.getString("EMAIL"));
			}
			
		} catch (Exception e) {
			System.out.println("아이디 찾기 중 예외 발생");
			e.printStackTrace();
		}
		
		return dto;
	}
	
	// 비밀번호 찾기
	public SearchDTO getSearchPw (String userId, String userEmail) {
		
		SearchDTO dto = new SearchDTO();
		
		try {
			
			String query = " SELECT * "
					 + " FROM MEMBER "
					 + " WHERE ID = ? AND EMAIL = ?";
		
			psmt = con.prepareStatement(query);
			psmt.setString(1, "userId");
			psmt.setString(2, "userEmail");
			rs = psmt.executeQuery();
			
			while (rs.next()) {
				dto.setId(rs.getString("ID"));
				dto.setEmail(rs.getString("EMAIL"));
			}
			
		} catch (Exception e) {
			System.out.println("비밀번호 찾기 중 예외 발생");
			e.printStackTrace();
		}
		
		return dto;
	}
	
	
	
}