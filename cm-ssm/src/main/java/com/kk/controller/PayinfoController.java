package com.kk.controller;

import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import com.kk.pojo.Payinfo;
import com.kk.pojo.PayinfoExtend;
import com.kk.pojo.Msg;
import com.kk.service.IPayinfoService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

@Controller
@RequestMapping("/payinfo")
public class PayinfoController {
	@Autowired private IPayinfoService payinfoService;

	@RequestMapping(value = "/list", method = RequestMethod.GET)
	public String list(){
		return "admin/payinfo";
	}

	@GetMapping("/listAll")
	@ResponseBody
	public PageInfo<PayinfoExtend> listAll(@RequestParam(value = "pn", defaultValue = "1") Integer pn, Model model) {
		//引入pageHelper分页插件，在查询之前只需要调用，传入页码以及分页每页的大小
		PageHelper.startPage(pn, 8);
		//startPage后面紧跟着这个查询就是一个分页查询
		PageInfo<PayinfoExtend> pagefo = payinfoService.selectAll();
		return pagefo;
	}
	
	@RequestMapping(value = "/listapp", method = RequestMethod.GET)
	public String listapp(@RequestParam(value = "pn", defaultValue = "1") Integer pn, Model model) {
		//引入pageHelper分页插件，在查询之前只需要调用，传入页码以及分页每页的大小
        PageHelper.startPage(pn, 4);
        //startPage后面紧跟着这个查询就是一个分页查询
		PageInfo<PayinfoExtend> pageInfo = payinfoService.selectAll();
		model.addAttribute("pageInfo", pageInfo);
		return "app/payinfolist";
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
            payinfoService.deleteByPrimaryKey(Integer.parseInt(ids));
        } else {
            String[] idArr = ids.split(",");
            for (String idStr : idArr) {
            	payinfoService.deleteByPrimaryKey(Integer.parseInt(idStr));
            }
        }
		return Msg.success();
	}
	
	@ResponseBody
	@PutMapping(value = "/update/{pid}")
	public Msg update(Payinfo house) {
		System.out.println(house);
		int i = payinfoService.updateByPrimaryKey(house);
		if (i>0){
			return Msg.success();
		}else {
			return Msg.fail();
		}
	}
	
	@ResponseBody
    @RequestMapping(value = "/save", method = RequestMethod.POST)
    public Msg save(Payinfo house) {
		System.out.println(house);
		int i = payinfoService.insert(house);
		if (i > 0){
			return Msg.success();
		}else {
			return Msg.fail();
		}
    }
}
