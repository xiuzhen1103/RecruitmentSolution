package util.mail;

import java.util.ResourceBundle;

public class SendMailUtil {

	public static void main(String[] args){
	     MailSenderInfo mailInfo = new MailSenderInfo();   
	     mailInfo.setMailServerHost("smtp.qq.com");   
	     mailInfo.setMailServerPort("25");   
	     mailInfo.setValidate(true); 
	     
	     //read config
	     mailInfo.setUserName("123");
	     mailInfo.setFromAddress("123@qq.com");   
	     mailInfo.setPassword("123");
	     

   	    mailInfo.setToAddress("456@qq.com");   
        mailInfo.setSubject("java发送邮件测试");   
        mailInfo.setContent("当你收到这封邮件的时候...");   
        SimpleMailSender sms = new SimpleMailSender();  
        sms.sendTextMail(mailInfo);//发送文体格式   
	}
}
