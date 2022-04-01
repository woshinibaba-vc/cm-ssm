package com.kk.controller;

import com.alibaba.fastjson.JSONArray;
import com.alibaba.fastjson.JSONObject;
import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import com.kk.pojo.Face;
import com.kk.pojo.FaceExtend;
import com.kk.service.FaceService;
import com.kk.utils.BaiduFace;
import com.kk.utils.ImageSwitcher;
import org.apache.ibatis.annotations.Param;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;

import javax.servlet.http.HttpServletRequest;
import java.sql.Date;
import java.text.SimpleDateFormat;
import java.util.List;
import java.util.UUID;

/**
 * @ClassName FaceController.java
 * @Description : TODO
 * @Author : stop
 * @Date : 2022/3/29  22:19
 * @Version : 1.0
 **/
@Controller
@ResponseBody
@RequestMapping("/face")
public class FaceController {
    @Autowired
    FaceService faceService;

    /**
     * 添加注册人脸
     * @param image  前端拍照出传入的图片base64字符串
     * @param userId 用户id
     * @return
     */
    @PostMapping("/addUser")
    public String addUser(String image,String userId){
        //返回人脸检测结果
        String sampleResult = BaiduFace.sample(image);
        //获取结果的提示信息
        Object error_msg = JSONObject.parseObject(sampleResult).get("error_msg");
        //如果是人脸则进行人脸注册
        if (error_msg.toString().equals("SUCCESS")){
            String addUserResult = BaiduFace.addUser(image, userId);
            return addUserResult;
        }
        return sampleResult;
    }

    /**
     * 搜索人脸
     * @param image
     * @return
     */
    @PostMapping("/sample")
    public String sample(String image){
        String result = faceService.openFaceDoor(image);
        return result;
    }


    @GetMapping("/faceList")
    public PageInfo<FaceExtend> faceList(@RequestParam(value = "pn",defaultValue = "1") Integer pn){
        System.out.println(pn);
        PageHelper.startPage(pn,4);
        PageInfo<FaceExtend> faceExtendPageInfo = faceService.faceList();
        return faceExtendPageInfo;
    }
}
