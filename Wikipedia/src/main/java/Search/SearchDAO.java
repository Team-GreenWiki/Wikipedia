package Search;

import java.util.Map;

import javax.servlet.ServletContext;

import utils.JDBConnect;

public class SearchDAO extends JDBConnect{
	
	public SearchDAO(ServletContext application) {
		super (application);
	}
	
	
}