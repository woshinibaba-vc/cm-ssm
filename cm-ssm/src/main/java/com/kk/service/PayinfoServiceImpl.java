package com.kk.service;

import com.github.pagehelper.PageInfo;
import com.kk.mapper.ChargeitemMapper;
import com.kk.mapper.PayinfoMapper;
import com.kk.mapper.UserMapper;
import com.kk.pojo.Chargeitem;
import com.kk.pojo.Payinfo;
import com.kk.pojo.PayinfoExtend;
import com.kk.pojo.User;
import org.springframework.beans.BeanUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.ArrayList;
import java.util.List;

@Service
public class PayinfoServiceImpl implements IPayinfoService {
	@Autowired private PayinfoMapper payinfoMapper;
	@Autowired private UserMapper userMapper;
	@Autowired private ChargeitemMapper ciMapper;

	@Override
	public int deleteByPrimaryKey(Integer pid) {
		return payinfoMapper.deleteByPrimaryKey(pid);
	}

	@Override
	public int insert(Payinfo record) {
		return payinfoMapper.insert(record);
	}

	@Override
	public Payinfo selectByPrimaryKey(Integer pid) {
		return payinfoMapper.selectByPrimaryKey(pid);
	}

	@Override
	public PageInfo<PayinfoExtend> selectAll() {
		List<Payinfo> lists = payinfoMapper.selectAll();
		PageInfo<Payinfo> info = new PageInfo<>(lists, 8);
		List<PayinfoExtend> payinfoExtends =  new ArrayList<>();
		for (Payinfo payinfo : lists) {
			User user = userMapper.selectByPrimaryKey(payinfo.getUid());
			Chargeitem chargeitem = ciMapper.selectByPrimaryKey(payinfo.getCid());
			PayinfoExtend payinfoExtend = new PayinfoExtend(payinfo.getPid(), payinfo.getPcode(), payinfo.getPtime(), payinfo.getPmoney(), payinfo.getPinfo(), payinfo.getPstatus(), chargeitem, user);
			payinfoExtends.add(payinfoExtend);
		}
		PageInfo<PayinfoExtend> pageInfo = new PageInfo<>();
		BeanUtils.copyProperties(info,pageInfo);
		pageInfo.setList(payinfoExtends);
		return pageInfo;
	}

	@Override
	public int updateByPrimaryKey(Payinfo record) {
		return payinfoMapper.updateByPrimaryKey(record);
	}

}