package com.forum.controller;

import com.forum.model.User;
import com.forum.repository.UserDao;
import com.forum.service.UserService;
import com.forum.util.MD5Util;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import java.sql.Timestamp;
import java.util.Date;
import java.util.Optional;


@Controller
public class UserController {
    @Autowired
    private UserService userService;

    @GetMapping("/user/show")
    @ResponseBody
    public Iterable<User> findUsers() {
        return userService.findUsers();
    }

    @GetMapping("user/find")
    @ResponseBody
    public User findOne(Long id) {
        return userService.findOne(id);
    }


    @PostMapping("/user/register")
    @ResponseBody
    public User save(@RequestParam("name") String name,
                     @RequestParam("pwd") String pwd,
                     @RequestParam("email") String email,
                     @RequestParam("gender") String gender) {

        return userService.accountCreate(name, pwd, email, gender);
//
    }

    @PostMapping("/user/update/email")
    @ResponseBody
    public String updateEmail(@RequestParam("id") Long id,
                              @RequestParam("email") String email) {
        if (userService.updateEmail(id, email)){
            return "Email Updated!";
        }
        else{
            return "Update Failed!";
        }
    }

    @PostMapping("/user/update/username")
    @ResponseBody
    public String updateUserName(@RequestParam("id") Long id,
                                 @RequestParam("username") String username) {
        User user = findOne(id);
        if (user.getUser_id().equals(id)) {
            user.setUsername(username);
            return "Username update success";
        } else {
            return "Username update Failed! User id is not stored";
        }
    }

    @PostMapping("/user/update/tel")
    @ResponseBody
    public String updateTel(@RequestParam("id") Long id,
                            @RequestParam("tel") Long tel) {
        User user = findOne(id);
        if (user.getUser_id().equals(id)) {
            user.setTel(tel);
            return "Telephone update success";
        } else {
            return "Telephone update Failed! User id is not stored";
        }
    }

    @PostMapping("/user/update/city")
    @ResponseBody
    public String updateCity(@RequestParam("id") Long id,
                             @RequestParam("city") String city) {
        User user = findOne(id);
        if (user.getUser_id().equals(id)) {
            user.setCity(city);
            return "City update success";
        } else {
            return "City update Failed! User id is not stored";
        }
    }

    @PostMapping("/user/update/pwd")
    @ResponseBody
    public String updatePwd(@RequestParam("id") Long id,
                            @RequestParam("new_pwd") String new_pwd) {
        User user = findOne(id);
        if (user.getUser_id().equals(id)) {
            user.setPwd(new_pwd);
            Timestamp timestamp = new Timestamp(new Date().getTime());
            user.setUpdated_at(timestamp);
            String response = "Pwd of" + id.toString() + " is updated at:" + timestamp;
            return response;
        }
        else {
            return "Pwd update failed! User not found";
        }
    }

}
