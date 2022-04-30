package com.forum.controller;

import com.forum.service.LoginService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import java.sql.SQLException;


@Controller
public class LoginController {
    @Autowired
    private LoginService loginService;

    @PostMapping("/login")
    @ResponseBody
    public Boolean userLogin(String email, String pwd) throws SQLException {
        Boolean status = loginService.userLogin(email, pwd);
        return status;
    }


}
