package com.kk.mapper;

import com.kk.pojo.Moving;

import java.util.List;

public interface MovingMapper {
    int deleteByPrimaryKey(Integer mId);

    int insert(Moving record);

    Moving selectByPrimaryKey(Integer mId);

    List<Moving> selectAll();

    int updateByPrimaryKey(Moving record);

}