package com.kk.service;

import com.kk.pojo.Checkin;

import java.util.List;

public interface CheckinService {
	int deleteByPrimaryKey(Integer id);

    int insert(Checkin checkin);

    Checkin selectByPrimaryKey(Integer id);

    List<Checkin> selectAll();

    int updateByPrimaryKey(Checkin checkin);
}
