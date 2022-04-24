package com.kk.controller;

import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import com.kk.pojo.Garage;
import com.kk.pojo.Msg;
import com.kk.service.GarageService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import java.util.Date;
import java.util.List;

@Controller
@RequestMapping("/garage")
public class GarageController {
	@Autowired private GarageService garageService;

	@RequestMapping("/list")
	public String listall(Model model) {
		return "admin/garage";
	}

	@RequestMapping(value = "/listall", method = RequestMethod.GET)
	@ResponseBody
	public PageInfo<Garage> list(@RequestParam(value = "pn", defaultValue = "1") Integer pn) {
		//引入pageHelper分页插件，在查询之前只需要调用，传入页码以及分页每页的大小
        PageHelper.startPage(pn, 8);
        //startPage后面紧跟着这个查询就是一个分页查询
		List<Garage> users = garageService.selectAll();
		//连续显示的页数是5页
		PageInfo<Garage> pageInfo = new PageInfo<>(users, 8);
		return pageInfo;
	}
	
	/**
	 * 单个和批量删除
	 * @param ids
	 * @return
	 */
	@ResponseBody
	@RequestMapping(value = "/del/{pid}", method = RequestMethod.DELETE)
	public Msg del(@PathVariable("pid") String ids) {
		System.out.println(ids);
		if (ids.indexOf(",") == -1) {
			garageService.deleteByPrimaryKey(Integer.parseInt(ids));
        } else {
            String[] idArr = ids.split(",");
            for (String idStr : idArr) {
				garageService.deleteByPrimaryKey(Integer.parseInt(idStr));
            }
        }
		return Msg.success();
	}
	
	@ResponseBody
	@RequestMapping(value = "/update/{gid}", method = RequestMethod.PUT)
	public Msg update(Garage garage) {
		System.out.println("garage:"+garage);
		int i = garageService.updateByPrimaryKey(garage);
		System.out.println("i="+i);
		return Msg.success();
	}
	
	@ResponseBody
    @RequestMapping(value = "/save", method = RequestMethod.POST)
    public Msg save(Garage garage) {
		garage.setGstartTime(new Date());
		System.out.println(garage);
		int i = garageService.insert(garage);
		if (i>0){
			return Msg.success();
		}
		return Msg.fail();
    }

}