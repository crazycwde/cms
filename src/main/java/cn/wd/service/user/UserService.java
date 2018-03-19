package cn.wd.service.user;


import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import cn.wd.db.dao.UserMapper_Ext;
import cn.wd.pojo.User;
import cn.wd.service.OperErrCode;
import cn.wd.service.OperException;

@Service
public class UserService {
	public static final OperErrCode 用户不存在 = new OperErrCode("10001", "用户不存在");
	public static final OperErrCode 旧密码错误 = new OperErrCode("10002", "旧密码错误");
	public static final OperErrCode 用户密码不能为空 = new OperErrCode("10003", "用户密码不能为空");
	
	@Autowired
	UserMapper_Ext userDao;
	public User getUser(User user) {
		User u = new User();
		u = userDao.select(user);
		return u;
	}
	
	public void changePasswdByid (User user, String oldpwd, String newpwd) throws OperException{
		changePasswd(user, oldpwd, newpwd);
	}

	@Transactional(rollbackFor = Exception.class)
	public void changePasswd(User user, String oldpwd, String newpwd) throws OperException{
		if(user == null)
			throw new OperException(用户不存在);
		if(newpwd == null || newpwd.length() == 0)
			throw new OperException(用户密码不能为空);
		if(!oldpwd.equals(user.getPw()))
			throw new OperException(旧密码错误);
		
		user.setPw(newpwd);
		userDao.updateByPrimaryKey(user);
	}
	

}
