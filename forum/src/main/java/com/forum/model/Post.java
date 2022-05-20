package com.forum.model;

import javax.persistence.*;
import java.sql.Timestamp;
import java.util.Objects;

@Entity
@Table(name = "posts")
public class Post {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    public Long id;

    public Long parent_id;

    public Long user_id;

    public String title;

    public String content;

    public int tag;

    public Timestamp post_create_time;

    public Post(){

    }

    public Post(Long id, Long parent_id, Long user_id, String title, String content, int tag) {
        this.id = id;
        if (parent_id == null) {
            this.parent_id = Long.valueOf(0);
        }
        else{
            this.parent_id = parent_id;
        }
        this.user_id = user_id;
        this.title = title;
        this.content = content;
        this.tag = tag;
    }

    public Timestamp getPost_create_time() {
        return post_create_time;
    }

    public void setPost_create_time(Timestamp post_create_time) {
        this.post_create_time = post_create_time;
    }

    public Long getId() {
        return id;
    }

    public Long getParent_id() {
        return parent_id;
    }

    public Long getUser_id() {
        return user_id;
    }

    public String getTitle() {
        return title;
    }

    public String getContent() {
        return content;
    }

    public int getTag() {
        return tag;
    }

    public void setId(Long id) {
        this.id = id;
    }

    public void setParent_id(Long parent_id) {
        this.parent_id = parent_id;
    }

    public void setUser_id(Long user_id) {
        this.user_id = user_id;
    }

    public void setTitle(String title) {
        this.title = title;
    }

    public void setContent(String content) {
        this.content = content;
    }

    public void setTag(int tag) {
        this.tag = tag;
    }

    @Override
    public boolean equals(Object o) {
        if (this == o) return true;
        if (o == null || getClass() != o.getClass()) return false;
        Post post = (Post) o;
        return id.equals(post.id);
    }

    @Override
    public int hashCode() {
        return Objects.hash(id);
    }

    @Override
    public String toString() {
        return "Post{" +
                "id=" + id +
                ", parent_id=" + parent_id +
                ", user_id=" + user_id +
                ", title='" + title + '\'' +
                ", content='" + content + '\'' +
                ", tag=" + tag +
                '}';
    }
}
