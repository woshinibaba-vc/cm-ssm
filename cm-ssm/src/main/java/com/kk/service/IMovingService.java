package com.kk.service;


import com.kk.pojo.Moving;

import java.util.List;

public interface IMovingService {
	int deleteByPrimaryKey(Integer mId);

    int insert(Moving record);

    Moving selectByPrimaryKey(Integer mId);

    List<Moving> selectAll();

    int updateByPrimaryKey(Moving record);
}
