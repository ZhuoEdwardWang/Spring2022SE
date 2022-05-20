package com.forum.controller;


import com.forum.dto.LoginRequest;
import com.forum.dto.RegisterRequest;
import com.forum.service.AuthService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;

@RestController
@RequestMapping("/api/auth")
public class AuthController {
    @Autowired
    private AuthService authService;


    @PostMapping("/register")
    public ResponseEntity signup(@RequestBody RegisterRequest request){
        authService.accountCreate(request);
        return new ResponseEntity(HttpStatus.OK);
    }

    @PostMapping("/login")
    public String login(@RequestBody LoginRequest request){
        return(authService.login(request));
    }
}
