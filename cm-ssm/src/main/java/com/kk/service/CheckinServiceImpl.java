package com.kk.service;

import com.kk.mapper.CheckinMapper;
import com.kk.pojo.Checkin;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class CheckinServiceImpl implements CheckinService {
	@Autowired 
	private CheckinMapper checkinMapper;

	@Override
	public int deleteByPrimaryKey(Integer id) {
		return checkinMapper.deleteByPrimaryKey(id);
	}

	@Override
	public int insert(Checkin checkin) {
		return checkinMapper.insert(checkin);
	}

	@Override
	public Checkin selectByPrimaryKey(Integer id) {
		return null;
	}

	@Override
	public List<Checkin> selectAll() {
		List<Checkin> lists = checkinMapper.selectAll();
		return lists;
	}

	@Override
	public int updateByPrimaryKey(Checkin checkin) {
		return 0;
	}

}