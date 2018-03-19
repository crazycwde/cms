package cn.wd.db.dao;

import cn.wd.pojo.Carinfo;

public interface CarinfoMapper extends BaseMapper<Carinfo>{
    int deleteByPrimaryKey(Integer id);

    int insert(Carinfo record);

    int insertSelective(Carinfo record);

    Carinfo selectByPrimaryKey(Integer id);

    int updateByPrimaryKeySelective(Carinfo record);

    int updateByPrimaryKey(Carinfo record);
}