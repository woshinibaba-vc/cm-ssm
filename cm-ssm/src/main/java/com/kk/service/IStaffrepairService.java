package com.kk.service;

import com.kk.pojo.Staffrepair;

import java.util.List;

public interface IStaffrepairService {
	int deleteByPrimaryKey(Integer sid);

    int insert(Staffrepair record);

    Staffrepair selectByPrimaryKey(Integer sid);

    List<Staffrepair> selectAll();

    int updateByPrimaryKey(Staffrepair record);
    
    Boolean validateHcode(String scode);
}
