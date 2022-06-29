package common;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;

import javax.servlet.ServletContext;

public class JDBConnect {
	
	public Connection con;			// Connection        : 데이터베이스와 연결을 담당
	public Statement stmt;			// Statement         : 인파라미터가 없는 정적 쿼리문을 담당
	public PreparedStatement psmt;	// PreparedStatement : 인파라미터가 있는 동적 쿼리문을 담당
	public ResultSet rs;			// ResultSet         : SELECT 쿼리문의 결과를 저장할때 사용
	
	// 데이터베이스를 연결하기 위한 방법 3가지
	// 1. 기본생성자 생성
	public JDBConnect() { 
		try { // 연결이 안될 때를 대비해 try 사용
			Class.forName("oracle.jdbc.OracleDriver");
			// forName() : new 키워드 대신 클래스명을 통해 직접 객체를 생성하여
			//			   메모리에 로드하는 메서드. 인수로는 오라클 드라이버의 이름을 넣으면 됨.
			
			String url = "jdbc:oracle:thin:@localhost:1521:xe";
			// jdbc:oracle:thin : 오라클의 프로토콜
			// @localhost : 호스트명 (ip주소)
			// 1521 : 포트번호   /   xe : sid, sid : 오라클 식별자인데 보통 xe를 사용하면 됨.
			
			// xe 확인하기 -> cmd 창 -> conn system/1234 -> SELECT instance FROM v$thread;
			
			String id = "green";
			String pw = "1234";
			
			con = DriverManager.getConnection(url, id, pw);
			
			System.out.println("DB 연결 성공 ! (기본생성자)");
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	
	// 2번 방법.
	// web.xml에 직접 입력해서 저장 후 매개변수가 있는 생성자를 이용한 방법
	public JDBConnect(String driver, String url, String id, String pw) {
		try {
			Class.forName(driver);
			
			con = DriverManager.getConnection(url, id, pw);
			
			System.out.println("DB 연결 성공 ! (매개변수가 있는 생성자 이용)");
			
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	
	// 3번 방법.
	// 생성자 -> driver의 값을 자동으로 가져오도록 하는 servlet 사용방법
	// (ServletContext) : servlet 구성에 필요한 Bean 설정을 자동으로 가져와 저장
	public JDBConnect(ServletContext application) {
		try {
			String driver = application.getInitParameter("OracleDriver");
			Class.forName(driver);
			
			String url = application.getInitParameter("OracleUrl");
			String id = application.getInitParameter("OracleId");
			String pw = application.getInitParameter("OraclePw");
			
			con = DriverManager.getConnection(url, id, pw);
			
			System.out.println("DB 연결 성공 ! (servlet을 사용한 생성자)");
			
		} catch (Exception e) {
			e.printStackTrace();
		}
	} 
	
	// 연결을 해제하는 메서드
	public void close() {
		try {
			if (rs != null) rs.close();
			if (stmt != null) stmt.close();
			if (psmt != null) psmt.close();
			if (con != null) con.close();
			
			System.out.println("JDBC 자원 해제");
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
}
