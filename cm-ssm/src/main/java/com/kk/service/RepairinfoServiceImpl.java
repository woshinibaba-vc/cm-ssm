package com.kk.service;

import com.kk.mapper.RepairinfoMapper;
import com.kk.mapper.UserMapper;
import com.kk.pojo.Repairinfo;
import com.kk.pojo.RepairinfoExtend;
import com.kk.pojo.User;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.ArrayList;
import java.util.List;

@Service
public class RepairinfoServiceImpl implements IRepairinfoService {
	@Autowired private RepairinfoMapper riMapper;
	@Autowired private UserMapper userMapper;
	
	@Override
	public int deleteByPrimaryKey(Integer rid) {
		return riMapper.deleteByPrimaryKey(rid);
	}

	@Override
	public int insert(Repairinfo record) {
		return riMapper.insert(record);
	}

	@Override
	public Repairinfo selectByPrimaryKey(Integer rid) {
		return riMapper.selectByPrimaryKey(rid);
	}

	@Override
	public List<RepairinfoExtend> selectAll() {
		List<RepairinfoExtend> riExtends =  new ArrayList<>();
		List<Repairinfo> lists = riMapper.selectAll();
		for (Repairinfo ri : lists) {
			User user = userMapper.selectByPrimaryKey(ri.getUid());
			RepairinfoExtend riExtend = new RepairinfoExtend(ri.getRid(), ri.getRcode(), ri.getRtime(), ri.getRdetail(), ri.getRstatus(), user);
			riExtends.add(riExtend);
		}
		return riExtends;
	}

	@Override
	public int updateByPrimaryKey(Repairinfo record) {
		return riMapper.updateByPrimaryKey(record);
	}

	@Override
	public int selectRidByRcode(String rCode) {
		return riMapper.selectRidByRcode(rCode);
	}

}
