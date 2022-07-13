package document;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.ServletContext;

import utils.JDBConnect;

public class DocumentDAO extends JDBConnect {
	public DocumentDAO(ServletContext application) {
		super(application);
	}
	
	// 새로운 문서 저장
	public int writeDoc(DocumentDTO dto) {
		System.out.println("새로운 글 저장 요청 : writeDoc() in DocumentDAO");
		
		int result = 0;
		
		try {
			String sql = "INSERT INTO document VALUES(SEQ_DOCUMENT_NUM.NEXTVAL, ?, ?, ?, 0, SYSDATE)";
			psmt = con.prepareStatement(sql);
			psmt.setString(1, dto.getId());
			psmt.setString(2, dto.getDoc_title());
			psmt.setString(3, dto.getDoc_content());
			result = psmt.executeUpdate();
			
			System.out.println("새로운 글 저장 완료 : writeDoc() in DocumentDAO");
		} catch(Exception e) {
			System.out.println("새로운 글 저장 중 예외 발생 : writeDoc() in DocumentDAO");
			e.printStackTrace();
		}
		
		return result;
	} // writeDoc()
	
	// 모든 DocumentDTO 반환
	public List<DocumentDTO> getAllDocument() {
		System.out.println("Document 목록 반환 요청 : getAllDocument() in DocumentDAO");
		
		List<DocumentDTO> list = new ArrayList<>();
		
		try {
			String sql = "SELECT * FROM document ORDER BY doc_num DESC";
			stmt = con.createStatement();
			rs = stmt.executeQuery(sql);
			
			while(rs.next()) {
				DocumentDTO dto = new DocumentDTO();
				
				dto.setDoc_num(rs.getString("doc_num"));
				dto.setId(rs.getString("id"));
				dto.setDoc_title(rs.getString("doc_title"));
				dto.setDoc_content(rs.getString("doc_content"));
				dto.setGoodcount(rs.getString("goodcount"));
				dto.setWritedate(rs.getDate("writedate"));
				
				list.add(dto);
			}
			
			System.out.println("Document 목록 반환 완료 : getAllDocument() in DocumentDAO");
		} catch(Exception e) {
			System.out.println("Document 목록 반환 중 예외 발생 : getAllDocument() in DocumentDAO");
		}
		
		return list;
	} // getAllDocument()
	
	// 해당 doc_num의 DocumentDTO 반환
	public DocumentDTO getDocumentDTO(String doc_num) {
		System.out.printf("%s번 DocumentDTO 반환 요청 : getDocumentDTO() in DocumentDAO", doc_num);
		
		DocumentDTO dto = new DocumentDTO();
		
		try {
			String sql = String.format("SELECT * FROM document WHERE doc_num = %s", doc_num);
			stmt = con.createStatement();
			rs = stmt.executeQuery(sql);
			
			// DocumentDTO에 해당값 저장
			rs.next();
			dto.setDoc_num(rs.getString("doc_num"));
			dto.setId(rs.getString("id"));
			dto.setDoc_title(rs.getString("doc_title"));
			dto.setDoc_content(rs.getString("doc_content"));
			dto.setGoodcount(rs.getString("goodcount"));
			dto.setWritedate(rs.getDate("writedate"));
			
			System.out.printf("%s번 DocumentDTO 반환 완료 : getDocumentDTO() in DocumentDAO", doc_num);
		} catch(Exception e) {
			System.out.printf("%s번 DocumentDTO 반환 중 예외 발생 : getDocumentDTO() in DocumentDAO", doc_num);
			e.printStackTrace();
		}
		
		return dto;
	} // getDocumentDTO()
	
	// 기존 문서 수정
	public int updateDoc(DocumentDTO dto) {
		System.out.printf("%s번 문서 DB 수정 요청 : updateDoc() in DocumentDAO", dto.getDoc_num());
		
		int result = 0;
		
		try {
			String sql = "UPDATE document SET doc_title=?, doc_content=? WHERE doc_num=?";
			psmt = con.prepareStatement(sql);
			psmt.setString(1, dto.getDoc_title());
			psmt.setString(2, dto.getDoc_content());
			psmt.setString(3, dto.getDoc_num());
			result = psmt.executeUpdate();
			
			System.out.printf("%s번 문서 DB 수정 완료 : updateDoc() in DocumentDAO", dto.getDoc_num());
		} catch(Exception e) {
			System.out.printf("%s번 문서 DB 수정 중 예외 발생 : updateDoc() in DocumentDAO", dto.getDoc_num());
		}
		
		return result;
	} // updateDoc()
} // class
