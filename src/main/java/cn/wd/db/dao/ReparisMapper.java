package cn.wd.db.dao;

import cn.wd.pojo.Reparis;

public interface ReparisMapper {
    int deleteByPrimaryKey(Integer id);

    int insert(Reparis record);

    int insertSelective(Reparis record);

    Reparis selectByPrimaryKey(Integer id);

    int updateByPrimaryKeySelective(Reparis record);

    int updateByPrimaryKey(Reparis record);
}