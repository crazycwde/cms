package cn.wd.db.dao;

import cn.wd.pojo.Driverinfo;

public interface DriverinfoMapper extends BaseMapper<Driverinfo>{
    int deleteByPrimaryKey(Integer id);

    int insert(Driverinfo record);

    int insertSelective(Driverinfo record);

    Driverinfo selectByPrimaryKey(Integer id);

    int updateByPrimaryKeySelective(Driverinfo record);

    int updateByPrimaryKey(Driverinfo record);
}