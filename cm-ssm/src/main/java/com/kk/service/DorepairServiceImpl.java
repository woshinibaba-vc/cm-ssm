package com.kk.service;

import com.kk.mapper.DorepairMapper;
import com.kk.mapper.RepairinfoMapper;
import com.kk.mapper.StaffrepairMapper;
import com.kk.pojo.Dorepair;
import com.kk.pojo.DorepairExtend;
import com.kk.pojo.Repairinfo;
import com.kk.pojo.Staffrepair;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.ArrayList;
import java.util.List;

@Service
public class DorepairServiceImpl implements IDorepairService {
	@Autowired private DorepairMapper drMapper;
	@Autowired private StaffrepairMapper srMapper;
	@Autowired private RepairinfoMapper riMapper;
	
	@Override
	public int deleteByPrimaryKey(Integer did) {
		return drMapper.deleteByPrimaryKey(did);
	}

	@Override
	public int insert(Dorepair record) {
		return drMapper.insert(record);
	}

	@Override
	public Dorepair selectByPrimaryKey(Integer did) {
		return drMapper.selectByPrimaryKey(did);
	}

	@Override
	public List<DorepairExtend> selectAll() {
		List<DorepairExtend> dorepairExtends = new ArrayList<>();
		List<Dorepair> dorepairs = drMapper.selectAll();
		for (Dorepair dorepair : dorepairs) {
			Staffrepair staff = srMapper.selectByPrimaryKey(dorepair.getSid());
			Repairinfo repairinfo = riMapper.selectByPrimaryKey(dorepair.getRid());
			DorepairExtend dorepairExtend = new DorepairExtend(dorepair.getDid(), dorepair.getDtime(), dorepair.getDmoney(), staff, repairinfo);
			dorepairExtends.add(dorepairExtend);
		}
		return dorepairExtends;
	}

	@Override
	public int updateByPrimaryKey(Dorepair record) {
		return drMapper.updateByPrimaryKey(record);
	}

}
