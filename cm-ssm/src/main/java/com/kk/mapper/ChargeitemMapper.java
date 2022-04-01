package com.kk.mapper;

import com.kk.pojo.Chargeitem;

import java.util.List;

public interface ChargeitemMapper {
    int deleteByPrimaryKey(Integer cid);

    int insert(Chargeitem record);

    Chargeitem selectByPrimaryKey(Integer cid);

    List<Chargeitem> selectAll();

    int updateByPrimaryKey(Chargeitem record);
}