package com.kk.mapper;
import com.kk.pojo.LoginUser;

import java.util.List;

public interface LoginUserMapper {
    int deleteByPrimaryKey(Integer lId);

    int insert(LoginUser record);

    LoginUser selectByPrimaryKey(Integer lId);

    List<LoginUser> selectAll();

    int updateByPrimaryKey(LoginUser record);
    
    LoginUser selectgetUserByName(String username);
}