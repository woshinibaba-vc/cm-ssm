package com.kk.utils;

import sun.misc.BASE64Decoder;

import javax.servlet.http.HttpServletRequest;
import java.io.File;
import java.io.FileOutputStream;
import java.io.OutputStream;
import java.util.UUID;

/**
 * 将base64字符串转换为图片，保存到本地
 * @ClassName ImageSwitcher.java
 * @Description : TODO
 * @Author : stop
 * @Date : 2022/3/31  9:59
 * @Version : 1.0
 **/
public class ImageSwitcher {
    /**
     * 保存base64字符串图片到本地
     * @param image
     */
    public static void save(String image,String uuid){
        BASE64Decoder base64Decoder = new BASE64Decoder();
        try {
            // // Base64 解码 解密
            byte[] b = base64Decoder.decodeBuffer(image);
            // 处理数据
            for (int i = 0; i < b.length; ++i) {
                if (b[i] < 0) {
                    // 调整异常数据
                    b[i] += 256;
                }
            }
            String path="D:/IDEA/IdeaProjects/uplode/face/"+uuid+".png";
            // 新生成的图片
            File file = new File(path);
            OutputStream outputStream = new FileOutputStream(file);
            outputStream.write(b);
            outputStream.flush();
            outputStream.close();
        } catch (Exception e) {
            e.printStackTrace();
        }
    }
}
