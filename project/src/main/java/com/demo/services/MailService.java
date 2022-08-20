package com.demo.services;

public interface MailService {

	public void sendMail(String sender, String receiver, String subject, String content);

}
