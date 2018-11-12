package com.baizhi.service;

import com.baizhi.dao.CourseDao;
import com.baizhi.entity.Course;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;
import java.util.UUID;

@Service
@Transactional
public class CourseServiceImpl implements CourseService {
    @Autowired
    private CourseDao courseDao;

    @Override
    @Transactional(propagation = Propagation.SUPPORTS)
    public List<Course> findAllByPageAndRows(int start, int rows) {
        return courseDao.queryByPage(start,rows);
    }

    @Override
    @Transactional(propagation = Propagation.SUPPORTS)
    public Integer total() {
        return courseDao.total();
    }

    @Override
    public void insert(Course course) {
        course.setId(UUID.randomUUID().toString());
        courseDao.insert(course);
    }

    @Override
    public void delete(String id) {
        courseDao.deleteById(id);
    }

    @Override
    @Transactional(propagation = Propagation.SUPPORTS)
    public Course queryOne(String id) {
        return courseDao.queryById(id);
    }

    @Override
    public void update(Course course) {
        courseDao.update(course);
    }
}
