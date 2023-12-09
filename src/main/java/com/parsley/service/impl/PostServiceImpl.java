package com.parsley.service.impl;

import com.parsley.domain.Post;
import com.parsley.mapper.PostMapper;
import com.parsley.service.PostService;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class PostServiceImpl implements PostService {

    @Autowired
    public PostMapper postDao;

    @Override
    public List<Post> listPostsDetailByPostIdList(List<Integer> idList) {
        return postDao.listPostsDetailByPostIdList(idList);
    }

    //获取全部主题
    public List<Post> getAllPosts() {
        return postDao.getAllPosts();
    }

    //获取指定id主题
    public Post selectById(Integer id) {
        return postDao.selectById(id);
    }

    public List<Post> listMostCommentsPosts() {
        return postDao.listMostCommentsPosts();
    }

    public boolean addPost(Post post) {
        return postDao.insert(post)>0;
    }

    public boolean clickAddOne(Integer id) {
        return postDao.clickAddOne(id) > 0;
    }

    @Override
    public boolean peopleNumAddOne(Integer id) {
        if (postDao.peopleNumAddOne(id) > 0)
            return true;
        else
            return false;
    }

    @Override
    public int peopleNumDropOne(Integer id) {
        postDao.peopleNumDropOne(id);
        return 0;
    }

    public int getPostsNum() {
        return postDao.getPostsNum();
    }

    @Override
    public boolean cancelInviteByPostId(Integer id) {
        if (postDao.cancelInviteByPostId(id) > 0)
            return true;
        else
            return false;
    }

    public List<Post> listPostsAndUsers() {
        return postDao.listPostsAndUsers();
    }

    @Override
    public List<Post> searchPosts(String title) {
        return postDao.searchPosts("%"+title+"%");
    }

    public List<Post> getPostsByUserId(Integer userId) {
        return postDao.getPostsByUserId(userId);
    }


    public List<Post> listPostsAndUsersOfTab(Integer tabId) {
        return postDao.listPostsAndUsersOfTab(tabId);
    }
}
