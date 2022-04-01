package com.kk.service;

import com.kk.pojo.Repairinfo;
import com.kk.pojo.RepairinfoExtend;

import java.util.List;

public interface IRepairinfoService {
	int deleteByPrimaryKey(Integer rid);

    int insert(Repairinfo record);

    Repairinfo selectByPrimaryKey(Integer rid);

    List<RepairinfoExtend> selectAll();

    int updateByPrimaryKey(Repairinfo record);
    
    int selectRidByRcode(String rCode);
}
