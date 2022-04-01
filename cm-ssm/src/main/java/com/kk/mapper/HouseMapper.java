package com.kk.mapper;

import com.kk.pojo.House;

import java.util.List;

public interface HouseMapper {
    int deleteByPrimaryKey(Integer hid);

    int insert(House record);

    House selectByPrimaryKey(Integer hid);

    List<House> selectAll();

    int updateByPrimaryKey(House record);
}