package com.forum.controller;

import com.forum.dto.PostRequest;
import com.forum.model.Post;
import com.forum.repository.PostDao;
import com.forum.service.PostService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;

import javax.annotation.Resource;
import java.net.http.HttpRequest;
import java.sql.SQLException;

@Controller
public class PostController {

    @Autowired
    private PostService postService;

    @PostMapping("/post/new")
    @ResponseBody
    public Post newPost(@RequestBody PostRequest request){
//        System.out.println(request);
        return postService.createPost(request.getUserid(), request.getParentid(),
                request.getTitle(), request.getContent(), request.getTag());
    }


}
