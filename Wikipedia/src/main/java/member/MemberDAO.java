package member;

import javax.servlet.ServletContext;

import utils.JDBConnect;

public class MemberDAO extends JDBConnect {
	// 생성자(DB 접속)
	public MemberDAO(ServletContext application) {
		super(application);
	}
	
	// ID와 PW를 받아 일치하는 MemberDTO 반환
	public MemberDTO getMemberDTO(String userId, String userPw) {
		MemberDTO dto = new MemberDTO();
		
		try {
			String query = "SELECT * "
						 + "FROM MEMBER "
						 + "WHERE ID = ? AND PW = ?";
			psmt = con.prepareStatement(query);
			psmt.setString(1, userId);
			psmt.setString(2, userPw);
			rs = psmt.executeQuery();
			
			if(rs.next()) {
				dto.setId(rs.getString("ID"));
				dto.setPw(rs.getString("PW"));
				dto.setName(rs.getString("NAME"));
				dto.setEmail(rs.getString("EMAIL"));
				dto.setGrade(rs.getString("GRADE"));
				dto.setSigndate(rs.getDate("SIGNDATE"));
				
				System.out.printf("%s의 MemberDTO 생성 완료", userId);
			}
		} catch(Exception e) {
			System.out.printf("%s의 MemberDTO 생성중 예외 발생 : getMemberDTO() in MemberDAO", userId);
			e.printStackTrace();
		}
		
		return dto;
	} // getMemberDTO()
} // class
