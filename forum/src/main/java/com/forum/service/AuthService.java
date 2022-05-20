package com.forum.service;

import com.forum.dto.LoginRequest;
import com.forum.dto.RegisterRequest;
import com.forum.model.User;
import com.forum.repository.UserDao;
import com.forum.security.JwtProvider;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.authentication.AuthenticationManager;
import org.springframework.security.authentication.UsernamePasswordAuthenticationToken;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Service;

import java.sql.Timestamp;
import java.util.Date;

@Service
public class AuthService {
    @Autowired
    private UserDao userDao;

    @Autowired
    private PasswordEncoder passwordEncoder;

    @Autowired
    private AuthenticationManager authenticationManager;

    @Autowired
    private JwtProvider jwtProvider;

    public User accountCreate(RegisterRequest registerRequest) {
        User user = new User();
        user.setUsername(registerRequest.getUsername());
        user.setPassword(encodePassword(registerRequest.getPwd()));
        user.setEmail(registerRequest.getEmail());
        user.setGender(registerRequest.getGender());
        Date date = new Date();
        Timestamp time = new Timestamp(date.getTime());
        user.setCreated_at(time);
        user.setCity("Unknown");
        User save = userDao.save(user);
        System.out.println(save);
        return save;
    }

    private String encodePassword(String pwd) {
        return passwordEncoder.encode(pwd);
    }

    public String login(LoginRequest request) {
        Authentication authenticate = authenticationManager.authenticate(new UsernamePasswordAuthenticationToken(request.getUsername(),
                request.getPassword()));
        SecurityContextHolder.getContext().setAuthentication(authenticate);
        return  jwtProvider.generateToken(userDao.findByUsername(request.getUsername()).get());
    }
}
