package com.baizhi.test;

import com.baizhi.entity.User;
import com.baizhi.service.UserService;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;
import org.springframework.transaction.annotation.Transactional;

import javax.annotation.Resource;
import java.util.Date;
import java.util.List;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration("classpath:spring.xml")
public class TestUser {
    @Autowired
    private UserService userService;

    @Test
    public void insert(){
        User user = new User();
        user.setCity("巴中");
        user.setPassword("123456");
        user.setCreate_date(new Date());
        user.setDharma_name("汇源");
        user.setG_id("1");
        user.setPicture("1.jpg");
        user.setProvince("四川");
        user.setSex("F");
        user.setRealname("张艳梅");
        user.setSignature("人之初，性本善");
        user.setStatus("on");
        user.setUsername("llsss");
        userService.insert(user);
    }

    @Test
    public void queryAll(){
        List<User> allByPageAndRows = userService.findAllByPageAndRows(2, 2);
        for (User allByPageAndRow : allByPageAndRows) {
            System.out.println(allByPageAndRow);
        }

    }


    @Test
    public void queryByUserAndPassword(){
        User allByPageAndRows = userService.login("18398976626","123456");
        System.out.println(allByPageAndRows);
    }
}
