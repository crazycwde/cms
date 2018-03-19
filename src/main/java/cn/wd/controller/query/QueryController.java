package cn.wd.controller.query;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import cn.wd.controller.BaseController;
import cn.wd.pojo.Carfuel;
import cn.wd.pojo.Carreparis;
import cn.wd.service.query.QueryService;
import cn.wd.utils.EasyuiDatagrid;

@Controller
@RequestMapping("console/query/")
public class QueryController extends BaseController{
	
	@Autowired
	private QueryService qService;
	public static final String ROOT = "console/query/";
	
	@RequestMapping("fuelsUI.do")
	public String fuelsUI() {
		return ROOT + "fuelsUI";
	}
	
	@RequestMapping("fuels.do")
	@ResponseBody
	public EasyuiDatagrid<Carfuel> getEasyuiDatagridFuels(){
		return qService.getCarfuleList();
	}
	
	@RequestMapping("reparisUI.do")
	public String reparisUI() {
		return ROOT + "reparisUI";
	}
	
	@RequestMapping("reparis.do")
	@ResponseBody
	public EasyuiDatagrid<Carreparis> getEasyuiDatagridReparis(){
		return qService.getCarReparisList();
	}
}
