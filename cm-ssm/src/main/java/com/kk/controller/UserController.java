package com.kk.controller;

import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import com.kk.pojo.LoginUser;
import com.kk.pojo.User;
import com.kk.pojo.UserExtend;
import com.kk.pojo.Msg;
import com.kk.service.ILoginUserService;
import com.kk.service.IUserService;
import com.kk.utils.BaiduFace;
import org.springframework.beans.BeanUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.propertyeditors.CustomDateEditor;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.util.DigestUtils;
import org.springframework.web.bind.WebDataBinder;
import org.springframework.web.bind.annotation.*;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

@Controller
@RequestMapping("/user")
public class UserController {
	@Autowired private IUserService userService;
	@Autowired private ILoginUserService iLoginUserService;

	/**
	 * 切换到业主信息列表
	 * @return
	 */
	@RequestMapping(value = "/list", method = RequestMethod.GET)
	public String gotoUserList() {
		return "admin/userlist";
	}

	@GetMapping("/userList")
	@ResponseBody
	public PageInfo<UserExtend> list(@RequestParam(value = "pn",defaultValue = "1") Integer pn){
		//开启分页
		PageHelper.startPage(pn,8);
		PageInfo<UserExtend> info = userService.selectAll();
//		PageInfo<UserExtend> pageInfo= new PageInfo<>(userExtends,5);
		return info;
	}

	@InitBinder
	public void initBinder(WebDataBinder binder) {
	   SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd");
	   dateFormat.setLenient(false);
	   binder.registerCustomEditor(Date.class, new CustomDateEditor(dateFormat, false));
	}

	/**
	 * 登录
	 * @param uname
	 * @param upassword
	 * @param model
	 * @return
	 */
	@RequestMapping(value = "/login", method= RequestMethod.POST)
    public String userLogin(String uname,String upassword,Model model) {
		//根据用户名获取登录对象
		LoginUser loginUser = iLoginUserService.selectgetUserByName(uname);
		if(loginUser == null) {
			model.addAttribute("msg", "登录名输入错误！");
			return "app/login";
		}else if (!loginUser.getlPwd().equals(upassword)){
			model.addAttribute("msg", "密码输入错误！");
			return "app/login";
		}
		model.addAttribute("loginUser",loginUser);
		return "app/index";
    }

	@RequestMapping(value = "/reg", method = RequestMethod.POST)
	public String addUser(HttpServletRequest request){
		String uname = request.getParameter("lName");
		String upwd = request.getParameter("lPwd");
		String code = request.getParameter("code");
		String sCode = (String) request.getSession().getAttribute("sCode");
		if(!code.equalsIgnoreCase(sCode)){
			request.setAttribute("msg", "验证码输入错误！");
			System.out.println("验证码输入错误");
			return "app/register";
		}
		if(!uname.trim().equals("") && !upwd.trim().equals("")) {
			LoginUser loginUser = new LoginUser();
			loginUser.setlName(uname);
			// MD5进行密码加密
			loginUser.setlPwd(DigestUtils.md5DigestAsHex(upwd.getBytes()));
			iLoginUserService.insert(loginUser);
			request.setAttribute("msg", "注册成功！");
			System.out.println("注册成功");
			return "app/login";
		}else {
			request.setAttribute("msg", "请正确填写！");
			System.out.println("请正确填写");
			return "app/register";
		}
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
		if (!ids.contains(",")) {
            userService.deleteByPrimaryKey(Integer.parseInt(ids));
            //删除用户人俩库
			BaiduFace.deleteUser(ids);
        } else {
            String[] idArr = ids.split(",");
            for (String idStr : idArr) {
            	userService.deleteByPrimaryKey(Integer.parseInt(idStr));
            	//删除用户人脸库
				BaiduFace.deleteUser(idStr);
            }
        }
		return Msg.success();
	}
	
	@ResponseBody
	@RequestMapping(value = "/update/{hid}", method = RequestMethod.PUT)
	public Msg update(User house) {
		System.out.println(house.getUname());
		int i = userService.updateByPrimaryKey(house);
		if(i>0) {
			return Msg.success();
		}else{
			return Msg.fail();
		}
	}

	/**
	 * 新增住户
	 * @param user
	 * @return
	 */
	@ResponseBody
    @RequestMapping(value = "/save", method = RequestMethod.POST)
    public Msg save(User user) {
		System.out.println("wer"+user);
		int i = userService.insert(user);
		if (i > 0){
			return Msg.success();
		}else {
			return Msg.fail();
		}
    }
	
	@ResponseBody
    @RequestMapping(value = "/validateName")
    public Msg validateHcode(@RequestParam("ucode") String ucode) {
        boolean result = userService.validateHcode(ucode);
        // 返回TRUE，业主编号可用
        if (result) {
            return Msg.success();
        }
        return Msg.fail();
    }
	
	protected void setSession(HttpServletRequest request, String key, String value, int timeNum) {
		HttpSession session = request.getSession();
		session.setAttribute(key, value);
		session.setMaxInactiveInterval(timeNum*60);
	}
}
