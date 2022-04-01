package com.kk.service;

import com.kk.mapper.ChargeitemMapper;
import com.kk.pojo.Chargeitem;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class ChargeitemServiceImpl implements IChargeitemService {
	@Autowired private ChargeitemMapper ciMapper;
	
	@Override
	public int deleteByPrimaryKey(Integer cid) {
		return ciMapper.deleteByPrimaryKey(cid);
	}

	@Override
	public int insert(Chargeitem record) {
		return ciMapper.insert(record);
	}

	@Override
	public Chargeitem selectByPrimaryKey(Integer cid) {
		return ciMapper.selectByPrimaryKey(cid);
	}

	@Override
	public List<Chargeitem> selectAll() {
		return ciMapper.selectAll();
	}

	@Override
	public int updateByPrimaryKey(Chargeitem record) {
		return ciMapper.updateByPrimaryKey(record);
	}

	@Override
	public Boolean validateHcode(String ccode) {
		List<Chargeitem> houses = ciMapper.selectAll();
		Boolean result = true;
		for (Chargeitem house : houses) {
			if(house.getCcode().equals(ccode)) {
				result = false;
				break;
			}
		}
		return result;
	}
}