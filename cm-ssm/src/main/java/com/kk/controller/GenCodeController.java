package com.kk.controller;

import java.awt.*;
import java.awt.image.BufferedImage;
import java.io.IOException;
import java.util.Locale;
import java.util.Random;

import javax.imageio.ImageIO;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

@Controller
public class GenCodeController {
	@RequestMapping("/image")
	public void genImgCode(HttpServletRequest request, HttpServletResponse response) {
		System.out.println("之前的验证码:"+request.getSession().getAttribute("codes"));
		//防止浏览器缓存验证码
		response.setDateHeader("Expires",-1);
		response.setHeader("Cache-Control","no-Cache");
		response.setHeader("pragma","no-Cache");
		int width = 100;//验证码总宽度
		int height = 30;//验证码总高度
		//         随机数
		char[] codeChar = "ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456".toCharArray();//字符串转换成字符数组
		String captcha = "";//定义一个临时路径
		Random random = new Random();//new 随机类Random
		//         生成验证码图片
		BufferedImage image = new BufferedImage(width, height, BufferedImage.TYPE_INT_RGB);
		//         绘制矩形
		Graphics graphics = image.getGraphics();//绘制环境对象
		graphics.setColor(Color.gray);//背景色
		graphics.fillRect(0, 0, width, height);//绘制矩形

		//         生成验证码图片
		for (int i = 0; i < 4; i++) {
			int index = random.nextInt(codeChar.length);
			//设置字体大小
			graphics.setFont(new Font("黑体", Font.BOLD, 26));
			// 设置验证码字体图片颜色
			graphics.setColor(new Color(random.nextInt(110), random.nextInt(150), random.nextInt(200)));
			// 每个验证码字体的宽间距，高度
			graphics.drawString(codeChar[index] + "", (i * 20) + 15, 22);

			captcha += codeChar[index];//把生成的验证码保存在临时变量中
		}
		request.getSession().setAttribute("codes", captcha); //把验证码保存在Session对象中
		//         利用ImageI0输出验证码
		System.out.println("现在的验证码："+captcha);
		try {
			ImageIO.write(image, "jpg", response.getOutputStream());
		} catch (IOException e) {
			e.printStackTrace();
		}finally {
		}
	}

	@RequestMapping("/isCode")
	@ResponseBody
	public boolean isCode(String code,HttpServletRequest request, HttpServletResponse response) {
		String codes  = request.getSession().getAttribute("codes").toString();
		codes = codes.toLowerCase();
		code = code.toLowerCase();

		System.out.println("输入的验证码"+code+"长度:"+code.length());
		System.out.println("开始验证的验证码:"+codes+"长度:"+code.length());
		System.out.println(code.equals(codes));
		if (code.equals(codes)){
			return true;
		}else {
			return false;
		}
	}
}
