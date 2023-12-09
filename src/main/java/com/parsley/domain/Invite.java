package com.parsley.domain;

public class Invite extends BaseDomain{

    private Post post;

    private Integer id;
    private Integer postId;
    private Integer inviterId;
    private Integer inviteeId;
    private Byte cancel;

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public int getPostId() {
        return postId;
    }

    public void setPostId(int postId) {
        this.postId = postId;
    }

    public int getInviterId() {
        return inviterId;
    }

    public void setInviterId(int inviterId) {
        this.inviterId = inviterId;
    }

    public int getInviteeId() {
        return inviteeId;
    }

    public void setInviteeId(int inviteeId) {
        this.inviteeId = inviteeId;
    }

    public int getCancel() {
        return cancel;
    }

    public void setCancel(Byte cancel) {
        this.cancel = cancel;
    }

    public Post getPost() {
        return post;
    }

    public void setPost(Post post) {
        this.post = post;
    }


}
