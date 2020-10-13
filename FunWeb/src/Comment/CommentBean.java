package Comment;

import java.sql.Timestamp;

public class CommentBean {
		private int num;
		private String name;
		private String subject;
		private String content;
		private Timestamp date;
		private int boardnum;
		public int getBoardnum() {
			return boardnum;
		}
		public void setBoardnum(int boardnum) {
			this.boardnum = boardnum;
		}
		public int getNum() {
			return num;
		}
		public void setNum(int num) {
			this.num = num;
		}
		public String getName() {
			return name;
		}
		public void setName(String name) {
			this.name = name;
		}
		public String getSubject() {
			return subject;
		}
		public void setSubject(String subject) {
			this.subject = subject;
		}
		public String getContent() {
			return content;
		}
		public void setContent(String content) {
			this.content = content;
		}
		public Timestamp getDate() {
			return date;
		}
		public void setDate(Timestamp date) {
			this.date = date;
		}
}
