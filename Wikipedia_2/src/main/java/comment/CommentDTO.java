package comment;

import java.sql.Date;

public class CommentDTO {
	private String doc_num;
	private String comnum;
	private String tag;
	private String id;
	private String cocontent;
	private Date writedate;
	
	
	public String getDoc_num() {
		return doc_num;
	}
	
	public void setDoc_num(String doc_num) {
		this.doc_num = doc_num;
	}
	
	public String getComnum() {
		return comnum;
	}
	
	public void setComnum(String comnum) {
		this.comnum = comnum;
	}
	
	public String getTag() {
		return tag;
	}
	
	public void setTag(String Tag) {
		this.tag = Tag;
	}
	
	public String getId() {
		return id;
	}
	
	public void setId(String id) {
		this.id = id;
	}
	
	public String getCocontent() {
		return cocontent;
	}
	
	public void setCocontent(String cocontent) {
		this.cocontent = cocontent;
	}
	
	public Date getWritedate() {
		return writedate;
	}
	
	public void setWritedate(Date writedate) {
		this.writedate = writedate;
	}
	
	
}
