package document;

import java.util.List;
import java.util.Map;
import java.util.Vector;

import javax.servlet.ServletContext;

import utils.JDBConnect;

public class DocumentDAO extends JDBConnect {
	public DocumentDAO (ServletContext application) {
		super(application);
	}
	//JDBC연결
	
	//게시글 목록 반환
	public List<DocumentDTO> selectList(Map<String,Object> map){
		List<DocumentDTO> bbs= new Vector<DocumentDTO>();
		
		String query = "SELECT * FROM Document";
		
		if(map.get("searchWord") != null){
			query += " where " +map.get("searchField")+ " " + "like '%"+map.get("searchWord")+"%'";
		}
		
		query += " ORDER BY num DESC";
		
		try {
			stmt = con.createStatement();
			
			rs = stmt.executeQuery(query);
			while(rs.next()) {
				DocumentDTO dto = new DocumentDTO();
				dto.setDocnum(rs.getInt("docnum")); //번호
				dto.setTitle(rs.getNString("title"));//제목
				dto.setId(rs.getNString("content")); // 작성자
				dto.setGoodcount(0); // 추천수
				dto.setWritedate(null); // 작성일

				bbs.add(dto);//결과를 목록에 저장 
			}
		} catch (Exception e) {
			System.out.println("게시물 조회 중 예외 발생");
			e.printStackTrace();
		}
		return bbs;
	}
	
}
