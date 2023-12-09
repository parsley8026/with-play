package com.parsley.controller;

import com.parsley.domain.Reply;
import com.parsley.domain.Tab;
import com.parsley.domain.Post;
import com.parsley.domain.User;
import com.parsley.service.impl.*;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpSession;
import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.springframework.core.env.Environment;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;


import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.time.LocalDateTime;
import java.util.Date;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
/**
 * 主题相关控制类
 */
@Controller
public class PostController {

    @Autowired
    public PostServiceImpl postService;
    @Autowired
    public ReplyServiceImpl replyService;
    @Autowired
    public UserServiceImpl userService;
    @Autowired
    public TabServiceImpl tabService;
    @Autowired
    public InviteServiceImpl inviteService;

    @Autowired
    public Environment env;

    //log4j对象
    private final Log log = LogFactory.getLog(getClass());

    /**
     * 渲染首页
     * @param session
     * @return
     */
    @RequestMapping("/")
    public ModelAndView toMain(HttpSession session){
        ModelAndView indexPage=new ModelAndView("cate");
        //全部主题
        List<Post> posts =postService.listPostsAndUsers();

        //获取统计信息
        //int postsNum=postService.getPostsNum();
        //int usersNum=userService.getUserCount();
        //获取用户信息
        Integer uid=(Integer) session.getAttribute("userId");
        User user=userService.getUserById(uid);
        //最热贴子
        List<Post> hotestPosts =postService.listMostCommentsPosts();

        indexPage.addObject("posts", posts);
        indexPage.addObject("hotestPosts", hotestPosts);
        //indexPage.addObject("postsNum",postsNum);
        //indexPage.addObject("usersNum",usersNum);
        indexPage.addObject("user",user);
        return indexPage;
    }

    /**
     * 渲染主题详细页面
     * @param id
     * @param session
     * @return
     */
    @RequestMapping("/post/{id}")
    public ModelAndView toPost(@PathVariable("id")Integer id,HttpSession session){
        //点击量加一
        boolean ifSucc=postService.clickAddOne(id);
        //获取主题信息
        Post post =postService.selectById(id);
        //获取主题全部评论
        List<Reply> replies=replyService.getRepliesOfPost(id);
        //获取评论数
        int repliesNum=replyService.repliesNum(id);
        //获取统计信息
        int postsNum=postService.getPostsNum();
        int usersNum=userService.getUserCount();

        //获取用户信息
        Integer uid;
        String joinFlag;
        User user = null;
        if (session.getAttribute("userId") != null) {
            // 获取用户是否已经加入该贴子
            uid=(Integer) session.getAttribute("userId");
            joinFlag = inviteService.getInviteeInviteInfoByPostId(id, uid) != null ? "已加入" :
                    (post.getMaxPeopleNum() == post.getNowPeopleNum() ? "已满员" : "加入");
            user= userService.getUserById(uid);
        } else {
            joinFlag = "请先登录";
        }


        //最热主题
        List<Post> hotestPosts =postService.listMostCommentsPosts();

        //渲染视图
        ModelAndView postPage=new ModelAndView("detail");
        postPage.addObject("post", post);
        postPage.addObject("replies",replies);
        postPage.addObject("repliesNum",repliesNum);
        postPage.addObject("postsNum",postsNum);
        postPage.addObject("usersNum",usersNum);
        postPage.addObject("user",user);
        postPage.addObject("hotestPosts", hotestPosts);
        postPage.addObject("joinFlag", joinFlag);
        return postPage;
    }

    /**
     * 渲染指定板块页面
     */
    @RequestMapping("/tab/{tabNameEn}")
    public ModelAndView toTabPage(@PathVariable("tabNameEn")String tabNameEn,HttpSession session){
        Tab tab=tabService.getByTabNameEn(tabNameEn);
        Integer tabId=tab.getId();

        ModelAndView indexPage=new ModelAndView("cate");
        //全部主题
        List<Post> posts =postService.listPostsAndUsersOfTab(tabId);

        //获取统计信息
        int postsNum=postService.getPostsNum();
        int usersNum=userService.getUserCount();

        //获取用户信息
        Integer uid=(Integer) session.getAttribute("userId");
        User user=userService.getUserById(uid);
        //最热主题
        List<Post> hotestPosts =postService.listMostCommentsPosts();

        indexPage.addObject("posts", posts);
        indexPage.addObject("postsNum",postsNum);
        indexPage.addObject("usersNum",usersNum);
        indexPage.addObject("tab",tab);
        indexPage.addObject("user",user);
        indexPage.addObject("hotestPosts", hotestPosts);
        return  indexPage;
    }

    /**
     * 发表主题
     * @param request
     * @param session
     * @return
     */
    @RequestMapping(value = "/post/add", method = RequestMethod.POST)
    public ModelAndView addPost(HttpServletRequest request, HttpSession session){
        ModelAndView indexPage;
        //未登陆
        if(session.getAttribute("userId")==null){
            indexPage=new ModelAndView("redirect:/signin");
            return  indexPage;
        }
        //处理参数
        Integer userId=(Integer) session.getAttribute("userId");
        String title=request.getParameter("title");
        String content=request.getParameter("content");
        Byte tabId=Byte.parseByte(request.getParameter("tab"));
        Date startTime = null;
        Date endTime = null;
        try {
             startTime = (new SimpleDateFormat("yyyy-MM-dd'T'HH:mm"))
                    .parse(request.getParameter("active-time"));
             endTime = (new SimpleDateFormat("yyyy-MM-dd'T'HH:mm"))
                     .parse(request.getParameter("end-time"));
        } catch (ParseException e) {
            if (request.getParameter("active-time") == null){

            }else {
                startTime = new Date();
                endTime = new Date();
            }
        }
        String location = request.getParameter("active-location");
        Integer people = Integer.parseInt(request.getParameter("active-people") == "" ? "0" : request.getParameter("active-people"));

        //新建Post
        Post post =new Post();
        post.setUserId(userId);
        post.setTitle(title);
        post.setContent(content);
        post.setTabId(tabId);
        post.setCreateTime(new Date());
        post.setUpdateTime(new Date());
        post.setActiveTime(startTime);
        post.setLocation(location);
        post.setMaxPeopleNum(people);

        //添加post
        boolean ifSucc=postService.addPost(post);
        if (ifSucc){
            if (log.isInfoEnabled()){
                log.info("添加主题成功!");
            }
        }
        indexPage=new ModelAndView("redirect:/");

        return indexPage;
    }
}
