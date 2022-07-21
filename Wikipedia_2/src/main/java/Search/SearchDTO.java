package Search;

public class SearchDTO {

	// 아이디 / 비밀번호 찾기 DTO
	
	private String id;			// 아이디
	private String name;		// 닉네임
	private String pw;			// 비밀번호
	private String email;		// 이메일
	private String grade;		// 회원분류
	private String signdate;	// 가입날짜
	
	
	public String getId() {
		return id;
	}
	
	public void setId(String id) {
		this.id = id;
	}
	
	public String getName() {
		return name;
	}
	
	public void setName(String name) {
		this.name = name;
	}
	
	public String getPw() {
		return pw;
	}
	
	public void setPw(String pw) {
		this.pw = pw;
	}
	
	public String getEmail() {
		return email;
	}
	
	public void setEmail(String email) {
		this.email = email;
	}
	
	public String getGrade() {
		return grade;
	}
	
	public void setGrade(String grade) {
		this.grade = grade;
	}
	
	public String getSigndate() {
		return signdate;
	}
	
	public void setSigndate(String signdate) {
		this.signdate = signdate;
	}
	
	
}
