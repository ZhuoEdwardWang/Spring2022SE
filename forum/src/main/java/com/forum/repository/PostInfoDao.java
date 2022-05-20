package com.forum.repository;

import com.forum.model.PostInfo;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

@Repository
public interface PostInfoDao extends JpaRepository<PostInfo, Long> {
}
