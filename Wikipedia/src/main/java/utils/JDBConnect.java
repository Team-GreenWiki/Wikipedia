package utils;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;

import javax.servlet.ServletContext;

public class JDBConnect {
	
	public Connection con;			// Connection        : �뜲�씠�꽣踰좎씠�뒪�� �뿰寃곗쓣 �떞�떦
	public Statement stmt;			// Statement         : �씤�뙆�씪誘명꽣媛� �뾾�뒗 �젙�쟻 荑쇰━臾몄쓣 �떞�떦
	public PreparedStatement psmt;	// PreparedStatement : �씤�뙆�씪誘명꽣媛� �엳�뒗 �룞�쟻 荑쇰━臾몄쓣 �떞�떦
	public ResultSet rs;			// ResultSet         : SELECT 荑쇰━臾몄쓽 寃곌낵瑜� ���옣�븷�븣 �궗�슜
	
	// �뜲�씠�꽣踰좎씠�뒪瑜� �뿰寃고븯湲� �쐞�븳 諛⑸쾿 3媛�吏�
	// 1. 湲곕낯�깮�꽦�옄 �깮�꽦
	public JDBConnect() { 
		try { // �뿰寃곗씠 �븞�맆 �븣瑜� ��鍮꾪빐 try �궗�슜
			Class.forName("oracle.jdbc.OracleDriver");
			// forName() : new �궎�썙�뱶 ���떊 �겢�옒�뒪紐낆쓣 �넻�빐 吏곸젒 媛앹껜瑜� �깮�꽦�븯�뿬
			//			   硫붾え由ъ뿉 濡쒕뱶�븯�뒗 硫붿꽌�뱶. �씤�닔濡쒕뒗 �삤�씪�겢 �뱶�씪�씠踰꾩쓽 �씠由꾩쓣 �꽔�쑝硫� �맖.
			
			String url = "jdbc:oracle:thin:@localhost:1521:xe";
			// jdbc:oracle:thin : �삤�씪�겢�쓽 �봽濡쒗넗肄�
			// @localhost : �샇�뒪�듃紐� (ip二쇱냼)
			// 1521 : �룷�듃踰덊샇   /   xe : sid, sid : �삤�씪�겢 �떇蹂꾩옄�씤�뜲 蹂댄넻 xe瑜� �궗�슜�븯硫� �맖.
			
			// xe �솗�씤�븯湲� -> cmd 李� -> conn system/1234 -> SELECT instance FROM v$thread;
			
			String id = "green";
			String pw = "1234";
			
			con = DriverManager.getConnection(url, id, pw);
			
			System.out.println("DB �뿰寃� �꽦怨� ! (湲곕낯�깮�꽦�옄)");
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	
	// 2踰� 諛⑸쾿.
	// web.xml�뿉 吏곸젒 �엯�젰�빐�꽌 ���옣 �썑 留ㅺ컻蹂��닔媛� �엳�뒗 �깮�꽦�옄瑜� �씠�슜�븳 諛⑸쾿
	public JDBConnect(String driver, String url, String id, String pw) {
		try {
			Class.forName(driver);
			
			con = DriverManager.getConnection(url, id, pw);
			
			System.out.println("DB �뿰寃� �꽦怨� ! (留ㅺ컻蹂��닔媛� �엳�뒗 �깮�꽦�옄 �씠�슜)");
			
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	
	// 3踰� 諛⑸쾿.
	// �깮�꽦�옄 -> driver�쓽 媛믪쓣 �옄�룞�쑝濡� 媛��졇�삤�룄濡� �븯�뒗 servlet �궗�슜諛⑸쾿
	// (ServletContext) : servlet 援ъ꽦�뿉 �븘�슂�븳 Bean �꽕�젙�쓣 �옄�룞�쑝濡� 媛��졇�� ���옣
	public JDBConnect(ServletContext application) {
		try {
			String driver = application.getInitParameter("OracleDriver");
			Class.forName(driver);
			
			String url = application.getInitParameter("OracleUrl");
			String id = application.getInitParameter("OracleId");
			String pw = application.getInitParameter("OraclePw");
			
			con = DriverManager.getConnection(url, id, pw);
			
			System.out.println("DB �뿰寃� �꽦怨� ! (servlet�쓣 �궗�슜�븳 �깮�꽦�옄)");
			
		} catch (Exception e) {
			e.printStackTrace();
		}
	} 
	
	// �뿰寃곗쓣 �빐�젣�븯�뒗 硫붿꽌�뱶
	public void close() {
		try {
			if (rs != null) rs.close();
			if (stmt != null) stmt.close();
			if (psmt != null) psmt.close();
			if (con != null) con.close();
			
			System.out.println("JDBC �옄�썝 �빐�젣");
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
}
