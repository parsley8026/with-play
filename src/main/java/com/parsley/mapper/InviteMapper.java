package com.parsley.mapper;

import com.parsley.domain.Invite;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

import java.util.List;

@Mapper
public interface InviteMapper {

    // 受邀人可以做的操作
    // 添加邀请
    int addInvite(Invite invite);
    // 查看自己在某个帖子下的邀请信息
    Invite getInviteeInviteInfoByPostId(@Param("postId") int postId, @Param("inviteeId") int inviteeId);
    // 查看自己的所有受邀记录
    List<Invite> getAllInviteeInfo(int inviteeId);
    // 退出此次活动
    int exitActivity(@Param("postId") int postId, @Param("inviteeId") int inviteeId);

    // 邀请人可以做的操作
    // 取消某个帖子下的所有邀请
    int cancelInviteByPostId(int postId);
    // 获取某个帖子的邀请信息
    List<Invite> getInviterInviteInfoByPostId(int postId);
    // 获取自己发起的所有邀请
    List<Invite> getAllInviterInfo(int inviterId);

    // 都可以做的操作
    // 取消某个邀请
    int cancelInviteById(int id);
}
