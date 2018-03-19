package cn.wd.service.apply;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import cn.wd.db.dao.ApplyMapper_Ext;
import cn.wd.pojo.Apply;
import cn.wd.service.OperErrCode;
import cn.wd.service.OperException;
import cn.wd.utils.EasyuiComboBoxItem;
import cn.wd.utils.EasyuiDatagrid;
import cn.wd.utils.StringUtils;

@Service
public class ApplyYNService {
	private static final OperErrCode 状态不能为空 = new OperErrCode("30001", "状态不能为空");
	
	@Autowired
	private ApplyMapper_Ext applyDao;

	public EasyuiDatagrid<Apply> getEasyuiDatagridQuery() {
		EasyuiDatagrid<Apply> list = new EasyuiDatagrid<Apply>();
		List<Apply> alist;
		int count = applyDao.getCount();
		if (count == 0) {
			alist = new ArrayList<Apply>();
			list.setRows(alist);
		} else {
			alist = applyDao.selectList(null);
			list.setRows(alist);
		}
		list.setTotal(count);
		return list;
	}
	
	public Apply getApplyById(int id) {
		Apply apply = new Apply();
		apply.setId(id);
		apply = applyDao.selectByPrimaryKey(id);
		return apply;
	}
	
	public List<EasyuiComboBoxItem>  getCombobox() {
		List<EasyuiComboBoxItem> list = new ArrayList<EasyuiComboBoxItem>();
		EasyuiComboBoxItem easy = new EasyuiComboBoxItem();
		easy.setId("0");
		easy.setText("同意");
		list.add(easy);
		EasyuiComboBoxItem easyui = new EasyuiComboBoxItem();
		easyui.setId("1");
		easyui.setText("拒绝");
		list.add(easyui);
		return list;
	}
	
	@Transactional(rollbackFor = Exception.class)
	public void updateApplyYN(Apply apply) throws OperException{
		if(!StringUtils.trim(apply.getState())) {
			throw new OperException(状态不能为空);
		}
		if(apply.getState().equals("0")) {
			apply.setState("同意");
		}else {
			apply.setState("拒绝");
		}
		applyDao.updateByPrimaryKey(apply);
	}

	public EasyuiDatagrid<Apply> getEasyuiDatagridApplyY() {
		EasyuiDatagrid<Apply> list = new EasyuiDatagrid<Apply>();
		List<Apply> alist ;
		int count = applyDao.getCountY();
		if(count == 0) {
			alist = new ArrayList<Apply>();
			list.setRows(alist);
		}else {
			alist = applyDao.selectY(null);
			list.setRows(alist);
		}
		list.setTotal(count);
		return list;
	}
}
