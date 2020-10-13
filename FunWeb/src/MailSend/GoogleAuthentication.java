package MailSend;

import javax.mail.Authenticator;
import javax.mail.PasswordAuthentication;

public class GoogleAuthentication extends Authenticator {
	PasswordAuthentication passAuth;
	
	public GoogleAuthentication() {
		passAuth = new PasswordAuthentication("m.dorihosi", "vvbjjtxgukpubfrb");
	}
public PasswordAuthentication getPasswordAuthentication() {
	return passAuth;
}
}
