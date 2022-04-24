package com.kk.mapper;
import com.kk.pojo.Garage;
import com.kk.pojo.Staffrepair;

import java.util.List;

public interface GarageMapper {
    int deleteByPrimaryKey(Integer gid);

    int insert(Garage garage);

    Garage selectByPrimaryKey(Integer gid);

    List<Garage> selectAll();

    int updateByPrimaryKey(Garage garage);
}