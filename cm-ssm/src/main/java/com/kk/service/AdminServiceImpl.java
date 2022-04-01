package com.kk.service;

import com.kk.mapper.AdminMapper;
import com.kk.pojo.Admin;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class AdminServiceImpl implements IAdminService {
	@Autowired private AdminMapper adminMapper;
	
	@Override
	public int deleteByPrimaryKey(Integer aid) {
		return adminMapper.deleteByPrimaryKey(aid);
	}

	@Override
	public int insert(Admin record) {
		return adminMapper.insert(record);
	}

	@Override
	public Admin selectByPrimaryKey(Integer aid) {
		return adminMapper.selectByPrimaryKey(aid);
	}

	@Override
	public List<Admin> selectAll() {
		return adminMapper.selectAll();
	}

	@Override
	public int updateByPrimaryKey(Admin record) {
		return adminMapper.updateByPrimaryKey(record);
	}

	@Override
	public Admin getAdminByName(String adminname) {
		return adminMapper.getAdminByName(adminname);
	}

}
