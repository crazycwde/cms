package cn.wd.db.dao;

import java.util.List;

import cn.wd.pojo.Apply;

public interface ApplyMapper_Ext extends ApplyMapper{
   int getCount();
   
   int getCountY();
   
   List<Apply> selectY(Apply apply);
}