package jsp6;

public class BeanTest1 {
	//자바빈
	//폼에서 입력해 온 파라미터 값을 저장해서 DB작업하는 파일에 전달
	//멤버변수 데이터 은닉(같은 클래스 접근가능, 외부에서는 접근 불가)
	private String name;
	private int num;
	//멤버함수(메서드) : 은닉시킨 멤버변수를 접근할 수 있는 메서드 정의
	//name 값을 전달해서 저장 setName()
	//name 값을 가져와서 리턴(전달) getName()
	//num 값을 전달해서 저장 setNum()
	//num 멤버변수 값을 가져와서 리턴(전달) getNum()
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public int getNum() {
		return num;
	}
	public void setNum(int num) {
		this.num = num;
	}
	
}
