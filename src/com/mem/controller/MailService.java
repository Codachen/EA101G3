package com.mem.controller;

import java.util.Properties;
import java.util.UUID;

import javax.mail.Authenticator;
import javax.mail.Message;
import javax.mail.MessagingException;
import javax.mail.PasswordAuthentication;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;

public class MailService extends Thread{
	private String url;
	// 設定傳送郵件:至收信人的Email信箱,Email主旨,Email內容
	
	public MailService(String url) {
		this.url=url;
	}
	
	
	@Override
	public void run() {
		sendMail();
	}
	
	public void sendMail() {
	   try {
		   // 設定使用SSL連線至 Gmail smtp Server
		   Properties props = new Properties();
		   props.put("mail.smtp.host", "smtp.gmail.com");
		   props.put("mail.smtp.socketFactory.port", "465");
		   props.put("mail.smtp.socketFactory.class","javax.net.ssl.SSLSocketFactory");
		   props.put("mail.smtp.auth", "true");
		   props.put("mail.smtp.port", "465");

       // ●設定 gmail 的帳號 & 密碼 (將藉由你的Gmail來傳送Email)
       // ●須將myGmail的【安全性較低的應用程式存取權】打開
	     final String myGmail = "xuanjia961121@gmail.com";
	     final String myGmail_password = "xuan961121";
		   Session session = Session.getInstance(props, new Authenticator() {
			   protected PasswordAuthentication getPasswordAuthentication() {
				   return new PasswordAuthentication(myGmail, myGmail_password);
			   }
		   });

		   Message message = new MimeMessage(session);
		   message.setFrom(new InternetAddress(myGmail));
		   message.setRecipients(Message.RecipientType.TO,InternetAddress.parse("xuanjia961121@gmail.com"));	  	  
		   //設定信中的主旨  
		   message.setSubject("歡迎加入萌寵家族的會員");
		   //設定信中的內容 
		   message.setText(url);

		   Transport.send(message);
		   System.out.println("傳送成功!");
     }catch (MessagingException e){
	     System.out.println("傳送失敗!");
	     e.printStackTrace();
     }
   }
	

	
//	 public static void main (String args[]){
//
//      String to = "pn093750793123@gmail.com";
//      
//      String subject = "密碼通知";
//      
//            
//      String ch_name = "peter1";
//      //ramdon password
//      String passRandom = UUID.randomUUID().toString().substring(0, 8);
//      String messageText = "Hello! " + ch_name + " 請謹記此密碼: " + passRandom + "\n" +" (已經啟用)"; 
//       
//      MailService mailService = new MailService();
//      mailService.sendMail(to, subject, messageText);
//
//   }


}
