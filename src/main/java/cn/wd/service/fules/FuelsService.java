package cn.wd.service.fules;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import cn.wd.db.dao.FuelsMapper_Ext;
import cn.wd.pojo.Fuels;
import cn.wd.service.OperErrCode;
import cn.wd.service.OperException;
import cn.wd.utils.StringUtils;

@Service
public class FuelsService {
	private static final OperErrCode 车辆ID不能为空 = new OperErrCode("40001", "车辆ID不能为空");
	private static final OperErrCode 订单ID不能为空 = new OperErrCode("40002", "订单ID不能为空");
	private static final OperErrCode 油耗时间不能为空 = new OperErrCode("40003", "油耗时间不能为空");
	private static final OperErrCode 目的地不能为空 = new OperErrCode("40004", "目的地不能为空");
	private static final OperErrCode 费用不能为空 = new OperErrCode("40005", "费用不能为空");
	private static final OperErrCode 类型不能为空 = new OperErrCode("40006", "类型不能为空");
	
	@Autowired
	private FuelsMapper_Ext fuelsDao;
	
	@Transactional(rollbackFor=Exception.class)
	public void insertSelective(Fuels fuels) throws OperException{
		if(fuels.getCarId() == 0) {
			throw new OperException(车辆ID不能为空);
		}else if(fuels.getExelId() == null) {
			throw new OperException(订单ID不能为空);
		}else if(fuels.getTime() == null) {
			throw new OperException(油耗时间不能为空);
		}else if(!StringUtils.trim(fuels.getLocation())) {
			throw new OperException(目的地不能为空);
		}else if(fuels.getFee() == null) {
			throw new OperException(费用不能为空);
		}else if(!StringUtils.trim(fuels.getFueltype())) {
			throw new OperException(类型不能为空);
		}
		
		fuelsDao.insertSelective(fuels);
	}
	
	public Fuels getFuels(int exelId) {
		Fuels fuels = new Fuels();
		fuels.setExelId(exelId);
		fuels = fuelsDao.select(fuels);
		return fuels;
	}
	
	@Transactional(rollbackFor=Exception.class)
	public void updateSelective(Fuels fuels) throws OperException{
		if(fuels.getCarId() == 0) {
			throw new OperException(车辆ID不能为空);
		}else if(fuels.getExelId() == null) {
			throw new OperException(订单ID不能为空);
		}else if(fuels.getTime() == null) {
			throw new OperException(油耗时间不能为空);
		}else if(!StringUtils.trim(fuels.getLocation())) {
			throw new OperException(目的地不能为空);
		}else if(fuels.getFee() == null) {
			throw new OperException(费用不能为空);
		}else if(!StringUtils.trim(fuels.getFueltype())) {
			throw new OperException(类型不能为空);
		}
		
		fuelsDao.updateByPrimaryKey(fuels);
	}
	
	@Transactional(rollbackFor = Exception.class)
	public void delFuels(Integer[] exelId) {
		fuelsDao.deleteArray(exelId);
	}
}
