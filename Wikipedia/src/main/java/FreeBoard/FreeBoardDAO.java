package FreeBoard;

import java.util.List;
import java.util.Map;
import java.util.Vector;

import javax.servlet.ServletContext;

import utils.JDBConnect;

public class FreeBoardDAO extends JDBConnect {

	// 데이터베이스를 연결하기 위해 JDBConnect 상속 -> DB 연결 완료
	public FreeBoardDAO(ServletContext application) {
		super(application);
	}

	// 게시글 개수를 세는 메서드 생성 -> 개수이기 때문에 int자료형 사용
	
	 public int selectCount(Map<String, Object> map) {
	  
	 int totalCount = 0;
	  
	 String query = "SELECT COUNT(*) FROM FREEBOARD ";
	 	
	 	if (map.get("searchWord") != null) {
	 		query += " WHERE " + map.get("searchField")
	 			  +  " LIKE '%" + map.get("searchWord") + "%'";
	 	}
	 	
	 	try {
	 		
	 		stmt = con.createStatement();	// 쿼리 생성
	 		rs = stmt.executeQuery(query);	// 쿼리 실행
	 		rs.next();						// 쿼리 값의 다음값이 있는지 확인
	 		totalCount = rs.getInt(1);		// 첫 번째 값(컬럼)을 가져옴
	 		
	 		
	 	} catch (Exception e) {
	 		
	 		System.out.println("게시물 개수를 확인하는 도중 예외 발생");
	 		e.printStackTrace();
	 	}
	 	
	 	return totalCount;
	 	
	 }
	 
	 
	 // 게시물 목록 반환
	 public List<FreeBoardDTO> selectList(Map<String, Object> map){
			
			List<FreeBoardDTO> fboard = new Vector<FreeBoardDTO>();
			
			String sql = "SELECT * FROM FREEBOARD";
			
			if (map.get("searchWord") != null) {
				sql += " WHERE " + map.get("searchField") 
						+ " LIKE '%" + map.get("searchWord") + "%'";
			}
			
			sql += " ORDER BY bnum DESC";
			
			try {
				
				stmt = con.createStatement(); 	//쿼리문 생성
				
				rs = stmt.executeQuery(sql); 	//쿼리 실행 
				
				while(rs.next()) {
					
					FreeBoardDTO dto = new FreeBoardDTO();
					
					dto.setBnum(rs.getString("bnum")); 				// 번호
					dto.setBtitle(rs.getString("btitle")); 			// 제목
					dto.setBcontent(rs.getString("bcontent")); 		// 내용
					dto.setBwritedate(rs.getDate("bwritedate"));	// 작성일
					dto.setId(rs.getString("id")); 					// 작성자 아이디
					
					fboard.add(dto); 								// 결과를 목록에 저장
					
				}
				
			} catch (Exception e) {
				
				System.out.println("게시물 조회 중 예외 발생");
				e.printStackTrace();
			}
			
			return fboard;
			
		}
	 
	 
	 // 게시글 데이터를 받아 DB에 추가
	 public int insertWrite(FreeBoardDTO dto) {
		 
			int result = 0;
			
			// sql문을 처리하기 위해선 try - catch문을 사용.
			
			try {
				
				String query = " INSERT INTO FREEBOARD (bnum, id, btitle, bcontent) "
							 + " VALUES (seq_wiki_freeboard.nextval, ?, ?, ?)";
				
				psmt = con.prepareStatement(query);
				
				psmt.setString(1, dto.getId());			// 쿼리문에 값넣기 -> psmt.setString()
				psmt.setString(2, dto.getBtitle());
				psmt.setString(3, dto.getBcontent());
				
				result = psmt.executeUpdate();
				
			} catch (Exception e) {
				
				System.out.println("게시물 입력 중 예외 발생");
				e.printStackTrace();
			}
			
			return result;
		}
	 
	 
	 // 게시글 확인하기
	 public FreeBoardDTO selectView(String num) {
			
		 FreeBoardDTO dto = new FreeBoardDTO();
			
			String query = "SELECT F.*, M.name "
					 	+  "FROM MEMBER M INNER JOIN FREEBOARD F "
					 	+  "ON M.id = F.id "
					 	+  "WHERE bnum=?";
			
			try {
				
				psmt = con.prepareStatement(query);
				psmt.setString(1, num);
				rs = psmt.executeQuery();
				
				if (rs.next()) {
					dto.setBnum(rs.getString(1));
					dto.setId(rs.getString(2));
					dto.setBtitle(rs.getString(3));
					dto.setBcontent(rs.getString(4));
					dto.setBwritedate(rs.getDate(5));
				}
				
			} catch(Exception e) {
				
				System.out.println("게시글 상세보기 중 예외 발생");
				e.printStackTrace();
			}
					 	
			return dto;
		}
	 
	 
	// 선택한 게시글 수정하기
		public int updateEdit(FreeBoardDTO dto) {
			int result = 0;
			
			try {
				String query = " UPDATE FREEBOARD "
						 	+  " SET btitle =?, bcontent=? "
						 	+  " Where bnum=?";
				
				psmt = con.prepareStatement(query);
				psmt.setString(1, dto.getBtitle());
				psmt.setString(2, dto.getBcontent());
				psmt.setString(3, dto.getBnum());
				
				result = psmt.executeUpdate();
				
			} catch (Exception e) {
				System.out.println("게시글 수정 중 예외 발생");
				e.printStackTrace();
			}
			
			return result;
		}
		
		
		// 지정한 게시글 삭제하기
		public int deletePost(FreeBoardDTO dto) {
			int result = 0;
			
			try {
				String query = "DELETE FROM FREEBOARD WHERE bnum=?";
				
				psmt = con.prepareStatement(query);
				psmt.setString(1, dto.getBnum());
				
				result = psmt.executeUpdate();
				
			} catch(Exception e) {
				System.out.println("게시글 삭제 중 예외 발생");
				e.printStackTrace();
			}
			
			return result;
		}
	 
}
