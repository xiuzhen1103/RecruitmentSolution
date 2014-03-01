package util.mail;

import java.util.ResourceBundle;

public class SendMailUtil {


//	
//	public static void sendMail(String userName,String sendToEamil,String password){
//	     MailSenderInfo mailInfo = new MailSenderInfo();   
//	     mailInfo.setMailServerHost("smtp.qq.com");   
//	     mailInfo.setMailServerPort("25");   
//	     mailInfo.setValidate(true); 
//	     
//	     //read config
//	     mailInfo.setUserName(rb.getString("yourEmailAccount"));
//	     mailInfo.setFromAddress(rb.getString("yourEmailAddress"));   
//	     mailInfo.setPassword(rb.getString("yourEmailPassword"));
//	     
//
//    	 mailInfo.setToAddress(sendToEamil);   
//         mailInfo.setSubject("密码重置");   
//         mailInfo.setContent("用户名为["+userName+"]，你的密码已经修改为:"+password+",请你重新登录");   
//         SimpleMailSender sms = new SimpleMailSender();  
//         sms.sendTextMail(mailInfo);//发送文体格式   
//	}
	
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
