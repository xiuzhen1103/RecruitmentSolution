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
//         mailInfo.setSubject("��������");   
//         mailInfo.setContent("�û���Ϊ["+userName+"]����������Ѿ��޸�Ϊ:"+password+",�������µ�¼");   
//         SimpleMailSender sms = new SimpleMailSender();  
//         sms.sendTextMail(mailInfo);//���������ʽ   
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
        mailInfo.setSubject("java�����ʼ�����");   
        mailInfo.setContent("�����յ�����ʼ���ʱ��...");   
        SimpleMailSender sms = new SimpleMailSender();  
        sms.sendTextMail(mailInfo);//���������ʽ   
	}
}
