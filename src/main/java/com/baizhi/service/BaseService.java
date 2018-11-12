package com.baizhi.service;

import java.util.List;

public interface BaseService<T> {
    List<T> findAllByPageAndRows(int start,int rows);

    Integer total();

    void insert(T t);

    void delete(String id);

    T queryOne(String id);

    void update(T t);
}
