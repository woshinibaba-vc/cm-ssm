package com.kk.controller;

import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import com.kk.pojo.Chargeitem;
import com.kk.pojo.Msg;
import com.kk.service.IChargeitemService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import java.util.List;

@Controller
@RequestMapping("/chargeitem")
public class ChargeitemController {
	@Autowired private IChargeitemService ciService;


	@RequestMapping(value = "/list", method = RequestMethod.GET)
	public String list() {
		return "admin/chargeitemlist";
	}

	@GetMapping("/listAll")
	@ResponseBody
	public PageInfo<Chargeitem> listall(@RequestParam(value = "pn",defaultValue = "1") Integer pn){
		//引入pageHelper分页插件，在查询之前只需要调用，传入页码以及分页每页的大小
		PageHelper.startPage(pn, 8);
		//startPage后面紧跟着这个查询就是一个分页查询
		List<Chargeitem> users = ciService.selectAll();
		//连续显示的页数是5页
		PageInfo<Chargeitem> pageInfo = new PageInfo<>(users, 8);
		return pageInfo;
	}
	
	/**
	 * 单个和批量删除
	 * @param ids
	 * @return
	 */
	@ResponseBody
	@RequestMapping(value = "/del/{cid}", method = RequestMethod.DELETE)
	public Msg del(@PathVariable("cid") String ids) {
		if (ids.indexOf(",") == -1) {
            ciService.deleteByPrimaryKey(Integer.parseInt(ids));
        } else {
            String[] idArr = ids.split(",");
            for (String idStr : idArr) {
            	ciService.deleteByPrimaryKey(Integer.parseInt(idStr));
            }
        }
		return Msg.success();
	}
	
	@ResponseBody
	@RequestMapping(value = "/update/{cid}", method = RequestMethod.PUT)
	public Msg update(Chargeitem house) {
		int i = ciService.updateByPrimaryKey(house);
		if (i>0){
			return Msg.success();
		}else {
			return Msg.fail();
		}
	}
	
	@ResponseBody
    @RequestMapping(value = "/save", method = RequestMethod.POST)
    public Msg save(Chargeitem chargeitem) {
        ciService.insert(chargeitem);
        return Msg.success();
    }
	
	@ResponseBody
    @RequestMapping(value = "/validateName")
    public Msg validateHcode(@RequestParam("ccode") String ccode) {
        boolean result = ciService.validateHcode(ccode);
        // 返回TRUE，业主编号可用
        if (result) {
            return Msg.success();
        }
        return Msg.fail();
    }

}
