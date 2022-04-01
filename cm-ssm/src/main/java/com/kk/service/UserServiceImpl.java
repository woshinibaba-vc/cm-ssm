package com.kk.service;
import com.github.pagehelper.PageInfo;
import com.kk.mapper.HouseMapper;
import com.kk.mapper.UserMapper;
import com.kk.pojo.House;
import com.kk.pojo.User;
import com.kk.pojo.UserExtend;
import org.springframework.beans.BeanUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.ArrayList;
import java.util.List;

@Service
public class UserServiceImpl implements IUserService {
	@Autowired private UserMapper userMapper;
	@Autowired private HouseMapper houseMapper;

	@Override
	public int deleteByPrimaryKey(Integer uid) {
		return userMapper.deleteByPrimaryKey(uid);
	}

	@Override
	public int insert(User record) {
		return userMapper.insert(record);
	}

	@Override
	public User selectByPrimaryKey(Integer uid) {
		return userMapper.selectByPrimaryKey(uid);
	}

	@Override
	public PageInfo<UserExtend> selectAll() {
		List<User> lists = userMapper.selectAll();
		PageInfo<User> info = new PageInfo<>(lists, 8);
		List<UserExtend> userExtends = new ArrayList<>();
		for (User user : lists) {
			House house = houseMapper.selectByPrimaryKey(user.getHid());
			UserExtend userExtend = new UserExtend();
			userExtend.setUid(user.getUid());
			userExtend.setUcode(user.getUcode());
			userExtend.setUname(user.getUname());
			userExtend.setUpwd(user.getUpwd());
			userExtend.setUsex(user.getUsex());
			userExtend.setUphone(user.getUphone());
			userExtend.setUstarttime(user.getUstarttime());
			userExtend.setUpeoplenum(user.getUpeoplenum());
			userExtend.setUhousecode(user.getUhousecode());
			userExtend.setUtheme(user.getUtheme());
			userExtend.setHouse(house);
			userExtends.add(userExtend);
		}
		PageInfo<UserExtend> pageInfo= new PageInfo<>();
		BeanUtils.copyProperties(info,pageInfo);
		pageInfo.setList(userExtends);
		return pageInfo;
	}

	@Override
	public int updateByPrimaryKey(User record) {
		return userMapper.updateByPrimaryKey(record);
	}

	@Override
	public Boolean validateHcode(String ucode) {
		List<User> houses = userMapper.selectAll();
		Boolean result = true;
		for (User house : houses) {
			if(house.getUcode().equals(ucode)) {
				result = false;
				break;
			}
		}
		return result;
	}
}
