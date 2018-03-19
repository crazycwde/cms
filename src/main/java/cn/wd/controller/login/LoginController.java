package cn.wd.controller.login;

import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import cn.wd.controller.BaseController;
import cn.wd.pojo.User;
import cn.wd.service.OperException;
import cn.wd.service.user.UserService;

@Controller
@RequestMapping("console/user/")
public class LoginController extends BaseController {
	private static final Logger logger = LoggerFactory.getLogger(LoginController.class);

	@Autowired
	UserService userService;

	public static final String ROOT = "console/sys/";

	@RequestMapping("loginUI.do")
	public String loginUI() {
		return ROOT + "loginUI";
	}

	@RequestMapping("login.do")
	@ResponseBody
	public String login(HttpSession session, String uname, String upw) {
		User user = new User();
		user.setUname(uname);
		user.setPw(upw);
		user = userService.getUser(user);
		if (user != null) {
			session.setAttribute("loginInfo", user);
			return SUCCESS;
		} else
			return "";
	}

	@RequestMapping("quit.do")
	public String quit(HttpSession session) {
		session.invalidate();
		return "redirect:loginUI.do";
	}

	@RequestMapping("updatePwdUI.do")
	public String updatePwdUI() {
		return ROOT + "updatePwd";
	}

	@RequestMapping("updatePwd.do")
	@ResponseBody
	public String updatePwdUI(HttpServletResponse response, HttpSession session, String oldpwd, String newpwd) {
		try {
			userService.changePasswdByid(getUser(session), oldpwd, newpwd);
			return SUCCESS;
		} catch (OperException e) {
			return e.getErrCode().getMsg();
		}
	}

	/**
	 * 返回显示用户信息的对话框
	 * @return
	 */
	@RequestMapping("msgUser.do")
	public String getUser() {
		return ROOT + "msgUser";
	}

}
