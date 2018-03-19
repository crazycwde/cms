package cn.wd.db.dao;

import cn.wd.pojo.Yg;

public interface YgMapper {
    int deleteByPrimaryKey(Integer id);

    int insert(Yg record);

    int insertSelective(Yg record);

    Yg selectByPrimaryKey(Integer id);

    int updateByPrimaryKeySelective(Yg record);

    int updateByPrimaryKey(Yg record);
}