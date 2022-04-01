package com.kk.mapper;

import com.kk.pojo.Payinfo;

import java.util.List;

public interface PayinfoMapper {
    int deleteByPrimaryKey(Integer pid);

    int insert(Payinfo record);

    Payinfo selectByPrimaryKey(Integer pid);

    List<Payinfo> selectAll();

    int updateByPrimaryKey(Payinfo record);
}