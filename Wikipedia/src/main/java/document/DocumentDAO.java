package document;

import java.util.List;
import java.util.Map;
import java.util.Vector;

import javax.servlet.ServletContext;

import docontent.DocontentDAO;
import docontent.DocontentDTO;
import utils.JDBConnect;

public class DocumentDAO extends JDBConnect {
	public DocumentDAO (ServletContext application) {
		super(application);
	}
	//JDBC연결
	
	//문서 개수 세기
	public int selectCount(Map<String,Object> map) {
		int totalCount = 0; // 결과값(게시물 개수) 저장 
		String query ="SELECT COUNT(*) FROM DOCUMENT ";
		if(map.get("searchWord") != null){
			query += " where " +map.get("searchField")+ " " + "like '%"+map.get("searchWord")+"%'";
		}
		
		try {
			stmt = con.createStatement();
			rs = stmt.executeQuery(query);
			rs.next();
			totalCount = rs.getInt(1);
		}catch(Exception e) {
			System.out.println("문서의 개수를 계산하는 중에 예외가 발생되었음");
			e.printStackTrace();
		}
		
		return totalCount;
	}
	
	
	//문서 목록 반환
	public List<DocumentDTO> selectListPage(Map<String,Object> map){
		List<DocumentDTO> bbs= new Vector<DocumentDTO>();
		
		String query = "SELECT * FROM document";
		
		if(map.get("searchWord") != null){
			query += " where " +map.get("searchField")+ " " + "like '%"+map.get("searchWord")+"%'";
		}
		
		query += " ORDER BY docnum DESC";
		
		try {
			stmt = con.createStatement();
			
			rs = stmt.executeQuery(query);
			while(rs.next()) {
				DocumentDTO dto = new DocumentDTO();
				dto.setDocnum(rs.getString("docnum")); //번호
				dto.setTitle(rs.getString("title"));//제목
				dto.setId(rs.getString("id")); // 작성자
				dto.setGoodcount(rs.getString("goodcount")); // 추천수
				dto.setWritedate(rs.getDate("writedate")); // 작성일

				bbs.add(dto);//결과를 목록에 저장 
			}
		} catch (Exception e) {
			System.out.println("게시물 조회 중 예외 발생");
			e.printStackTrace();
		}
		return bbs;
	}
	
	//문서 상세보기
	public DocumentDTO selectView(String docnum) {
		DocumentDTO dto = new DocumentDTO();
		String query = "SELECT  * FROM DOCUMENT WHERE docnum = ? ";
		System.out.println("docnum = "+ docnum);
		try {
			psmt = con.prepareStatement(query);
			psmt.setString(1,docnum);
			rs = psmt.executeQuery();
			
			if(rs.next()) {
				dto.setDocnum(rs.getString("docnum"));
				dto.setId(rs.getString("id"));
				dto.setTitle(rs.getString("title"));
				dto.setGoodcount(rs.getString("goodcount"));
				dto.setWritedate(rs.getDate("writedate"));
			}
		}catch(Exception e) {
			System.out.println("문서 상세보기 중 예외발생 문서DAO");
			e.printStackTrace();
		}
		
		return dto;
	} 
	
	//write 폼 에서 작성한 문서객체를 DB에 저장
	public int writeDocument(DocumentDTO dto) {
		int result = 0;
		String query = "INSERT INTO document (docnum,title,id) values (wiki_docnum_counter.nextval,?,?)";
		try {
			psmt = con.prepareStatement(query);
			psmt.setString(1,dto.getTitle());
			psmt.setString(2, dto.getId());
			result = psmt.executeUpdate();
			
		}catch(Exception e) {
			System.out.println("문서객체DB저장 중 예외 발생");
			e.printStackTrace();
		}
		
		return result;
	}
	
	//docnum넘겨주는용 selectview
	public DocumentDTO selectView(DocumentDTO dto2) {
		DocumentDTO dto = new DocumentDTO();
		String query = "SELECT  * FROM DOCUMENT WHERE id = ? AND title = ? ";
		try {
			psmt = con.prepareStatement(query);
			psmt.setString(1,dto2.getId());
			psmt.setString(2,dto2.getTitle());
			rs = psmt.executeQuery();
			
			if(rs.next()) {
				dto.setDocnum(rs.getString("docnum"));
				dto.setId(rs.getString("id"));
				dto.setTitle(rs.getString("title"));
				dto.setGoodcount(rs.getString("goodcount"));
				dto.setWritedate(rs.getDate("writedate"));
			}
		}catch(Exception e) {
			System.out.println("문서 상세보기 중 예외발생 문서DAO");
			e.printStackTrace();
		}
		
		return dto;
	}
	
	//DB에 같은 제목의 문서가 존재하는지 확인하는 메서드 
	public int validateTitle(String title) {
		int result = 0;
		String query = "SELECT * from document where title = ?";
		try {
			psmt = con.prepareStatement(query);
			psmt.setString(1, title);
			rs = psmt.executeQuery();
			if(rs.next()) {
				result = 0;
			}else {
				result = 1;
			}
		}catch(Exception e) {
			System.out.println("같은 문서의 제목 확인중 예외 발생");
			e.printStackTrace();
		}
		return result;
	}
	
	 public int editDocument(DocumentDTO dto) {
		 int result= 0;
		 String query = "UPDATE Document set title = ? where docnum = ? ";
		 try {
			 
		 }catch(Exception e) {
			 e.printStackTrace();
		 }
		 
		 return result;
	 }
	
	
	
}
