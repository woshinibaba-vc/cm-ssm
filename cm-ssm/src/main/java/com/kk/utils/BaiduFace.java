package com.kk.utils;

import com.baidu.aip.face.AipFace;
import org.json.JSONObject;

import java.util.HashMap;

/**
 * @ClassName BaiduFace.java
 * @Description : TODO
 * @Author : stop
 * @Date : 2022/3/29  21:48
 * @Version : 1.0
 **/
public class BaiduFace {
    //设置APPID/AK/SK
    private static final String APP_ID = "25857494";
    private static final String API_KEY = "edPkLZUjXgFmnvCYQ3DRXmwl";
    private static final String SECRET_KEY = "fIGnxSqsjTsoN9h5TRHABE0BraIrfTRA";

    // 初始化一个AipFace
    public static AipFace client = null;
    static {
        client = new AipFace(APP_ID, API_KEY, SECRET_KEY);
        // 可选：设置网络连接参数
        client.setConnectionTimeoutInMillis(2000);
        client.setSocketTimeoutInMillis(60000);
    }

    public static void main(String[] args) {
//        // 调用接口
//        String image = "取决于image_type参数，传入BASE64字符串或URL字符串或FACE_TOKEN字符串";
//        String imageType = "BASE64";
//
//        // 人脸检测
//        JSONObject res = client.detect(image, imageType, options);
//        System.out.println(res.toString(2));
    }

    /**
     * 人脸检测
     * @param image 图片BASE64字符串
     * @return json字符串，返回人脸检测结果
     */
    public static String sample(String image) {
        // 传入可选参数调用接口
        HashMap<String, Object> options = new HashMap<>();
        options.put("face_field", "age");
        options.put("max_face_num", "2");
        options.put("face_type", "LIVE");
        options.put("liveness_control", "LOW");

        //取决于image_type参数，传入BASE64字符串或URL字符串或FACE_TOKEN字符串
        String imageType = "BASE64";

        // 人脸检测
        JSONObject res = client.detect(image, imageType, options);
        System.out.println(res.toString(2));
        return res.toString();
    }

    /**
     * 人脸搜索
     * @param image 图片BASE64字符串
     * @return json字符串，返回人脸检测结果
     */
    public static String faceSearch(String image) {
        // 传入可选参数调用接口
        HashMap<String, Object> options = new HashMap();

        String imageType = "BASE64";
        //在那些用户组搜索，逗号分隔
        String groupIdList = "face";

        // 人脸搜索
        JSONObject res = client.search(image, imageType, groupIdList, options);
        System.out.println(res.toString(2));
        return res.toString();
    }

    /**
     * 人脸注册
     * @param image 图片BASE64字符串
     * @param userId 用户id，给那个用户添加人脸
     * @return json字符串，返回人脸注册结果
     */
    public static String addUser(String image,String userId){
        // 传入可选参数调用接口
        HashMap<String, String> options = new HashMap<String, String>();
        options.put("user_info", "user's info");
        options.put("quality_control", "NORMAL");
        options.put("liveness_control", "LOW");
        options.put("action_type", "APPEND");
        //取决于image_type参数，传入BASE64字符串或URL字符串或FACE_TOKEN字符串
        String imageType = "BASE64";
        //百度人脸库中的组id
        String groupId = "face";
        // 人脸注册
        JSONObject res = client.addUser(image, imageType, groupId, userId, options);
        System.out.println(res.toString(2));
        return res.toString();
    }

    /**
     * 删除用户
     * @param userId
     */
    public static void  deleteUser(String userId) {
        // 传入可选参数调用接口
        HashMap<String, String> options = new HashMap<String, String>();
        //设置删除的用户在那个分组
        String groupId = "face";

        // 删除用户
        JSONObject res = client.deleteUser(groupId, userId, options);
        System.out.println(res.toString(2));
    }
}
