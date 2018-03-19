package cn.wd.controller.apply;


import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import cn.wd.controller.BaseController;
import cn.wd.pojo.Apply;
import cn.wd.service.OperException;
import cn.wd.service.apply.ApplyService;

@Controller
@RequestMapping("console/apply/")
public class ApplyController extends BaseController{
	
	@Autowired
	private ApplyService aService;
	
	public static final String ROOT = "console/apply/";
	
	@RequestMapping("carapplyUI.do")
	public String carapplyUI() {
		return ROOT + "carapply";
	}
	
	
	@RequestMapping("carapply.do")
	@ResponseBody
	public String carapply(Apply apply) {
		try {
			aService.insertSelective(apply);
		} catch (OperException e) {
			return e.getErrCode().getMsg();
		}
		return SUCCESS;
	}
}
