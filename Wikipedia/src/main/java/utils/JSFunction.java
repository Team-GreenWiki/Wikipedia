package utils;

import javax.servlet.jsp.JspWriter;

public class JSFunction {

	// 메시지에 대한 알림창을 표시한 후 특정 url로 이동하는 스크립트 코드 추가
	public static void alertLocation(String msg, String url, JspWriter out) {
		try {
			String script = ""
						+ "<script>"
						+ " alert('" + msg + "');"
						+ " location.href ='" + url + "';"
						+ "</script>";
			out.println(script);
		} catch (Exception e) {}
		
		
		}
	
	// 메시지 알림창을 표시한 후 이전 페이지로 돌아가기 위한 코드
			public static void alertBack(String msg, JspWriter out) {
				try {
					String script = ""
									+ "<script>"
									+ " alert('" + msg + "');"
									+ " history.back();"
									+ "</script>";
					out.println(script);
				} catch (Exception e) {}
	}
}