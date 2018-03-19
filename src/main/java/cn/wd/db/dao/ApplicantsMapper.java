package cn.wd.db.dao;

import cn.wd.pojo.Applicants;

public interface ApplicantsMapper extends BaseMapper<Applicants>{
    int deleteByPrimaryKey(Integer id);

    int insert(Applicants record);

    int insertSelective(Applicants record);

    Applicants selectByPrimaryKey(Integer id);

    int updateByPrimaryKeySelective(Applicants record);

    int updateByPrimaryKey(Applicants record);
}