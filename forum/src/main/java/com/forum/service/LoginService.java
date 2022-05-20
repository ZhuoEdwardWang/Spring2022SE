package com.forum.service;

import com.forum.model.User;
import com.forum.repository.UserDao;
import com.forum.util.MD5Util;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.sql.*;

@Service
public class LoginService {
    @Resource
    private UserDao userDao;

    public boolean userLogin(String email, String pwd) throws SQLException {
//        Iterable<User> QueryResult = userDao.findAll();
        Connection connection = DriverManager.getConnection("jdbc:mysql://localhost:3306/forum?useSSL=false", "root", "12345");
        String sql = String.format("SELECT user_id FROM users WHERE email = '%s'", email);
        System.out.println(sql);
        Statement statement = connection.createStatement();
        ResultSet QueryResult = statement.executeQuery(sql);
//        connection.close();
        if (QueryResult == null) {
            return false;
        } else {
            QueryResult.next();
            Long userid = QueryResult.getLong("user_id");
            User user = userDao.findById(userid).get();
            String storedPwd = user.getPassword();
            String cypherPwd = MD5Util.getMD5(pwd);
            if (storedPwd.equals(cypherPwd)) {
                System.out.println("Password Match!");
                connection.close();
                return true;
            }
            else {
                System.out.println(String.format("Password given %s and password stored %s don't match!", cypherPwd, storedPwd));
                connection.close();
            }
        }
        connection.close();
        return false;
    }
}
