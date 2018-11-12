package com.baizhi.service;

import com.baizhi.dao.GuruDao;
import com.baizhi.entity.Guru;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;
import java.util.UUID;

@Service
@Transactional
public class GuruServiceImpl implements GuruService{
    @Autowired
    private GuruDao guruDao;

    @Override
    @Transactional(propagation = Propagation.SUPPORTS)
    public List<Guru> findAllByPageAndRows(int start, int rows) {
        List<Guru> gurus = guruDao.queryByPage(start, rows);
        return gurus;
    }

    @Override
    @Transactional(propagation = Propagation.SUPPORTS)
    public Integer total() {
        int total = guruDao.total();
        return total;
    }

    @Override
    public void insert(Guru guru) {
        guru.setId(UUID.randomUUID().toString());
        guruDao.insert(guru);
    }

    @Override
    public void delete(String id) {
        guruDao.deleteById(id);
    }

    @Override
    @Transactional(propagation = Propagation.SUPPORTS)
    public Guru queryOne(String id) {
        return guruDao.queryById(id);
    }

    @Override
    public void update(Guru guru) {
        guruDao.update(guru);
    }

    @Override
    public void deleteRows(String[] ids) {
        guruDao.delteRows(ids);
    }

    @Override
    public void updatePicture(Guru guru) {
        guruDao.updatePicture(guru.getId(),guru.getPicture());
    }
}
