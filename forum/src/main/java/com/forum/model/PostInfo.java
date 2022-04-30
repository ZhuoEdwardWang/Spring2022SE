package com.forum.model;

import org.springframework.data.jpa.repository.EntityGraph;

import javax.persistence.*;
import java.util.Objects;

@Entity
@Table(name = "postinfos")
public class PostInfo {
    @Id
    @Column(name = "post_id", nullable = false)
    private Long id;

    private int likes;

    private int comments;

    public Long getId() {
        return id;
    }

    public void setId(Long id) {
        this.id = id;
    }

    public int getLikes() {
        return likes;
    }

    public void setLikes(int likes) {
        this.likes = likes;
    }

    public int getComments() {
        return comments;
    }

    public void setComments(int comments) {
        this.comments = comments;
    }

    @Override
    public boolean equals(Object o) {
        if (this == o) return true;
        if (o == null || getClass() != o.getClass()) return false;
        PostInfo postInfo = (PostInfo) o;
        return getId().equals(postInfo.getId());
    }

    @Override
    public int hashCode() {
        return Objects.hash(getId());
    }

    @Override
    public String toString() {
        return "PostInfo{" +
                "id=" + id +
                ", likes=" + likes +
                ", comments=" + comments +
                '}';
    }
}
