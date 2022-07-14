package comment;

import java.util.List;
import java.util.Map;
import java.util.Vector;

import javax.servlet.ServletContext;

import oracle.net.nt.ConnectDescription;
import utils.JDBConnect;

public class CommentDAO extends JDBConnect{
	public CommentDAO(ServletContext application) {
		super(application);
		// TODO Auto-generated constructor stub
	}

	// 데이터베이스를 연결하기 위해 JDBConnect 상속
	// 현재 조회중인(보고있는) 글에서 태그별 댓글 개수 세기

	// 태그를 누르면 해당 태그의 댓글 불러오기
	//리스트를 오버로딩 해서 태그에 따라 그 태그를 불러오는 쿼리문을 별개로 작성해놓고 댓글을 불러와야함.
	public List<CommentDTO> show_comment_list(String docnum, String Tag) {
		List<CommentDTO> bbs = new Vector<CommentDTO>();
		
		String query = "SELECT * FROM comments where docnum = ? ";
		try {
			if(!Tag.equals("ALL")) {
				query += " AND TAGNAME = " + "'"+Tag+"'";
			}
			psmt = con.prepareStatement(query);
			psmt.setString(1, docnum);
			rs = psmt.executeQuery();
			
			while(rs.next()) {
				CommentDTO dto = new CommentDTO(); 
				dto.setDoc_num(rs.getString("docnum"));
				dto.setComnum(rs.getString("comnum"));
				dto.setTag(rs.getString("tagname"));
				dto.setId(rs.getString("id"));
				dto.setCocontent(rs.getString("cocontent"));
				dto.setWritedate(rs.getDate("writedate"));
				
				bbs.add(dto);
			}
			
		}catch(Exception e) {
			System.out.println("댓글을 불러오는중 예외가 발생하였습니다.");
			e.printStackTrace();
		}
		
		return bbs;
	}
	
	
	
	// 해당 댓글을 불러온 상태에서 댓글을 작성하고 버튼을 누르면 해당 태그의 댓글이 작성됨
	
	

	
	
	
	//태그를 누르면 해당 태그의 댓글 불러오기
	
	//해당 댓글을 불러온 상태에서 댓글을 작성하고 버튼을 누르면 해당 태그의 댓글이 작성됨 
	
	

	

}
