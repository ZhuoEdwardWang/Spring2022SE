package com.forum.repository;

import com.forum.model.PostInfo;
import org.springframework.data.repository.CrudRepository;
import org.springframework.stereotype.Repository;

@Repository
public interface PostInfoRepository extends CrudRepository<PostInfo, Long> {
}
