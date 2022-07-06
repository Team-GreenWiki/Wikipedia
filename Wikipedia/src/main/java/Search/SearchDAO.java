package Search;

import java.util.Map;

import javax.servlet.ServletContext;

import utils.JDBConnect;

public class SearchDAO extends JDBConnect{
	
	// 기본생성자 (DB 연결)
	public SearchDAO(ServletContext application) {
		super (application);
	}
	
	public SearchDTO getSearchDTO(String userId, String userPw) {
		SearchDTO dto = new SearchDTO();
		
		try {
			String query = "SELECT * "
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
			System.out.println("객체 생성 중 예외 발생");
			e.printStackTrace();
		}
		
		return dto;
	}
	
	
	
	
}