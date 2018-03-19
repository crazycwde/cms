package cn.wd.controller.fuels;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import cn.wd.controller.BaseController;
import cn.wd.pojo.Carfuel;
import cn.wd.pojo.Fuels;
import cn.wd.service.OperException;
import cn.wd.service.fules.FuelsService;

@Controller
@RequestMapping("console/fuels/")
public class FuelsController extends BaseController{
	
	@Autowired
	private FuelsService fService;
	
	private static final String ROOT = "/console/fuels/";
	
	@RequestMapping("insertFuelsUI.do")
	public String getinsertFuelsUI() {
		return ROOT + "insertFuelsUI";
	}
	
	@RequestMapping("updateFuelsUI.do")
	public String getupdateFuelsUI(int exelId,Model m) {
		Fuels fuels = fService.getFuels(exelId);
		m.addAttribute("fuels", fuels);
		return ROOT + "updateFuelsUI";
	}
	
	@RequestMapping("updateFuels.do")
	@ResponseBody
	public String updateFuels(Fuels fuels) {
		try {
			fService.updateSelective(fuels);
		} catch (OperException e) {
			return e.getErrCode().getMsg();
		}
		return SUCCESS;
	}
	
	@RequestMapping("insertFuels.do")
	@ResponseBody
	public String insertFuels(Fuels fuels) {
		try {
			fService.insertSelective(fuels);
		} catch (OperException e) {
			return e.getErrCode().getMsg();
		}
		return SUCCESS;
	}
}
