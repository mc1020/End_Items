package com.baizhi.dao;

import org.apache.ibatis.annotations.Param;

import java.util.List;

public interface BaseDao<T> {
    List<T> queryAll();

    void update(T t);

    void deleteById(String id);

    void delteRows(String[] ids);

    List<T> queryByPage(@Param("start") int start,@Param("rows") int rows);

    int total();

    void insert(T t);

    T queryById(String id);

    T findByAccountAndPassword(@Param("account") String account, @Param("password") String password);
}
