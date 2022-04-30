package com.forum.service;

import com.forum.model.User;
import com.forum.repository.UserDao;
import com.forum.util.MD5Util;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.annotation.Resource;
import java.sql.Timestamp;
import java.util.Date;
import java.util.Optional;

@Service
public class UserService {
    @Resource
    private UserDao userDao;

    public User accountCreate(String name, String pwd, String email, String gender) {
        User user = new User();
        user.setUsername(name);
        String hashPwd = MD5Util.getMD5(pwd);
        user.setPwd(hashPwd);
        user.setEmail(email);
        user.setGender(gender);
        Date date = new Date();
        Timestamp time = new Timestamp(date.getTime());
        user.setCreated_at(time);
        user.setCity("Unknown");
        User save = userDao.save(user);
        System.out.println(save);
        return save;
    }

    public Iterable<User> findUsers() {
        Iterable<User> findAll = userDao.findAll();
        return findAll;
    }

    public User findOne(Long id) {
        Optional<User> user = userDao.findById(id);
        return user.get();
    }

    public Boolean updateName(Long id, String userName) {
        User user = findOne(id);
        if (user == null) {
            return false;
        } else {
            if (userName != "") {
                user.setUsername(userName);
                return true;
            }
        }
        return false;
    }

    public Boolean updateCity(Long id, String city) {
        User user = findOne(id);
        if (user == null) {
            return false;
        } else {
            if (city != "") {
                user.setCity(city);
                return true;
            }
        }
        return false;
    }

    public Boolean updateStatus(Long id, String wu) {
        User user = findOne(id);
        if (user == null) {
            return false;
        } else {
            if (wu != "") {
                user.setWhats_up(wu);
                return true;
            }
        }
        return false;

    }

    public Boolean updateTel(Long id, Long tel) {
        User user = findOne(id);
        if (user == null) {
            return false;
        } else {
            if (tel != null) {
                user.setTel(tel);
                return true;
            }
        }
        return false;

    }

    public Boolean updateGender(Long id, String gender) {
        User user = findOne(id);
        if (user == null) {
            return false;
        } else {
            if (gender != "") {
                user.setCity(gender);
                return true;
            }
        }
        return false;

    }

    public Boolean updateProfilePic(Long id, int picId){
        User user = findOne(id);
        if (user == null){
            return false;
        }
        else{
            if (picId != 0){
                user.setProf_pic_id(picId);
                return true;
            }
        }
        return false;

    }

    public Boolean updateEmail(Long id, String email){
        User user = findOne(id);
        if (user == null){
            return false;
        }
        else{
            if (email != ""){
                user.setCity(email);
                return true;
            }
        }
        return false;

    }
}
