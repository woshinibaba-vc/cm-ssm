package com.kk.service;

import com.kk.pojo.LoginUser;

import java.util.List;


public interface ILoginUserService {
	int deleteByPrimaryKey(Integer lid);

    int insert(LoginUser record);

    LoginUser selectByPrimaryKey(Integer lid);

    List<LoginUser> selectAll();

    int updateByPrimaryKey(LoginUser record);
        
    LoginUser selectgetUserByName(String username);
}
