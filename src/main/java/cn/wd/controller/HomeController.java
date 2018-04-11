package cn.wd.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("console/")
public class HomeController {
	public static final String ROOT = "console/";

	@RequestMapping("home.do")
	public String home() {
		return ROOT + "home";
	}
	
	@RequestMapping("home1.do")
	public String home1() {
		return ROOT + "home1";
	}
	
	@RequestMapping("home2.do")
	public String home2() {
		return ROOT + "home2";
	}

}
