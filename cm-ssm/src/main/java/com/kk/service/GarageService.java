package com.kk.service;

import com.kk.pojo.Garage;

import java.util.List;

public interface GarageService {
	int deleteByPrimaryKey(Integer gid);

    int insert(Garage garage);

    Garage selectByPrimaryKey(Integer gid);

    List<Garage> selectAll();

    int updateByPrimaryKey(Garage garage);

}
