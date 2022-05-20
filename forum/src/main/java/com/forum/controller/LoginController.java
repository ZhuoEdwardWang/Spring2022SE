package com.forum.controller;

import com.forum.service.LoginService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import java.sql.SQLException;


@Controller
public class LoginController {
    @Autowired
    private LoginService loginService;

//    @GetMapping("/login")
//    @ResponseBody
//    public boolean userLogin(String email,
//                             String pwd,
//                             HttpServletRequest request) throws SQLException {
//        boolean status = loginService.userLogin(email, pwd);
//        if (request.getSession().getAttribute("userInfo") == null){
//            System.out.println("There's an account in login status! Logging out now.");
//            logout(request);
//        }
//        if (status) {
//            request.getSession().setAttribute("userInfo", email);
//        }
//        return status;
//    }
//
//    @GetMapping(value = "/logout")
//    @ResponseBody
//    public boolean logout(HttpServletRequest request) {
//        HttpSession session = request.getSession();
//
//        session.removeAttribute("userInfo");
//
//        Object userInfo = session.getAttribute("userInfo");
//        if (userInfo == null) {
//            return true;
//        } else {
//            return false;
//        }
//
//    }


}
