package com.kk.service;

import com.kk.pojo.Dorepair;
import com.kk.pojo.DorepairExtend;

import java.util.List;

public interface IDorepairService {
	int deleteByPrimaryKey(Integer did);

    int insert(Dorepair record);

    Dorepair selectByPrimaryKey(Integer did);

    List<DorepairExtend> selectAll();

    int updateByPrimaryKey(Dorepair record);

}
