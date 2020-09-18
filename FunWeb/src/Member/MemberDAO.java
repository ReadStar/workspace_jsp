package Member;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;

public class MemberDAO {
	//1,2 디비연결 메서드
		public Connection getConnection() throws Exception {
			//예외처리를 함수 호출하는 곳에서 처리하도록 설정
			Connection con=null;
			Class.forName("com.mysql.jdbc.Driver");
			String dbUrl="jdbc:mysql://localhost:3306/jspDB1?serverTimezone=UTC";
			 String dbUser="jspid";
			 String dbPass="jsppass";
			 con=DriverManager.getConnection(dbUrl, dbUser, dbPass);
			 return con;
		}
		public void insertMember(MemberBean mb) {
			System.out.println("BeanDB insert()");
			System.out.println("받은 주소:" + mb );
			System.out.println("주소를 찾아서 Id값 가져옴" + mb.getId());
			System.out.println("주소를 찾아서 pass값 가져옴" + mb.getPass());
			System.out.println("주소를 찾아서 Name값 가져옴" + mb.getName());
			System.out.println("주소를 찾아서 Email값 가져옴" + mb.getEmail());
			System.out.println("주소를 찾아서 Address값 가져옴" + mb.getAddress());
			System.out.println("주소를 찾아서 Phone값 가져옴"+ mb.getPhone());
			System.out.println("주소를 찾아서 Mobile값 가져옴"+ mb.getMobile());
			System.out.println("주소를 찾아서 pass값 가져옴" + mb.getDate());

			try {
				//예외발생코드
				//1,2단계 디비연결 메서드 호출
				Connection con =getConnection();
				 String sql="insert into member(id, pass, name, date) values(?,?,?,?)";
				 PreparedStatement pstmt=con.prepareStatement(sql);
				 pstmt.setString(1, mb.getId());
				 pstmt.setString(2, mb.getPass());
				 pstmt.setString(3, mb.getName());
				 pstmt.setTimestamp(4, mb.getDate());
				 pstmt.executeUpdate();
			}catch(Exception e) {
				//예외처리
				e.printStackTrace();
			}finally {
				//예외상관없이 처리됨
			}
		}
		
}//클래스 마지막단