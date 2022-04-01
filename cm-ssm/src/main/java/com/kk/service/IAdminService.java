package com.kk.service;

import com.kk.pojo.Admin;

import java.util.List;

public interface IAdminService {
	int deleteByPrimaryKey(Integer aid);

    int insert(Admin record);

    Admin selectByPrimaryKey(Integer aid);

    List<Admin> selectAll();

    int updateByPrimaryKey(Admin record);
    
    Admin getAdminByName(String adminname);
}
