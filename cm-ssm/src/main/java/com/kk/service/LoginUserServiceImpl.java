package com.kk.service;

import com.kk.mapper.LoginUserMapper;
import com.kk.pojo.LoginUser;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;


@Service
public class LoginUserServiceImpl implements ILoginUserService {
	@Autowired private LoginUserMapper loginUserMapper;

	@Override
	public int deleteByPrimaryKey(Integer lid) {
		return loginUserMapper.deleteByPrimaryKey(lid);
	}

	@Override
	public int insert(LoginUser record) {
		return loginUserMapper.insert(record);
	}

	@Override
	public LoginUser selectByPrimaryKey(Integer lid) {
		return loginUserMapper.selectByPrimaryKey(lid);
	}

	@Override
	public List<LoginUser> selectAll() {
		return loginUserMapper.selectAll();
	}

	@Override
	public int updateByPrimaryKey(LoginUser record) {
		return loginUserMapper.updateByPrimaryKey(record);
	}

	@Override
	public LoginUser selectgetUserByName(String username) {
		return loginUserMapper.selectgetUserByName(username);
	}

}
