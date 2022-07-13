package docontent;

import javax.servlet.ServletContext;

import document.DocumentDTO;
import utils.JDBConnect;

public class DocontentDAO extends JDBConnect {
	
	public DocontentDAO(ServletContext application) {
		super(application);
	}

	
		//게시물 상세보기 
	public DocontentDTO selectView(String docnum) {
		DocontentDTO dto = new DocontentDTO();
		String query = "SELECT * FROM docontent WHERE docnum = ?";

		try {
			psmt = con.prepareStatement(query);
			psmt.setString(1, docnum);
			rs = psmt.executeQuery();
			System.out.println("docnum = "+ docnum);
			
			
			if(rs.next())		 
			{
				dto.setSubtitle1(rs.getString("subtitle1"));
				dto.setContent1(rs.getString("content1"));
				dto.setSubtitle2(rs.getString("subtitle2"));
				dto.setContent2(rs.getString("content2"));
				dto.setSubtitle3(rs.getString("subtitle3"));
				dto.setContent3(rs.getString("content3"));
				dto.setSubtitle4(rs.getString("subtitle4"));
				dto.setContent4(rs.getString("content4"));
				dto.setSubtitle5(rs.getString("subtitle5"));
				dto.setContent5(rs.getString("content5"));
				dto.setDocnum(rs.getString("docnum"));
			}				

			
		}catch (Exception e) {
			System.out.println("문서 상세보기중 예외 발생");
			e.printStackTrace();
		}
		return dto;
	}
	
	
	//게시물 작성하는 메서드
	public int writeDocontent(DocontentDTO dto,DocumentDTO dto2) {
		int result = 0;
			String query = "INSERT INTO docontent (docnum,subtitle1,subtitle2,subtitle3,subtitle4,";
					query += "subtitle5,content1,content2,content3,content4,content5)";
					query += "values(?,?,?,?,?,?,?,?,?,?,?)";
			try {
				psmt = con.prepareStatement(query);
				psmt.setString(1,dto2.getDocnum() );
				psmt.setString(2, dto.getSubtitle1());
				psmt.setString(3, dto.getSubtitle2());
				psmt.setString(4, dto.getSubtitle3());
				psmt.setString(5, dto.getSubtitle4());
				psmt.setString(6, dto.getSubtitle5());
				psmt.setString(7, dto.getContent1());
				psmt.setString(8, dto.getContent2());
				psmt.setString(9, dto.getContent3());
				psmt.setString(10, dto.getContent4());
				psmt.setString(11, dto.getContent5());
				result = psmt.executeUpdate();
				
			}catch(Exception e) {
				System.out.println("문서 작성 중 예외 발생");
				e.printStackTrace();
			}
			return result;
		}
	
	//게시글의 내용을 갱신하는 메서드 
	 public int editDocontent(DocontentDTO dto) {
		 int result= 0;
		 String query = "UPDATE Docontent set subtitle1 = ? , subtitle2 = ? ,subtitle3 = ? ,subtitle4 = ? ,subtitle5 = ?, "
				 + "content1 = ?, content2 = ?, content3 = ?, content4 = ?, content5 = ? where docnum = ? ";
		 try {
			 psmt = con.prepareStatement(query);
			 psmt.setString(1, dto.getSubtitle1());
			 psmt.setString(2, dto.getSubtitle2());
			 psmt.setString(3, dto.getSubtitle3());
			 psmt.setString(4, dto.getSubtitle4());
			 psmt.setString(5, dto.getSubtitle5());
			 psmt.setString(6, dto.getContent1());
			 psmt.setString(7, dto.getContent2());
			 psmt.setString(8, dto.getContent3());
			 psmt.setString(9, dto.getContent4());
			 psmt.setString(10, dto.getContent5());
			 psmt.setString(11, dto.getDocnum());
			 result = psmt.executeUpdate();
			 System.out.println("내용 업데이트 중");
		 }catch(Exception e) {
			 e.printStackTrace();
		 }
		 
		 return result;
	 }
	 
	 
	 //문서내용 객체를 DB에서 삭제하는 메서드 
	 public int deleteDocontent(DocontentDTO dto) {
			int result=0;
			try {
				String query = "DELETE FROM docontent WHERE docnum=?";
				psmt = con.prepareStatement(query);
				psmt.setString(1, dto.getDocnum());
				result = psmt.executeUpdate();
			}catch (Exception e) {
				e.printStackTrace();
				System.out.println("문서내용 삭제 중 예외 발생");
			}
			return result;
		}
}
