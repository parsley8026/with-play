package com.parsley.controller;

import com.parsley.domain.Post;
import com.parsley.domain.Tab;
import com.parsley.service.impl.ReplyServiceImpl;
import com.parsley.service.impl.TabServiceImpl;
import com.parsley.service.impl.PostServiceImpl;
import com.parsley.service.impl.UserServiceImpl;

import jakarta.servlet.http.HttpServletRequest;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.Banner;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import java.util.List;

/**
 * 主控制类
 */
@Controller
public class MainController {

    @Autowired
    public PostServiceImpl postService;
    @Autowired
    public ReplyServiceImpl replyService;
    @Autowired
    public UserServiceImpl userService;
    @Autowired
    public TabServiceImpl tabService;

    /**
     * 进入登录页面.
     */
    @RequestMapping(value = {"/signin"})
    public ModelAndView signin(){
        ModelAndView signinPage = new ModelAndView("signin");

        //获取统计信息
        int postsNum = postService.getPostsNum();
        int usersNum  = userService.getUserCount();

        signinPage.addObject("postsNum", postsNum);
        signinPage.addObject("usersNum", usersNum);
        return signinPage;
    }

    /**
     * 进入注册页面.
     */
    @RequestMapping("/signup")
    public ModelAndView signup(){
        ModelAndView signupPage=new ModelAndView("signup");

        //获取统计信息
        int postsNum=postService.getPostsNum();
        int usersNum=userService.getUserCount();

        signupPage.addObject("postsNum", postsNum);
        signupPage.addObject("usersNum", usersNum);
        return signupPage;
    }

    /**
     * 进入新建主题页面
     */
    @RequestMapping(value = {"/new"})
    public ModelAndView newPost(){
        ModelAndView newPostPage=new ModelAndView("new");
        List<Tab> tabs=tabService.getAllTabs();

        //获取统计信息
        int postsNum=postService.getPostsNum();
        int usersNum=userService.getUserCount();

        newPostPage.addObject("tabs", tabs);
        newPostPage.addObject("postsNum", postsNum);
        newPostPage.addObject("usersNum", usersNum);
        return newPostPage;
    }

    /**
     * 模糊搜索
     */
    @RequestMapping("/search")
    public ModelAndView search(HttpServletRequest request) {
        String searchContext = request.getParameter("searchInput");
        List<Post> posts = postService.searchPosts(searchContext);

        ModelAndView indexPage = new ModelAndView("cate");
        indexPage.addObject("posts", posts);
        return indexPage;
    }


    /**
     * 配置404页面
     */
    @RequestMapping("*")
    public String notFind() {
        return "404";
    }
}
