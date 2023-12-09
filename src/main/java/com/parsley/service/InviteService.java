package com.parsley.service;

import com.parsley.domain.Invite;

import java.util.List;

public interface InviteService {
    boolean addInvite(Invite invite);
    Invite getInviteeInviteInfoByPostId(int postId, int inviteeId);
    // 查看自己的所有受邀记录
    List<Invite> getAllInviteeInfo(int inviteeId);
    boolean exitActivity(int postId, int inviteeId);

    // 邀请人可以做的操作
    // 取消某个帖子下的所有邀请
    boolean cancelInviteByPostId(int postId);
    // 获取某个帖子的邀请信息
    List<Invite> getInviterInviteInfoByPostId(int postId);
    // 获取自己发起的所有邀请
    List<Invite> getAllInviterInfo(int inviterId);

    // 都可以做的操作
    // 取消某个邀请
    boolean cancelInviteById(int id);
}
