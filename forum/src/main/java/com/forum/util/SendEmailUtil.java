package com.forum.util;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.mail.javamail.MimeMessageHelper;
import org.springframework.stereotype.Component;


import javax.mail.MessagingException;
import javax.mail.internet.MimeMessage;

@Component
public class SendEmailUtil {


    @Autowired
    private JavaMailSender mailSender;

    @Value("${spring.mail.username}")
    private String from;

    public void sendMail(String to, String subject, String content) {
        try {
            //创建一个发送邮件的类
            MimeMessage message = mailSender.createMimeMessage();
            //使用发送邮件的帮助类
            MimeMessageHelper helper = new MimeMessageHelper(message);
            //发送人
            helper.setFrom(from);
            //接收人
            helper.setTo(to);
            //发送的主题
            helper.setSubject(subject);
            //以html的形式的邮件内容
            helper.setText(content, true);
            //发送邮件
            mailSender.send(helper.getMimeMessage());
        } catch (MessagingException e) {
            System.out.println("Email Failed");
        }
    }
}