package member;

import javax.servlet.ServletContext;

import utils.JDBConnect;

public class MemberDAO extends JDBConnect {
	// ������(DB ����)
	public MemberDAO(ServletContext application) {
		super(application);
	}
	
	// ID�� PW�� �޾� ��ġ�ϴ� MemberDTO ��ȯ
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
				
				System.out.printf("%s�� MemberDTO ���� �Ϸ�", userId);
			}
		} catch(Exception e) {
			System.out.printf("%s�� MemberDTO ������ ���� �߻� : getMemberDTO() in MemberDAO", userId);
			e.printStackTrace();
		}
		
		return dto;
	} // getMemberDTO()
} // class
