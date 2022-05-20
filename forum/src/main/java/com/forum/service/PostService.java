package com.forum.service;

import com.forum.model.Post;
import com.forum.repository.PostDao;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.sql.Timestamp;
import java.util.Date;


@Service
public class PostService {
    @Resource
    private PostDao postDao;

    public Post createPost(Long userID, Long parent_id, String title, String content, int tag){
        Post post = new Post();
        post.user_id = userID;
        post.parent_id = parent_id;
        post.title = title;
        post.content = content;
        post.tag = tag;
        Date date = new Date();
        Timestamp time = new Timestamp(date.getTime());
        post.setPost_create_time(time);
        Post save = postDao.save(post);
        return save ;
    }


}
