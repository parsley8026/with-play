package com.parsley.service.impl;

import com.parsley.domain.Reply;
import com.parsley.mapper.ReplyMapper;
import com.parsley.service.ReplyService;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class ReplyServiceImpl implements ReplyService {

    @Autowired
    public ReplyMapper replyDao;

    public List<Reply> getRepliesOfPost(Integer postId) {
        return replyDao.getRepliesOfPost(postId);
    }

    public boolean addReply(Reply reply) {
        return replyDao.insert(reply)>0;
    }

    public int repliesNum(Integer postId) {
        return replyDao.getRepliesNum(postId);
    }
}
