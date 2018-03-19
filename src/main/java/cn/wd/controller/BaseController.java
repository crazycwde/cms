package cn.wd.controller;

import javax.servlet.http.HttpSession;

import cn.wd.pojo.User;
import cn.wd.utils.servlet.LoginInterceptor;

public class BaseController {
	/*操作成功时的返回值*/
	public static final String SUCCESS="success";
	
	/*操作失败时的返回值*/
	public static final String ERROR="error";
	
	/*
	 * 根据HttpSession获取到当前用户
	 * 
	 */
	public User getUser(HttpSession session) {
		return (User) session.getAttribute(LoginInterceptor.LOGIN_INFO);
	}
}
