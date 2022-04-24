package com.kk.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import javax.servlet.http.HttpSession;

@Controller
public class GotoController {
	@RequestMapping("/login")
	public String adminLogin(HttpSession session) {
		session.invalidate();
		return "admin/login";
	}
	@RequestMapping("/admin/index")
	public String adminIndex() {
		return "admin/index";
	}
	@RequestMapping("/app")
	public String appIndex() {
		return "app/index";
	}
	@RequestMapping("/applogin")
	public String appLogin(HttpSession session) {
		session.invalidate();
		return "app/login";
	}
	@RequestMapping("/appreg")
	public String appReg() {
		return "app/register";
	}
	@RequestMapping("/app/logout")
	public String logout(HttpSession session) {
		session.invalidate();
		return "user/login";
	}

	@RequestMapping("/face")
	public String face() {
		return "entrance";
	}

	@RequestMapping("/face/list")
	public String faceList() {
		return "admin/face";
	}

	@RequestMapping("/")
	public String index() {
		return "admin/login";
	}
}
