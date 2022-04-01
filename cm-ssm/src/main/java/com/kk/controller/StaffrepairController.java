package com.kk.controller;

import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import com.kk.pojo.Staffrepair;
import com.kk.pojo.Msg;
import com.kk.service.IStaffrepairService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import java.util.List;

@Controller
@RequestMapping("/staff")
public class StaffrepairController {
	@Autowired private IStaffrepairService staffrepairService;

	@RequestMapping("/list")
	public String listall(Model model) {
		return "admin/stafflist";
	}

	@RequestMapping(value = "/listall", method = RequestMethod.GET)
	@ResponseBody
	public PageInfo<Staffrepair> list(@RequestParam(value = "pn", defaultValue = "1") Integer pn) {
		//引入pageHelper分页插件，在查询之前只需要调用，传入页码以及分页每页的大小
        PageHelper.startPage(pn, 8);
        //startPage后面紧跟着这个查询就是一个分页查询
		List<Staffrepair> users = staffrepairService.selectAll();
		//连续显示的页数是5页
		PageInfo<Staffrepair> pageInfo = new PageInfo<>(users, 8);
		return pageInfo;
	}
	
	/**
	 * 单个和批量删除
	 * @param ids
	 * @return
	 */
	@ResponseBody
	@RequestMapping(value = "/del/{hid}", method = RequestMethod.DELETE)
	public Msg del(@PathVariable("hid") String ids) {
		System.out.println(ids);
		if (ids.indexOf(",") == -1) {
            staffrepairService.deleteByPrimaryKey(Integer.parseInt(ids));
        } else {
            String[] idArr = ids.split(",");
            for (String idStr : idArr) {
            	staffrepairService.deleteByPrimaryKey(Integer.parseInt(idStr));
            }
        }
		return Msg.success();
	}
	
	@ResponseBody
	@RequestMapping(value = "/update/{sid}", method = RequestMethod.PUT)
	public Msg update(Staffrepair staffrepair) {
		System.out.println("staffrepair"+staffrepair);
		int i = staffrepairService.updateByPrimaryKey(staffrepair);
		System.out.println("i="+i);
		return Msg.success();
	}
	
	@ResponseBody
    @RequestMapping(value = "/save", method = RequestMethod.POST)
    public Msg save(Staffrepair house) {
		int i = staffrepairService.insert(house);
		if (i>0){
			return Msg.success();
		}
		return Msg.fail();
    }
	
	@ResponseBody
    @RequestMapping(value = "/validateName")
    public Msg validateHcode(@RequestParam("scode") String scode) {
        boolean result = staffrepairService.validateHcode(scode);
        // 返回TRUE，业主编号可用
        if (result) {
            return Msg.success();
        }
        return Msg.fail();
    }

}