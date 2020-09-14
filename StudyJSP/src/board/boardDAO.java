package board;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

public class boardDAO {
	public void insertboard(BoardBean bb) {
		System.out.println("BeanDB insert()");
		System.out.println("받은 주소:" + bb );
		System.out.println("주소를 찾아서 Num값 가져옴" + bb.getNum());
		System.out.println("주소를 찾아서 Name값 가져옴" + bb.getName());
		System.out.println("주소를 찾아서 pass값 가져옴" + bb.getPass());
		System.out.println("주소를 찾아서 Subject값 가져옴" + bb.getSubject());
		System.out.println("주소를 찾아서 Content값 가져옴" + bb.getContent());
		System.out.println("주소를 찾아서 Readcount값 가져옴" + bb.getReadcount());
		System.out.println("주소를 찾아서 Date값 가져옴" + bb.getDate());
		
		try {
			Class.forName("com.mysql.jdbc.Driver");
			String dbUrl="jdbc:mysql://localhost:3306/jspDB1?serverTimezone=UTC";
			 String dbUser="jspid";
			 String dbPass="jsppass";
			 Connection con=DriverManager.getConnection(dbUrl, dbUser, dbPass);
			 String sql2="select max(num) from board";
			 PreparedStatement pstmt2=con.prepareStatement(sql2);
			 ResultSet rs=pstmt2.executeQuery();
			 int num =0;
			 if(rs.next()) {
				 num=rs.getInt("max(num)")+1;
			 }
			 
			 String sql="insert into board(num,name, pass, subject, content, readcount, date) values(?,?,?,?,?,?,?)";
			 PreparedStatement pstmt=con.prepareStatement(sql);
			 pstmt.setInt(1, num);
			 pstmt.setString(2, bb.getName());
			 pstmt.setString(3, bb.getPass());
			 pstmt.setString(4, bb.getSubject());
			 pstmt.setNString(5, bb.getContent());
			 pstmt.setInt(6, bb.getReadcount());
			 pstmt.setTimestamp(7, bb.getDate());
			 pstmt.executeUpdate();
		}catch(Exception e) {
			//예외처리
			e.printStackTrace();
		}finally {
			//예외상관없이 처리됨
		}
		
	}
	public BoardBean getBoard(int num){
			BoardBean bb=null;
			try {
						Class.forName("com.mysql.jdbc.Driver");
						String dbUrl="jdbc:mysql://localhost:3306/jspDB1?serverTimezone=UTC";
						 String dbUser="jspid";
						 String dbPass="jsppass";
						 Connection con=DriverManager.getConnection(dbUrl, dbUser, dbPass);
						 String sql2="update board set readcount=readcount+1 where num=?";
						 PreparedStatement pstmt2=con.prepareStatement(sql2);
						 pstmt2.executeUpdate();
						 String sql="select *from board where num=?";
						 PreparedStatement pstmt=con.prepareStatement(sql);
						 pstmt.setInt(1, num);
						 ResultSet rs=pstmt.executeQuery();
						 if(rs.next()) {
							 bb=new BoardBean();
							 bb.setNum(rs.getInt("num"));
							 bb.setName(rs.getString("name"));
							 bb.setPass(rs.getString("pass"));
							 bb.setSubject(rs.getString("subject"));
							 bb.setContent(rs.getString("content"));
							 bb.setReadcount(rs.getInt("readcount"));
							 bb.setDate(rs.getTimestamp("date"));
						 }
			} catch(Exception e) {
				e.printStackTrace();
			}finally {
				
			}
			return bb;
	}
	
}