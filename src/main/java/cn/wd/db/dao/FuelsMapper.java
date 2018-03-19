package cn.wd.db.dao;

import cn.wd.pojo.Fuels;

public interface FuelsMapper extends BaseMapper<Fuels>{
    int deleteByPrimaryKey(Integer id);

    int insert(Fuels record);

    int insertSelective(Fuels record);

    Fuels selectByPrimaryKey(Integer id);

    int updateByPrimaryKeySelective(Fuels record);

    int updateByPrimaryKey(Fuels record);
}