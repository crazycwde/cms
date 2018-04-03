package cn.wd.db.dao;

import cn.wd.pojo.Yg;

public interface YgMapper_Ext extends YgMapper {
	Yg selectByYgId(String ygId);
}