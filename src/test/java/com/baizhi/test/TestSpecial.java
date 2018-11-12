package com.baizhi.test;

import com.baizhi.entity.Special;
import com.baizhi.service.SpecialService;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import java.util.List;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration("classpath:spring.xml")
public class TestSpecial {
    @Autowired
    private SpecialService specialService;

    @Test
    public void insert(){
        Special special = new Special();
        special.setAuthor("马超");
        special.setBroadcast("mc");
        special.setName("水浒传");
        special.setPic("3.jpg");
        special.setState("true");
        special.setCollect_number(120);
        special.setContent_synopsis("这是一本佛法高深的书!!!");
        specialService.insert(special);
    }

    @Test
    public void queryAll(){
        List<Special> specials = specialService.findAllByPageAndRows(0, 5);
        for (Special special : specials) {
            System.out.println(special);
        }

    }
}
