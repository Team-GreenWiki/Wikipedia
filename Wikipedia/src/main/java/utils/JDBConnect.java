package utils;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;

import javax.servlet.ServletContext;

public class JDBConnect {
	public Connection con;
	public Statement stmt;
	public PreparedStatement psmt;
	public ResultSet rs;
	
	public JDBConnect(ServletContext application) {
		try {
			String driver = application.getInitParameter("OracleDriver");
			String url = application.getInitParameter("OracleUrl");
			String id = application.getInitParameter("OracleId");
			String pw = application.getInitParameter("OraclePw");
			
			Class.forName(driver);
			con = DriverManager.getConnection(url, id, pw);
			
			System.out.println("DB ����");
		} catch(Exception e) {
			System.out.println("DB ������ ���� �߻� : JDBConnect() in JDBConnect");
			e.printStackTrace();
		}
	}
	
	public void close() {
		try {
			if(rs != null) rs.close();
			if(psmt != null) psmt.close();
			if(stmt != null) stmt.close();
			if(con != null) con.close();
			
			System.out.println("DB ���� ����");
		} catch(Exception e) {
			System.out.println("DB ���� ������ ���� �߻� : close() in JDBConnect");
			e.printStackTrace();
		}
	}
}
