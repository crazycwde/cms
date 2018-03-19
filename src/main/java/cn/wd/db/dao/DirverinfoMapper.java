package cn.wd.db.dao;

import cn.wd.pojo.Dirverinfo;

public interface DirverinfoMapper {
    int deleteByPrimaryKey(Integer id);

    int insert(Dirverinfo record);

    int insertSelective(Dirverinfo record);

    Dirverinfo selectByPrimaryKey(Integer id);

    int updateByPrimaryKeySelective(Dirverinfo record);

    int updateByPrimaryKey(Dirverinfo record);
}