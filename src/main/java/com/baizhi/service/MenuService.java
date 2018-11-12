package com.baizhi.service;

import com.baizhi.entity.Menu;
import com.fasterxml.jackson.databind.ser.Serializers;

import java.util.List;

public interface MenuService{
    List<Menu> findAll();
}
