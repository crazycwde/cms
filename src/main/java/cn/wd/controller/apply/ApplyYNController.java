package cn.wd.controller.apply;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import cn.wd.controller.BaseController;
import cn.wd.pojo.Apply;
import cn.wd.pojo.Driverinfo;
import cn.wd.service.OperException;
import cn.wd.service.apply.ApplyYNService;
import cn.wd.utils.EasyuiComboBoxItem;
import cn.wd.utils.EasyuiDatagrid;

@Controller
@RequestMapping("console/applyYN/")
public class ApplyYNController extends BaseController {
	private static final String ROOT = "console/apply/";

	@Autowired
	private ApplyYNService aYNService;

	@RequestMapping("applyYNUI.do")
	public String applyYNUI() {
		return ROOT + "applyYNUI";
	}

	@RequestMapping("applyYUI.do")
	public String applyYUI() {
		return ROOT + "applyYUI";
	}

	@RequestMapping("apply.do")
	@ResponseBody
	public EasyuiDatagrid<Apply> getEasyuiDatagridQuery() {
		return aYNService.getEasyuiDatagridQuery();
	}
	
	@RequestMapping("applyY.do")
	@ResponseBody
	public EasyuiDatagrid<Apply> getEasyuiDatagridApplyY() {
		return aYNService.getEasyuiDatagridApplyY();
	}

	@RequestMapping("updateApplyYNUI.do")
	public String updateApplyYNUI(int id, Model m) {
		Apply apply = aYNService.getApplyById(id);
		m.addAttribute("apply", apply);
		return ROOT + "updataApplyYN";
	}

	@RequestMapping("combobox.do")
	@ResponseBody
	public List<EasyuiComboBoxItem> getCombobox() {
		return aYNService.getCombobox();
	}

	@RequestMapping("updateApplyYN.do")
	@ResponseBody
	public String updateApplyYN(Apply apply) {
		try {
			aYNService.updateApplyYN(apply);
		} catch (OperException e) {
			return e.getMessage();
		}
		return SUCCESS;
	}
	
	@RequestMapping("queryDriverUI.do")
	public String queryDriverUI() {
		return ROOT + "queryDriverUI";
	}
	
	@RequestMapping("getDriverDatagrid.do")
	@ResponseBody
	public EasyuiDatagrid<Driverinfo> getDriverDatagrid(){
		return aYNService.getDriverDatagrid();
	}
	
	@RequestMapping("queryDriver.do")
	@ResponseBody
	public Driverinfo queryDriver(Integer id) {
		return aYNService.getDriverinfo(id);
	}
}
