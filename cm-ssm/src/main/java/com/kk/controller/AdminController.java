package com.kk.controller;

import com.kk.pojo.Admin;
import com.kk.service.IAdminService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import javax.servlet.http.HttpSession;

@Controller
@RequestMapping("/admin")
public class AdminController {
	@Autowired private IAdminService adminService;

	/**
	 * 管理员登录
	 * @param aName
	 * @param aPassword
	 * @param session
	 * @return
	 */
	@RequestMapping(value = "/login",method = RequestMethod.POST)
	public String doLogin(String aName,String aPassword, HttpSession session) {
		session.removeAttribute("msg");
		//根据管理员名获取管理员信息
		Admin admin = adminService.getAdminByName(aName);
		if (admin==null){
			session.setAttribute("msg","管理员用户名不存在");
			return "/admin/login";
		}else if (!admin.getApwd().equals(aPassword)){
			session.setAttribute("msg","管理员密码输入错误");
			return "/admin/login";
		}

		session.setAttribute("admin",admin);
		return "/admin/index";
	}

	/**
	 * 管理员退出，清除session
	 * @param session
	 * @return
	 */
	@RequestMapping("/logout")
	public String logout(HttpSession session) {
		session.removeAttribute("admin");
		return "admin/login";
	}

}
