package com.parsley.mapper;

import com.parsley.domain.Post;
import org.apache.ibatis.annotations.Mapper;

import java.util.List;

@Mapper
public interface PostMapper {
    List<Post> listPostsDetailByPostIdList(List<Integer> idList);
    List<Post> listPostsAndUsers();

    List<Post> listPostsAndUsersOfTab(Integer tabId);

    Post selectById(Integer id);

    List<Post> getAllPosts();

    List<Post> getPostsByUserId(Integer userId);

    int getPostsNum();

    List<Post> listMostCommentsPosts();

    List<Post> searchPosts(String title);
    int deleteByPrimaryKey(Integer id);

    int insert(Post record);

    int insertSelective(Post record);

    int updateByPrimaryKeySelective(Post record);

    int updateByPrimaryKeyWithBLOBs(Post record);

    int updateByPrimaryKey(Post record);

    int clickAddOne(Integer id);

    int peopleNumAddOne(Integer id);

    int peopleNumDropOne(Integer id);

    int cancelInviteByPostId(Integer id);
}
