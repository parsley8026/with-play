package com.parsley.service;

import com.parsley.domain.Reply;

import java.util.List;

public interface ReplyService {

    List<Reply> getRepliesOfPost(Integer postId);

    boolean addReply(Reply reply);

    int repliesNum(Integer postId);
}
