package com.parsley.mapper;

import org.apache.ibatis.annotations.Mapper;
import com.parsley.domain.LoginLog;

@Mapper
public interface LoginLogMapper {

    LoginLog selectByPrimaryKey(Long id);

    int deleteByPrimaryKey(Long id);

    int insert(LoginLog record);

    int insertSelective(LoginLog record);

    int updateByPrimaryKeySelective(LoginLog record);

    int updateByPrimaryKey(LoginLog record);
}
