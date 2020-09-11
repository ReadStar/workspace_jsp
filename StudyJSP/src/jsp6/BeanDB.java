package jsp6;

public class BeanDB {
	//데이터베이스 연동해서 insert update delete select 작업
	//insert 메서드(멤버함수)
	public void insert(BeanTest1 bt1) { //값을 전달받을 변수
		System.out.println("BeanDB insert()");
		System.out.println("주소:" + bt1 );
		System.out.println("주소를 찾아서 name값 가져옴" + bt1.getName());
		System.out.println("주소를 찾아서 num값 가져옴" + bt1.getNum());
	}
}
