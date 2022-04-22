package movie.pro.member.service;

import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;
import javax.mail.internet.MimeMessage.RecipientType;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.stereotype.Service;

import movie.pro.member.dto.EmailVo;

@Service("emailService")
public class EmailService {
	
	@Autowired
	protected JavaMailSender mailSender;

	public boolean sendMail(EmailVo email) throws Exception {

		try {

			MimeMessage msg = mailSender.createMimeMessage();

			msg.setSubject(email.getSubject());

			// 일반 텍스트만 전송하려는 경우
			msg.setText(email.getContent());

			msg.setRecipient(RecipientType.TO, new InternetAddress(email.getReceiver()));//수신자 setting

			mailSender.send(msg);

			return true;

		} catch (Exception ex) {

			ex.printStackTrace();

		}

		return false;

	}

}
