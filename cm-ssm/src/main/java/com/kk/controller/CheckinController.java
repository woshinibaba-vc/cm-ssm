package com.kk.controller;

import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import com.kk.pojo.Checkin;
import com.kk.pojo.Msg;
import com.kk.service.CheckinService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import java.util.List;

@Controller
@RequestMapping("/checkin")
public class CheckinController {
	@Autowired
	private CheckinService checkinService;

	@RequestMapping(value = "/list", method = RequestMethod.GET)
	public String list() {
		return "admin/checkinlist";
	}

	/**
	 * 返回分页信息
	 * @param pn  当前页码
	 * @return
	 */
	@GetMapping("/listAll")
	@ResponseBody
	public PageInfo<Checkin> listAll(@RequestParam(value = "pn",defaultValue = "1") Integer pn){
		PageHelper.startPage(pn,8);
		List<Checkin> checkins = checkinService.selectAll();
		PageInfo<Checkin> pageInfo = new PageInfo<>(checkins);
		return pageInfo;
	}

	/**
	 * 单个和批量删除
	 * @param ids
	 * @return
	 */
	@ResponseBody
	@RequestMapping(value = "/del/{id}", method = RequestMethod.DELETE)
	public Msg del(@PathVariable("id") String ids) {
		System.out.println(ids);
		if (ids.indexOf(",") == -1) {
            checkinService.deleteByPrimaryKey(Integer.parseInt(ids));
        } else {
            String[] idArr = ids.split(",");
            for (String idStr : idArr) {
            	checkinService.deleteByPrimaryKey(Integer.parseInt(idStr));
            }
        }
		return Msg.success();
	}

	@ResponseBody
    @RequestMapping(value = "/save", method = RequestMethod.POST)
    public Msg save(Checkin checkin) {
        checkinService.insert(checkin);
        return Msg.success();
    }
}
