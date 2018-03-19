package cn.wd.service.query;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import cn.wd.db.dao.CarfuelMapper_Ext;
import cn.wd.db.dao.CarreparisMapper_Ext;
import cn.wd.pojo.Carfuel;
import cn.wd.pojo.Carreparis;
import cn.wd.utils.EasyuiDatagrid;

@Service
public class QueryService {
	
	@Autowired
	private CarfuelMapper_Ext carfuelDao;
	
	@Autowired
	private CarreparisMapper_Ext carReDao;
	
	public EasyuiDatagrid<Carfuel> getCarfuleList(){
		EasyuiDatagrid<Carfuel> list = new EasyuiDatagrid<Carfuel>();
		List<Carfuel> car ;
		int count = carfuelDao.getCount();
		if(count == 0) {
			car = new ArrayList<>();
			list.setRows(car);
		}else {
			car = carfuelDao.selectList(null);
			list.setRows(car);
		}
		list.setTotal(count);
		
		return list;
	}
	
	public EasyuiDatagrid<Carreparis> getCarReparisList(){
		EasyuiDatagrid<Carreparis> list = new EasyuiDatagrid<Carreparis>();
		List<Carreparis> car ;
		int count = carReDao.getCount();
		if(count == 0) {
			car = new ArrayList<>();
			list.setRows(car);
		}else {
			car = carReDao.selectList(null);
			list.setRows(car);
		}
		list.setTotal(count);
		
		return list;
	}
}
