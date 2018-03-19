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

}
