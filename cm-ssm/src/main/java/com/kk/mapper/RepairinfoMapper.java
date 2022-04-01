package com.kk.mapper;

import com.kk.pojo.Repairinfo;

import java.util.List;

public interface RepairinfoMapper {
    int deleteByPrimaryKey(Integer rid);

    int insert(Repairinfo record);

    Repairinfo selectByPrimaryKey(Integer rid);

    List<Repairinfo> selectAll();

    int updateByPrimaryKey(Repairinfo record);
    
    int selectRidByRcode(String rCode);
}