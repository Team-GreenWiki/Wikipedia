package Search;

public class SearchDTO {

	// 아이디 / 비밀번호 찾기 DTO
	
	private String name;		// 닉네임
	private String email;		// 이메일
	private String id;			// 아이디
	private String checkNum;	// 인증번호
	
	public String getName() {
		return name;
	}
	
	public void setName(String name) {
		this.name = name;
	}
	
	public String getEmail() {
		return email;
	}
	
	public void setEmail(String email) {
		this.email = email;
	}
	
	public String getId() {
		return id;
	}
	
	public void setId(String id) {
		this.id = id;
	}
	
	public String getCheckNum() {
		return checkNum;
	}
	
	public void setCheckNum(String checkNum) {
		this.checkNum = checkNum;
	}
	
}
