package com.kk.mapper;
import com.kk.pojo.Staffrepair;

import java.util.List;

public interface StaffrepairMapper {
    int deleteByPrimaryKey(Integer sid);

    int insert(Staffrepair record);

    Staffrepair selectByPrimaryKey(Integer sid);

    List<Staffrepair> selectAll();

    int updateByPrimaryKey(Staffrepair record);
}