package com.forum.service;

import com.forum.util.SendEmailUtil;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Service;

import java.util.Random;


@Service
public class EmailVeriService {
    private Integer veriCode;

    @Value("${spring.mail.username}")
    private String from;

    @Autowired
    private SendEmailUtil sendEmailUtil;

    public String veriEmail(String to, String content) {
        Random random = new Random();
        veriCode = random.nextInt(89999) + 10000;
        String strVeri = veriCode.toString();
        String fullContent = content + strVeri;
        sendEmailUtil.sendMail(to, "Here's your verification code!", fullContent);
        return strVeri;
    }

    public String forgetPassword(String to){
        Random random = new Random();
        veriCode = random.nextInt(89999) + 10000;
        String strVeri = veriCode.toString();
        String content = String.format("Hi %s, To reset your password, please type in the verification code given below! Here's your " +
                "verification code: %s", to, strVeri);
        sendEmailUtil.sendMail(to, "Here's your verification code!", content);
        return strVeri;
    }

}
