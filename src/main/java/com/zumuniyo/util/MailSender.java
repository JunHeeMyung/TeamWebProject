package com.zumuniyo.util;

import java.util.Properties;
import javax.mail.*;
import javax.mail.internet.*;

public class MailSender {

	String senderName;
	String senderEmail;
	String receiverEmail;
	String subject;
	String content;
	String host = "smtp.naver.com";

	public MailSender(String senderName, String senderEmail, String receiverEmail, String subject, String content) {
		super();
		this.senderName = senderName;
		this.senderEmail = senderEmail;
		this.receiverEmail = receiverEmail;
		this.subject = subject;
		this.content = content;
	}

	public boolean sendMail() {

		Properties properties = System.getProperties();
		properties.put("mail.transfer.protocol", "smtp");
		properties.put("mail.smtp.port", 587);
		properties.put("mail.smtp.starttls.enable", "true");
		properties.put("mail.smtp,auth", "true");
		properties.put("mail.smtp.ssl.protocols","TLSv1.2");
		

		Session session = Session.getInstance(properties);

		MimeMessage message = new MimeMessage(session);
		try {

			message.setFrom(new InternetAddress(senderEmail, senderName, "UTF-8"));
			message.addRecipient(Message.RecipientType.TO, new InternetAddress(receiverEmail));
			message.setSubject(subject, "UTF-8");
			message.setContent(content, "text/plain;charset=UTF-8");

			Transport transport = session.getTransport("smtp");

			transport.connect(host, "llk22", "Zumun1234");
			transport.sendMessage(message, message.getAllRecipients());
			transport.close();

			return true;

		} catch (Exception e) {
			e.printStackTrace();
			return false;
		}

	}
	
	public static void main(String[] args) {
		new MailSender("ZUMUNIYO 이메일인증", "llk22@naver.com", "llk22@naver.com", "테스트 메일입니다.", "내용").sendMail();
	}
	

}
