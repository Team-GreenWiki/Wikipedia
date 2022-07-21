package common; // 규칙 1 (기본 패키지에 속해야함)

public class Person {

	// 규칙 2 (private으로 사용해야함)
	private String name;
	private int age;
	
	// 규칙 3 (기본생성자가 반드시 있어야함)
	public Person() {}
	
	// 오른쪽 마우스 -> source -> Generate Constructor Using Field (생성자 추가)
	// 인수(매개변수)를 받아 초기화해주는 생성자 추가
	public Person(String name, int age) {
		super();
		this.name = name;
		this.age = age;
	}



	// 규칙 4, 5번 (멤버변수에 접근할 수 있도록 게터와 세터 작성 - 게터 세터의 접근은 public)
	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public int getAge() {
		return age;
	}

	public void setAge(int age) {
		this.age = age;
	}
	
	// 이렇게만 저장하는게 DTO라는 것, DTO 외에 다른 코드는 적으면 안됨 ('규칙 1~5까지만 작성' 되어 있는 코드가 DTO)
	
}