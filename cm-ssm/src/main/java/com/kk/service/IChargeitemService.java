package com.kk.service;

import com.kk.pojo.Chargeitem;

import java.util.List;

public interface IChargeitemService {
	int deleteByPrimaryKey(Integer cid);

    int insert(Chargeitem record);

    Chargeitem selectByPrimaryKey(Integer cid);

    List<Chargeitem> selectAll();

    int updateByPrimaryKey(Chargeitem record);
    
    Boolean validateHcode(String ccode);
}
