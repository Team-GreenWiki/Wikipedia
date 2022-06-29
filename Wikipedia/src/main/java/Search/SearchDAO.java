package Search;

import javax.servlet.ServletContext;

import common.JDBConnect;

public class SearchDAO extends JDBConnect{

	// DB연결
	public SearchDAO(ServletContext application) {
		super(application);
	}
	
	
}
