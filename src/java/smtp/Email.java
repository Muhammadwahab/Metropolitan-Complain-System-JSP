/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package smtp;

import java.util.Properties;
import javax.mail.Message;
import javax.mail.PasswordAuthentication;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;

/**
 *
 * @author waqas
 */
public class Email {
   public Email(String EmailId,long Code) {
        
         String to =EmailId;
          long code=Code;

      // Sender's email ID needs to be mentioned
      String from = "wahab.masood3@gmail.com";

      // Assuming you are sending email from localhost
      String host = "smtp.gmail.com";

      // Get system properties
      Properties properties = System.getProperties();

      
      properties.put("mail.smtp.starttls.enable","true"); 
            properties.put("mail.smtp.host",host); 
                  properties.put("mail.smtp.user",from);
                        properties.put("mail.smtp.password","08061995"); 
                              properties.put("mail.smtp.port",587); 
                                    properties.put("mail.smtp.auth","true"); 

      // Get the default Session object.
      Session session = Session.getInstance(properties,new javax.mail.Authenticator(){
        protected PasswordAuthentication getPasswordAuthentication() {
            return new PasswordAuthentication(
                "wahab.masood3@gmail.com", "pakistanzindabad123456/*-");// Specify the Username and the PassWord
        }
});
      
try{
      MimeMessage message = new MimeMessage(session);
      message.setFrom(new InternetAddress(from));
      message.addRecipient(Message.RecipientType.TO, new InternetAddress(to));
      message.setSubject("This is the Subject Line!");
      message.setText("your Security code is "+code+EmailId);
      Transport trans=session.getTransport("smtp");
      trans.connect(host,from,"pakistanzindabad123456/*-");
      trans.send(message, message.getAllRecipients());
      System.out.println("Sent message successfully....");
      
     
      trans.close();
      
}catch(Exception e)
{
 System.out.println(e);         

}
    }
}

   
    
    
