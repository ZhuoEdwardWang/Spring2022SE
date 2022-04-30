package com.forum.model;

import javax.persistence.*;
import java.io.Serializable;
import java.sql.Timestamp;
import java.util.Objects;

@Entity
@Table(name = "users")
public class User implements Serializable {

    private static final long serialVersionUID = 1L;

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long user_id;

    private String username;

    private String pwd;

    private String gender;

    private String email;

    private Long tel;

    private String province;

    private String city;

    private int class_of;

    private int prof_pic_id;

    private String whats_up;

    private Timestamp created_at;

    private Timestamp updated_at;

    public User() {

    }

    public User(Long user_id, String username, String email) {
        this.user_id = user_id;
        this.username = username;
        this.email = email;
    }

    public String getPwd() {
        return pwd;
    }

    public void setPwd(String pwd) {
        this.pwd = pwd;
    }

    public Long getUser_id() {
        return user_id;
    }

    public void setUser_id(Long user_id) {
        this.user_id = user_id;
    }

    public String getUsername() {
        return username;
    }

    public void setUsername(String username) {
        this.username = username;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public String getGender() {
        return gender;
    }

    public void setGender(String gender) {
        this.gender = gender;
    }

    public int getClass_of() {
        return class_of;
    }

    public void setClass_of(int class_of) {
        this.class_of = class_of;
    }

    public String getProvince() {
        return province;
    }

    public void setProvince(String province) {
        this.province = province;
    }

    public String getCity() {
        return city;
    }

    public void setCity(String city) {
        this.city = city;
    }

    public Long getTel() {
        return tel;
    }

    public void setTel() {
        this.tel = tel;
    }

    public int getProf_pic_id() {
        return prof_pic_id;
    }

    public void setProf_pic_id(int prof_pic_id) {
        this.prof_pic_id = prof_pic_id;
    }

    public String getWhats_up() {
        return whats_up;
    }

    public Timestamp getCreated_at() {
        return created_at;
    }

    public Timestamp getUpdated_at() {
        return updated_at;
    }

    public void setTel(Long tel) {
        this.tel = tel;
    }

    public void setWhats_up(String whats_up) {
        this.whats_up = whats_up;
    }

    public void setCreated_at(Timestamp created_at) {
        this.created_at = created_at;
    }

    public void setUpdated_at(Timestamp updated_at) {
        this.updated_at = updated_at;
    }

    @Override
    public boolean equals(Object o) {
        if (this == o) return true;
        if (o == null || getClass() != o.getClass()) return false;
        User user = (User) o;
        return user_id.equals(user.user_id) && email.equals(user.email);
    }

    @Override
    public int hashCode() {
        return Objects.hash(user_id, email);
    }

    @Override
    public String toString() {
        return "User{" +
                "user_id=" + user_id +
                ", username='" + username + '\'' +
                ", email='" + email + '\'' +
                ", tel=" + tel +
                ", province='" + province + '\'' +
                ", city='" + city + '\'' +
                ", class_of=" + class_of +
                ", prof_pic_id=" + prof_pic_id +
                ", whats_up='" + whats_up + '\'' +
                ", created_at=" + created_at +
                ", updated_at=" + updated_at +
                '}';
    }


}
