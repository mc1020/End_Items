package com.baizhi.service;

import com.baizhi.dao.CarouselDao;
import com.baizhi.entity.Carousel;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;
import java.util.UUID;

@Service
@Transactional
public class CarouselServiceImpl implements CarouselService{
    @Autowired
    private CarouselDao carouselDao;
    @Override
    @Transactional(propagation = Propagation.SUPPORTS)
    public List<Carousel> findAllByPageAndRows(int start,int rows) {
        return carouselDao.queryByPage(start,rows);
    }

    @Override
    @Transactional(propagation = Propagation.SUPPORTS)
    public Integer total() {
        return carouselDao.total();
    }

    @Override
    public void insert(Carousel carousel) {
        carousel.setId(UUID.randomUUID().toString());
       carouselDao.insert(carousel);
    }

    @Override
    public void delete(String id) {
        carouselDao.deleteById(id);
    }

    @Override
    @Transactional(propagation = Propagation.SUPPORTS)
    public Carousel queryOne(String id) {
        return carouselDao.queryById(id);
    }

    @Override
    public void update(Carousel carousel) {
        carouselDao.update(carousel);
    }
}
