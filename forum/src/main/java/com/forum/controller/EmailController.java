package com.forum.controller;

import com.forum.service.EmailVeriService;
import com.forum.util.SendEmailUtil;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import java.util.Date;

@Controller
public class EmailController {
    @Autowired
    SendEmailUtil sendEmailUtil;

    @PostMapping("/test/email")
    @ResponseBody
    public void emailTest() throws Exception {
        String subject = "Java Email Test";
        String to = "yh3250@nyu.edu";
        String content = "This is a test " + new Date().toString();
        sendEmailUtil.sendMail(to, subject, content);
    }

    @Autowired
    EmailVeriService emailVeriService;

    @GetMapping("/register")
    @ResponseBody
    public String sendVerification(String to, HttpSession httpSession) {
        String content = String.format("Hi %s, Thanks for registering! Here's your " +
                "verification code:", to);
        String veriCode = emailVeriService.veriEmail(to, content);
        httpSession.setAttribute("code", veriCode);
        String response = "Please check your email for verification code!";
        return response;
    }

    @GetMapping("/resetpwd")
    @ResponseBody
    public String resetPwd(String to, HttpSession httpSession) {
        String content = String.format("Hi %s, You are receiving this email because you are trying to reset" +
                " the password! Here's your " +
                "verification code:", to);
        String veriCode = emailVeriService.veriEmail(to, content);
        httpSession.setAttribute("code", veriCode);
        String response = "Please check your email for verification code!";
        return response;
    }

    @GetMapping("/test/checkveri")
    @ResponseBody
    //TODO: Change return type to Boolean
    public String checkCode(String code, HttpServletRequest request) {
        HttpSession session = request.getSession(false);
        if (session == null) {

            return "Code not sent!";
        }
        String Code = (String) session.getAttribute("code");
        if (code.equals(Code)) {
            return "Code is correct!";
        }
        return "Code not correct!";
    }


}
