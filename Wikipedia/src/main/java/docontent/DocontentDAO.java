package docontent;

import javax.servlet.ServletContext;

import utils.JDBConnect;

public class DocontentDAO extends JDBConnect {
	
	public DocontentDAO(ServletContext application) {
		super(application);
	}

	public DocontentDTO selectView(String docnum) {
		DocontentDTO dto = new DocontentDTO();
		String query = "SELECT * FROM docontent WHERE docnum = ?";
		System.out.println("docnum = " + docnum);
		try {
			psmt = con.prepareStatement(query);
			psmt.setString(1, docnum);
			rs = psmt.executeQuery();
				
			if(rs.next()) {			 
				
				dto.setSubtitle1(rs.getString("subtitle1"));
				dto.setContent1(rs.getString("content1"));
				dto.setSubtitle1(rs.getString("subtitle2"));
				dto.setContent1(rs.getString("content2"));
				dto.setSubtitle1(rs.getString("subtitle3"));
				dto.setContent1(rs.getString("content3"));
				dto.setSubtitle1(rs.getString("subtitle4"));
				dto.setContent1(rs.getString("content4"));
				dto.setSubtitle1(rs.getString("subtitle5"));
				dto.setContent5(rs.getString("content5"));
				dto.setDocnum(rs.getInt("docnum"));
							
			}

			
		}catch (Exception e) {
			System.out.println("문서 상세보기중 예외 발생");
			e.printStackTrace();
		}
		return dto;
	}
	//
}
