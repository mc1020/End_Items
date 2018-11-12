package com.baizhi.test;

import com.baizhi.entity.Carousel;
import com.baizhi.service.CarouselService;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import java.util.List;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration("classpath:spring.xml")
public class TestCarousel{
    @Autowired
    private CarouselService carouselService;

    @Test
    public void findAll(){
        List<Carousel> all = carouselService.findAllByPageAndRows(0,5);
        for (Carousel carousel : all) {
            System.out.println(carousel);
        }

    }
}
