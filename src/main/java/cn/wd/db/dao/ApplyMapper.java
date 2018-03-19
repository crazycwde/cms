package cn.wd.db.dao;

import cn.wd.pojo.Apply;

public interface ApplyMapper extends BaseMapper<Apply>{
    int deleteByPrimaryKey(Integer id);

    int insert(Apply record);

    int insertSelective(Apply record);

    Apply selectByPrimaryKey(Integer id);

    int updateByPrimaryKeySelective(Apply record);

    int updateByPrimaryKey(Apply record);
}