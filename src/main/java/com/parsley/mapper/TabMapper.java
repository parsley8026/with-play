package com.parsley.mapper;

import com.parsley.domain.Tab;
import org.apache.ibatis.annotations.Mapper;

import java.util.List;

@Mapper
public interface TabMapper {
    int deleteByPrimaryKey(Integer id);

    Tab selectByPrimaryKey(Integer id);

    Tab getByTabNameEn(String tabName);

    int insert(Tab record);

    int insertSelective(Tab record);

    int updateByPrimaryKeySelective(Tab record);

    int updateByPrimaryKey(Tab record);

    List<Tab> getAllTabs();
}
