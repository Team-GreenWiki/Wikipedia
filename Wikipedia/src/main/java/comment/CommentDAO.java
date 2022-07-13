package comment;

import java.util.Map;

import javax.servlet.ServletContext;

import utils.JDBConnect;

public class CommentDAO extends JDBConnect{

	// 데이터베이스를 연결하기 위해 JDBConnect 상속
	
	public CommentDAO(ServletContext application) {
		super(application);
	}
	
	
	
	
	
	// 태그를 누르면 해당 태그의 댓글 불러오기
	
	
	// 해당 댓글을 불러온 상태에서 댓글을 작성하고 버튼을 누르면 해당 태그의 댓글이 작성됨
	

	

}
