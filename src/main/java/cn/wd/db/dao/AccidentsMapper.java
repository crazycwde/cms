package cn.wd.db.dao;

import cn.wd.pojo.Accidents;

public interface AccidentsMapper extends BaseMapper<Accidents>{
    int deleteByPrimaryKey(Integer id);

    int insert(Accidents record);

    int insertSelective(Accidents record);

    Accidents selectByPrimaryKey(Integer id);

    int updateByPrimaryKeySelective(Accidents record);

    int updateByPrimaryKey(Accidents record);
}