package com.kk.controller;

import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import com.kk.pojo.House;
import com.kk.pojo.Msg;
import com.kk.service.IHouseService;
import com.kk.service.IUserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;

import java.util.List;

@Controller
@RequestMapping("/house")
public class HouseController {
    @Autowired
    private IHouseService houseService;

    /**
     * 跳转至楼房信息页面
     * @return
     */
    @RequestMapping(value = "/list")
    public String list() {
        return "admin/houselist";
    }

    /**
     * 使用PageHelper分页查询hourse
     * @param pn
     * @return
     */
    @ResponseBody
    @RequestMapping(value = "/listall", method = RequestMethod.GET)
    public PageInfo<House> listall(@RequestParam(value = "pn", defaultValue = "1") Integer pn) {
        //引入pageHelper分页插件，在查询之前只需要调用，传入页码以及分页每页的大小
        PageHelper.startPage(pn, 8);
        //startPage后面紧跟着这个查询就是一个分页查询
        List<House> houses = houseService.selectAll();
        //连续显示的页数是5页
        PageInfo<House> pageInfo = new PageInfo<>(houses, 8);
        return pageInfo;
    }

    @ResponseBody
    @RequestMapping(value = "/h_list",method = RequestMethod.GET)
    public Object h_list(){
        return houseService.selectAll();
    }

    /**
     * 更改楼房信息
     * @param house
     * @return  返回是否成功的信息
     */
    @ResponseBody
    @RequestMapping(value = "/update/{hid}", method = RequestMethod.PUT)
    public Msg update(House house) {
        int i = houseService.updateByPrimaryKey(house);
        if (i>0){
            return Msg.success();
        }
        return Msg.fail();
    }
    /**
     * 单个和批量删除
     *
     * @param ids   前端传来的id拼接成的字符串，以，分隔
     * @return
     */
    @ResponseBody
    @RequestMapping(value = "/del/{hid}", method = RequestMethod.DELETE)
    public Msg del(@PathVariable("hid") String ids) {
        //计数，统计删除了多少条
        int count = 0;
        //将id字符串转换为数组
        String[] split = ids.split(",");
        //遍历数组依次删除
        for (String s : split) {
            int i = houseService.deleteByPrimaryKey(Integer.parseInt(s));
            if (i>0){
                count++;
            }
        }
        if (split.length==count){
            return Msg.success();
        }
       return Msg.fail();
    }


    /**
     * 增加楼房
     * @param house
     * @return
     */
    @ResponseBody
    @RequestMapping(value = "/save", method = RequestMethod.POST)
    public Msg save(House house) {
        int i = houseService.insert(house);
        if (i>0){
            return Msg.success();
        }else {
            return Msg.fail();
        }
    }

    /**
     * 校验添加的楼房名字是否重复
     *
     * @param hcode
     * @return
     */
    @ResponseBody
    @RequestMapping(value = "/validateName")
    public Msg validateHcode(@RequestParam("hcode") String hcode) {
        boolean result = houseService.validateHcode(hcode);
        // 返回TRUE，名字可用
        if (result) {
            return Msg.success();
        }
        return Msg.fail();
    }
}
