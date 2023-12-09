package com.parsley.mapper;

import com.parsley.domain.Reply;
import org.apache.ibatis.annotations.Mapper;

import java.util.List;

@Mapper
public interface ReplyMapper {
    List<Reply> getRepliesOfPost(Integer postId);

    int getRepliesNum(Integer postId);

    int deleteByPrimaryKey(Long id);

    int insert(Reply record);
}
