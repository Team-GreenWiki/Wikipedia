package FreeBoard;

import java.util.Map;

import javax.servlet.ServletContext;

import utils.JDBConnect;

public class FreeBoardDAO extends JDBConnect {

	// 데이터베이스를 연결하기 위해 JDBConnect 상속
	public FreeBoardDAO(ServletContext application) {
		super(application);
	}

	// 게시글 개수를 세는 메서드 생성 -> 개수이기 때문에 int자료형 사용
	/*
	 * public int selectCount(Map<String, Object> map) {
	 * 
	 * int totalCount = 0;
	 * 
	 * String query = "SELECT COUNT(*) FROM FREEBOARD "; }
	 */
}
