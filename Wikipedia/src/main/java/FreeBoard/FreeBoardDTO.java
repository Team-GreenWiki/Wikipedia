package FreeBoard;

import java.util.Date;

public class FreeBoardDTO {

	public String bnum;			// 번호
	public String id;			// 아이디 (작성자)
	public String btitle;		// 제목
	public String bcontent;		// 내용
	public Date bwritedate;		// 작성일
	
	public String getBnum() {
		return bnum;
	}
	
	public void setBnum(String bnum) {
		this.bnum = bnum;
	}
	
	public String getId() {
		return id;
	}
	
	public void setId(String id) {
		this.id = id;
	}
	
	public String getBtitle() {
		return btitle;
	}
	
	public void setBtitle(String btitle) {
		this.btitle = btitle;
	}
	
	public String getBcontent() {
		return bcontent;
	}
	
	public void setBcontent(String bcontent) {
		this.bcontent = bcontent;
	}
	
	public Date getBwritedate() {
		return bwritedate;
	}
	
	public void setBwritedate(Date bwritedate) {
		this.bwritedate = bwritedate;
	}
	
	
	
}
