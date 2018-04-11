package cn.wd.service.query;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import cn.wd.db.dao.CarfuelMapper_Ext;
import cn.wd.db.dao.CarinfoMapper_Ext;
import cn.wd.db.dao.CarreparisMapper_Ext;
import cn.wd.db.dao.VCarDriverMapper_Ext;
import cn.wd.pojo.Carfuel;
import cn.wd.pojo.Carinfo;
import cn.wd.pojo.Carreparis;
import cn.wd.pojo.VCarDriver;
import cn.wd.utils.EasyuiDatagrid;

@Service
public class QueryService {
	
	@Autowired
	private CarfuelMapper_Ext carfuelDao;
	
	@Autowired
	private CarreparisMapper_Ext carReDao;
	
	@Autowired
	private CarinfoMapper_Ext carDao;
	
	@Autowired
	private VCarDriverMapper_Ext vcardDao;
	
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
	
	public EasyuiDatagrid<Carinfo> getCarinfoList(){
		EasyuiDatagrid<Carinfo> list = new EasyuiDatagrid<Carinfo>();
		List<Carinfo> car ;
		int count = carDao.countCar();
		if(count == 0) {
			car = new ArrayList<>();
			list.setRows(car);
		}else {
			car = carDao.selectList(null);
			list.setRows(car);
		}
		list.setTotal(count);
		
		return list;
	}
	
	public EasyuiDatagrid<VCarDriver> getEasyuiDatagridVCarDriver(){
		EasyuiDatagrid<VCarDriver> easy = new EasyuiDatagrid<VCarDriver>();
		List<VCarDriver> list = null;
		int count = vcardDao.getCount();
		if(count == 0) {
			list = new ArrayList<VCarDriver>();
			easy.setRows(list);
		}else {
			list = vcardDao.selectList(null);
			easy.setRows(list);
		}
		easy.setTotal(count);
		return easy;
		
	}
}
