package com.skycentre.provider.dao;

import java.util.List;

import com.skycentre.provider.entity.Logs;

public interface LogDao {
    int deleteByPrimaryKey(Integer id);

    int insert(Logs record);

    int insertSelective(Logs record);

    Logs selectByPrimaryKey(Integer id);

    int updateByPrimaryKeySelective(Logs record);

    int updateByPrimaryKey(Logs record);
    
    Integer insertBatch(List<Logs> logs);
}