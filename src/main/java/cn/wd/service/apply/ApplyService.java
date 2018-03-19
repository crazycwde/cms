package cn.wd.service.apply;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import cn.wd.db.dao.ApplyMapper_Ext;
import cn.wd.pojo.Apply;
import cn.wd.service.OperErrCode;
import cn.wd.service.OperException;
import cn.wd.utils.StringUtils;

@Service
public class ApplyService {
	private static final OperErrCode 请填入申请人姓名 = new OperErrCode("11001", "请填入申请人姓名");
	private static final OperErrCode 请填入申请人部门 = new OperErrCode("11002", "请填入申请人部门");
	private static final OperErrCode 请填入外出时间 = new OperErrCode("11003", "请填入外出时间");
	private static final OperErrCode 请填入外出事由 = new OperErrCode("11004", "请填入外出事由");

	@Autowired
	private ApplyMapper_Ext applyDao;
	
	@Transactional(rollbackFor = Exception.class)
	public void insertSelective(Apply apply) throws OperException{
		if(!StringUtils.trim(apply.getName())) {
			 throw new OperException(请填入申请人姓名);
		}
		if(!StringUtils.trim(apply.getDepartment())) {
			throw new OperException(请填入申请人部门);
		}
		if(!StringUtils.trim(apply.getOuttime().toString())) {
			throw new OperException(请填入外出时间);
		}
		if(!StringUtils.trim(apply.getReason())) {
			throw new OperException(请填入外出事由);
		}
		
		applyDao.insertSelective(apply);
	}
}
