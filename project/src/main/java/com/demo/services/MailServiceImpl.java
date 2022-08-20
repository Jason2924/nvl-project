package com.demo.services;

import javax.mail.internet.MimeMessage;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.mail.javamail.MimeMessageHelper;
import org.springframework.stereotype.Service;

@Service("mailService")
public class MailServiceImpl implements MailService {

	@Autowired
	private JavaMailSender javaMailSender;

	@Override
	public void sendMail(String sender, String receiver, String subject, String content) {
		try {
			MimeMessage mimeMessage = javaMailSender.createMimeMessage();
			MimeMessageHelper mimeMessageHelper = new MimeMessageHelper(mimeMessage, true);
			mimeMessageHelper.setFrom(sender);
			mimeMessageHelper.setTo(receiver);
			mimeMessageHelper.setSubject(subject);
			mimeMessageHelper.setText(content, true);
			javaMailSender.send(mimeMessage);
		} catch (Exception e) {
			System.err.println("MailServiceImp - sendMail :\n" + e.getMessage());
		}
	}
	
}
