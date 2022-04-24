package com.kk.service;

import com.kk.mapper.GarageMapper;
import com.kk.pojo.*;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import java.util.List;

@Service
public class GarageServiceImpl implements GarageService {
	@Autowired private GarageMapper garageMapper;

	
	@Override
	public int deleteByPrimaryKey(Integer did) {
		return garageMapper.deleteByPrimaryKey(did);
	}

	@Override
	public int insert(Garage garage) {
		return garageMapper.insert(garage);
	}

	@Override
	public Garage selectByPrimaryKey(Integer did) {
		return garageMapper.selectByPrimaryKey(did);
	}

	@Override
	public List<Garage> selectAll() {
		return garageMapper.selectAll();
	}

	@Override
	public int updateByPrimaryKey(Garage garage) {
		return garageMapper.updateByPrimaryKey(garage);
	}


}
