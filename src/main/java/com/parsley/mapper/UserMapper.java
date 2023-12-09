package com.parsley.mapper;

import com.parsley.domain.User;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

@Mapper
public interface UserMapper {
    User selectByPrimaryKey(Integer id);

    User selectByUsername(String username);

    int getUserCount();

    int existUsername(String username);

    int deleteByPrimaryKey(Integer id);

    int addUser(User user);

    int insertSelective(User record);

    int updateByPrimaryKeySelective(User record);

    int updateByPrimaryKey(User record);
}
