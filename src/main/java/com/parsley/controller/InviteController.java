package com.parsley.controller;

import com.parsley.domain.Invite;
import com.parsley.domain.LoginLog;
import com.parsley.domain.Post;
import com.parsley.domain.User;
import com.parsley.mapper.InviteMapper;
import com.parsley.mapper.PostMapper;
import com.parsley.service.impl.InviteServiceImpl;
import com.parsley.service.impl.PostServiceImpl;
import com.parsley.service.impl.UserServiceImpl;
import com.parsley.utils.ProduceMD5;
import eu.bitwalker.useragentutils.UserAgent;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.Banner;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseStatus;
import org.springframework.web.servlet.ModelAndView;

import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.List;

@Controller
public class InviteController {

    @Autowired
    public InviteServiceImpl inviteService;
    @Autowired
    public PostServiceImpl postService;
    @Autowired
    public UserServiceImpl userService;

    // 加入其他人组织的活动
    @RequestMapping("/join")
    public Object joinActivity(HttpServletRequest request, HttpSession session) {

        Integer uid = Integer.parseInt(request.getParameter("uid"));
        Integer postId = Integer.parseInt(request.getParameter("postId"));

        Post post = postService.selectById(postId);

        HashMap<String, String> res = new HashMap<String, String>();
        Invite invite = new Invite();
        invite.setPostId(postId);
        invite.setInviterId(post.getUser().getId());
        invite.setInviteeId(uid);

        postService.peopleNumAddOne(postId);

        if (inviteService.addInvite(invite)) {
            res.put("done", "done");
        }

        return res;
    }

    // 取消活动
    @RequestMapping("/cancel")
    public Object cancelActivity(HttpServletRequest request, HttpSession session) {

        Integer uid = Integer.parseInt(request.getParameter("uid"));
        Integer postId = Integer.parseInt(request.getParameter("postId"));

        // 取消活动
        inviteService.cancelInviteByPostId(postId);
        postService.cancelInviteByPostId(postId);

        return null;
    }

    // 退出活动
    @RequestMapping("/exitInvitee")
    public Object exitActivity(HttpServletRequest request, HttpSession session) {

        Integer uid = Integer.parseInt(request.getParameter("uid"));
        Integer postId = Integer.parseInt(request.getParameter("postId"));

        // 取消活动
        inviteService.exitActivity(postId, (Integer) session.getAttribute("userId"));
        postService.peopleNumDropOne(postId);
        return null;
    }

    // 获取我发起的活动的帖子
    @RequestMapping("/inviter/{userId}")
    public ModelAndView inviterPost(@PathVariable("userId") int userId, HttpSession session) {
        ModelAndView indexPage=new ModelAndView("inviter");
        //获取所有主题
        List<Post> posts =postService.getPostsByUserId(userId);

        //获取用户信息
        Integer uid=(Integer) session.getAttribute("userId");
        User user=userService.getUserById(uid);

        //最热贴子
        List<Post> hotestPosts =postService.listMostCommentsPosts();

        indexPage.addObject("posts", posts);
        indexPage.addObject("user",user);
        indexPage.addObject("hotestPosts", hotestPosts);
        return indexPage;
    }

    // 获取我参与的活动的帖子
    @RequestMapping("/invitee/{userId}")
    public ModelAndView inviteePost(@PathVariable("userId") int userId, HttpSession session) {
        ModelAndView indexPage=new ModelAndView("inviter");
        //获取用户信息
        Integer uid=(Integer) session.getAttribute("userId");

        //获取受邀记录
        List<Invite> inviteList = inviteService.getAllInviteeInfo(uid);
        List<Integer> postIdList = new ArrayList<>();

        for (Invite invite : inviteList) {
            postIdList.add(invite.getPostId());
        }

        // 获取受邀主题
        List<Post> posts = new ArrayList<>();
        if (postIdList.size() != 0) {
            posts = postService.listPostsDetailByPostIdList(postIdList);
        }else {}

        User user=userService.getUserById(uid);

        //最热贴子
        List<Post> hotestPosts =postService.listMostCommentsPosts();

        indexPage.addObject("posts", posts);
        indexPage.addObject("user",user);
        indexPage.addObject("hotestPosts", hotestPosts);
        return indexPage;
    }




}
