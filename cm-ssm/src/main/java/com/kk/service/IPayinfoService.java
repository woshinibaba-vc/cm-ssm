package com.kk.service;

import com.github.pagehelper.PageInfo;
import com.kk.pojo.Payinfo;
import com.kk.pojo.PayinfoExtend;

import java.util.List;

public interface IPayinfoService {
	int deleteByPrimaryKey(Integer pid);

    int insert(Payinfo record);

    Payinfo selectByPrimaryKey(Integer pid);

    PageInfo<PayinfoExtend> selectAll();

    int updateByPrimaryKey(Payinfo record);
}
