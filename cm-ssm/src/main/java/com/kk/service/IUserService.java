package com.kk.service;

import com.github.pagehelper.PageInfo;
import com.kk.pojo.User;
import com.kk.pojo.UserExtend;

import java.util.List;

public interface IUserService {
	int deleteByPrimaryKey(Integer uid);

    int insert(User record);

    User selectByPrimaryKey(Integer uid);

    PageInfo<UserExtend> selectAll();

    int updateByPrimaryKey(User record);
    
    Boolean validateHcode(String ucode);
}
