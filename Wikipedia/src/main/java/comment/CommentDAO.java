package comment;

import java.util.ArrayList;
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
	}// 데이터베이스를 연결하기 위해 JDBConnect 상속
	
	//전체 댓글 개수 세기
	public int count_all_comment(String doc_num) {
		int totalcount = 0;
		String query = "Select count(*) total from comments where docnum =? ";
		try {
			psmt = con.prepareStatement(query);
			psmt.setString(1,doc_num);
			rs = psmt.executeQuery();
			rs.next();
			totalcount = Integer.parseInt(rs.getString("total"));
		}catch(Exception e) {
			System.out.println("전체 댓글 수 조회 중 예외 발생");
			e.printStackTrace();
		}
		return totalcount;
	}
	
	// 현재 조회중인(보고있는) 글에서 태그별 댓글 개수 세기
	public ArrayList<Integer> count_Tags(String doc_num) {
		ArrayList<Integer> tag_count_list = new ArrayList<Integer>();
		String query = "SELECT COUNT(*) count FROM COMMENTS WHERE TAGNAME = ? and docnum = ? ";
		String Tag = "";
		try {
			
		psmt = con.prepareStatement(query);
		
		for(int i = 1; i<=4; i++) {
			if(i==1) {
				Tag = "PURPOSE";
				}
			if(i==2) {
				Tag = "USING";
				}
			if(i==3) {
				Tag = "MOREINFO";
				}
			if(i==4) {
				Tag = "QNA";
				}
			psmt.setString(1, Tag);
			psmt.setString(2, doc_num);
			rs = psmt.executeQuery();
			rs.next();
			tag_count_list.add(Integer.parseInt(rs.getString("count")));
			}
		
		}catch(Exception e) {
			System.out.println("태그별 댓글 개수 조회 중 예외 발생");
			e.printStackTrace();
		}
		return tag_count_list;
	}
	
	
	

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
	
	
	
	// 해당 태그를 셀렉트에서 선택하고 내용을 작성한뒤, 버튼을 누르면 해당 태그의 댓글이 작성됨
	public int write_comment(CommentDTO dto) {
		if(dto.getTag().equals("태그를 선택하세요.")){
			System.out.println("태그를 선택해야 댓글 작성이 가능합니다.");
			return -2;
		}else {
			int result =0;
			String query = " INSERT INTO comments( docnum, tagname, comnum ,cocontent, id ,writedate ) "
					+ " values ( ? , ?, SEQ_COMMENTS_COMNUM.nextval, ?, ?, sysdate )";
			try {
				psmt = con.prepareStatement(query);
				psmt.setString(1, dto.getDoc_num());
				psmt.setString(2, dto.getTag());
				psmt.setString(3, dto.getCocontent());
				psmt.setString(4, dto.getId());
				result= psmt.executeUpdate();
			}catch(Exception e) {
				System.out.println("댓글 작성중 예외 발생");
				e.printStackTrace();
			}
			return result;
		}
	}
	
	
	//댓글을 수정하는 메서드 
	public int edit_comment(CommentDTO dto) {
		int result = 0;
		String query = " UPDATE comments SET tagname= ? , cocontent = ? , writedate = sysdate "
				+ " where comnum = ?";
		try {
			psmt = con.prepareStatement(query);
			psmt.setString(1,dto.getTag() );
			psmt.setString(2, dto.getCocontent());
			psmt.setString(3,dto.getComnum());
			result = psmt.executeUpdate();
		}catch(Exception e) {
			System.out.println("댓글 수정 중 예외 발생");
			e.printStackTrace();
		}
		return result;
	}
	
	public CommentDTO bring_origin_comment(String comnum) {
		CommentDTO dto = new CommentDTO();
		String query = " select * from comments where comnum = ? ";
		try {
			psmt  = con.prepareStatement(query);
			psmt.setString(1, comnum);
			rs = psmt.executeQuery();
			rs.next();
			
			dto.setDoc_num(rs.getString("docnum"));
			dto.setCocontent(rs.getString("cocontent"));
			dto.setId(rs.getString("id"));
			dto.setTag(rs.getString("tagname"));
			dto.setComnum(rs.getString("comnum"));
			dto.setWritedate(rs.getDate("writedate"));

		}catch(Exception e) {
			e.printStackTrace();
		}
		return dto;
	}
	
	public int delete_comment (CommentDTO dto) {
		int result = 0;
		String query = "delete from comments where docnum = ? and comnum = ?  ";
		try {
			psmt = con.prepareStatement(query);
			psmt.setString(1, dto.getDoc_num() );
			psmt.setString(2, dto.getComnum());
			result = psmt.executeUpdate();
		}catch(Exception e) {
			System.out.println("댓글 삭제 중 예외 발생");
			e.printStackTrace();
		}
		return result;
	}
	

}
