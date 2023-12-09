package com.parsley.service;

import com.parsley.domain.Post;

import java.util.List;

public interface PostService {


    /**
     * 获取定量主题
     * */
    List<Post> listPostsDetailByPostIdList(List<Integer> idList);

    /**
     * 获取全部主题
     */
    List<Post> getAllPosts();

    /**
    * 获取全部主题及用户信息 用于渲染首页
    */
    List<Post> listPostsAndUsers();

    List<Post> searchPosts(String title);

    List<Post> getPostsByUserId(Integer userId);

    /**
     * 获取最多评论主题列表
     * @return list of posts
     */
    List<Post> listMostCommentsPosts();

    /**
     * 获取全部主题及用户信息 用于渲染板块页面
     */
    List<Post> listPostsAndUsersOfTab(Integer tabId);

    /**
     * 获取指定ID主题
     */
    Post selectById(Integer id);

    /**
     * 新建主题
     */
    boolean addPost(Post post);

    /**
     * 点击量加一
     */
    boolean clickAddOne(Integer id);

    boolean peopleNumAddOne(Integer id);
    int peopleNumDropOne(Integer id);

    /**
     * 获取主题总数
     */
    int getPostsNum();


    boolean cancelInviteByPostId(Integer id);
}
