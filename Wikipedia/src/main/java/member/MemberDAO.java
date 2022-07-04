package member;

import javax.servlet.ServletContext;

import utils.JDBConnect;

public class MemberDAO extends JDBConnect {
	// 기본생성자(DB 접속)
	public MemberDAO(ServletContext application) {
		super(application);
	}
	
	// ID와 PW를 입력받아 해당하는 MemberDTO 반환
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
				
				System.out.printf("%s의 MemberDTO 생성 완료\n", userId);
			}
		} catch(Exception e) {
			System.out.printf("%s의 MemberDTO 생성 중 예외 발생 : getMemberDTO() in MemberDAO\n", userId);
			e.printStackTrace();
		}
		
		return dto;
	} // getMemberDTO()
	
	// 회원가입 처리
	public int signupMember(MemberDTO dto) {
		int result = 0;
		
		try {
			String query = "INSERT INTO MEMBER(ID, PW, NAME, EMAIL, GRADE) "
						 + "VALUES(?, ?, ?, ?, PUBLIC)";
			psmt = con.prepareStatement(query);
			psmt.setString(1, dto.getId());
			psmt.setString(2, dto.getPw());
			psmt.setString(3, dto.getName());
			psmt.setString(4, dto.getEmail());
			result = psmt.executeUpdate();
			
			System.out.println("회원가입 처리 완료");
		} catch(Exception e) {
			System.out.println("회원가입 처리 중 예외 발생 : signupMember() in MemberDAO\n");
			e.printStackTrace();
		}
		
		return result;
	}
} // class
