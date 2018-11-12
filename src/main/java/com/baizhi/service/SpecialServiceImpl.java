package com.baizhi.service;

import com.baizhi.dao.SectionDao;
import com.baizhi.dao.SpecialDao;
import com.baizhi.entity.Special;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;
import java.util.UUID;

@Service
@Transactional
public class SpecialServiceImpl implements SpecialService {
    @Autowired
    private SpecialDao specialDao;

    @Autowired
    private SectionDao sectionDao;

    @Override
    @Transactional(propagation = Propagation.SUPPORTS)
    public List<Special> findAllByPageAndRows(int start, int rows) {
        List<Special> specials = specialDao.queryByPage(start, rows);
        return specials;
    }

    @Override
    @Transactional(propagation = Propagation.SUPPORTS)
    public Integer total() {
        return specialDao.total();
    }

    @Override
    public void insert(Special special) {
        special.setId(UUID.randomUUID().toString());
        specialDao.insert(special);
    }

    @Override
    public void delete(String id) {
        sectionDao.deleteBySpecialId(id);
        specialDao.deleteById(id);
    }

    @Override
    @Transactional(propagation = Propagation.SUPPORTS)
    public Special queryOne(String id) {
        return specialDao.queryById(id);
    }

    @Override
    public void update(Special special) {
        specialDao.update(special);
    }
}
