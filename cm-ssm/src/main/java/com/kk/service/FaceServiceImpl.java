package com.kk.service;

import com.alibaba.fastjson.JSONArray;
import com.alibaba.fastjson.JSONObject;
import com.github.pagehelper.PageInfo;
import com.kk.mapper.FaceMapper;
import com.kk.mapper.UserMapper;
import com.kk.pojo.Face;
import com.kk.pojo.FaceExtend;
import com.kk.pojo.User;
import com.kk.utils.BaiduFace;
import com.kk.utils.ImageSwitcher;
import org.springframework.beans.BeanUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.sql.Date;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.List;
import java.util.UUID;

/**
 * @ClassName FaceServiceImpl.java
 * @Description : TODO
 * @Author : stop
 * @Date : 2022/3/31  12:25
 * @Version : 1.0
 **/
@Service
public class FaceServiceImpl implements FaceService{
    @Autowired
    FaceMapper faceMapper;
    @Autowired
    UserMapper userMapper;
    @Override
    public int addFace(Face face) {
        return faceMapper.addFace(face);
    }

    @Override
    public PageInfo<FaceExtend> faceList() {
        List<Face> list = faceMapper.faceList();
        PageInfo<Face> pageInfo = new PageInfo<>(list);
        List<FaceExtend> newList=  new ArrayList<>();
        for (Face face : list) {
            FaceExtend faceExtend = new FaceExtend();
            faceExtend.setFace_token(face.getFace_token());
            User user = userMapper.selectByPrimaryKey(Integer.parseInt(face.getUid()));
            faceExtend.setUser(user);
            faceExtend.setTime(face.getTime());

            newList.add(faceExtend);
        }
        PageInfo<FaceExtend> newPageInfo = new PageInfo<>();
        BeanUtils.copyProperties(pageInfo,newPageInfo);
        newPageInfo.setList(newList);
        return newPageInfo;
    }

    @Override
    public String openFaceDoor(String image) {
        SimpleDateFormat format = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
        //返回人脸检测结果
        String sampleResult = BaiduFace.sample(image);
        //获取结果的提示信息
        Object error_msg = JSONObject.parseObject(sampleResult).get("error_msg");
        //如果是人脸则进行人脸搜索
        if ("SUCCESS".equals(error_msg.toString())){
            //获取人脸搜索结果
            String searchResult = BaiduFace.faceSearch(image);
            //获取人脸搜索得分
            JSONObject jsonObject = JSONObject.parseObject(searchResult);
            JSONObject result = jsonObject.getJSONObject("result");
            JSONArray user_list = result.getJSONArray("user_list");
            Integer score = JSONObject.parseObject(user_list.get(0).toString()).getInteger("score");
            //获取时间戳
            Long timestamp = jsonObject.getLong("timestamp");
            String date = format.format(timestamp * 1000L);
            System.out.println("时间"+date);

            //如果得分大于80就通过，保存失败图片到本地
            if (score>80){
                //保存图片到本地
                String uuid = UUID.randomUUID().toString();
                ImageSwitcher.save(image,uuid);

                //获得搜索到的user_id
                String user_id = JSONObject.parseObject(user_list.get(0).toString()).getString("user_id");
                //添加人脸地址到数据库
                Face face = new Face(uuid,user_id,new Date(timestamp * 1000L));
                System.out.println(face);
                System.out.println(format.format(face.getTime().getTime()));
                faceMapper.addFace(face);
            }
            return searchResult;
        }
        return sampleResult;
    }
}
