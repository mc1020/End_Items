package com.baizhi.test;

import com.alibaba.druid.pool.vendor.SybaseExceptionSorter;
import com.baizhi.entity.Admin;
import com.baizhi.service.AdminService;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;


@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration("classpath:spring.xml")
public class TestAdmin {
    @Autowired
    private AdminService adminService;

    @Test
    public void findByAccountAndPassword(){
        Admin byAccountAndPassword = adminService.findByAccountAndPassword("1330963698","123456");
        System.out.println(byAccountAndPassword);

    }

}
