package com.parsley.service.impl;

import com.parsley.domain.Invite;
import com.parsley.mapper.InviteMapper;
import com.parsley.service.InviteService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class InviteServiceImpl implements InviteService {
    @Autowired
    private InviteMapper inviteMapper;

    @Override
    public boolean addInvite(Invite invite) {
        if (inviteMapper.addInvite(invite) > 0)
            return true;
        else
            return false;
    }

    @Override
    public Invite getInviteeInviteInfoByPostId(int postId, int inviteeId) {
        return inviteMapper.getInviteeInviteInfoByPostId(postId, inviteeId);
    }

    @Override
    public List<Invite> getAllInviteeInfo(int inviteeId) {
        return inviteMapper.getAllInviteeInfo(inviteeId);
    }

    @Override
    public boolean exitActivity(int postId, int inviteeId) {
        inviteMapper.exitActivity(postId, inviteeId);
        return true;
    }

    @Override
    public boolean cancelInviteByPostId(int postId) {
        if (inviteMapper.cancelInviteByPostId(postId) > 0)
            return true;
        else
            return false;
    }

    @Override
    public List<Invite> getInviterInviteInfoByPostId(int postId) {
        return inviteMapper.getInviterInviteInfoByPostId(postId);
    }

    @Override
    public List<Invite> getAllInviterInfo(int inviterId) {
        return inviteMapper.getAllInviterInfo(inviterId);
    }

    @Override
    public boolean cancelInviteById(int id) {
        if (inviteMapper.cancelInviteById(id) > 0)
            return true;
        else
            return false;
    }
}
