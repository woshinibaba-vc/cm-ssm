package com.kk.mapper;

import com.kk.pojo.Dorepair;

import java.util.List;

public interface DorepairMapper {
    int deleteByPrimaryKey(Integer did);

    int insert(Dorepair record);

    Dorepair selectByPrimaryKey(Integer did);

    List<Dorepair> selectAll();

    int updateByPrimaryKey(Dorepair record);
}