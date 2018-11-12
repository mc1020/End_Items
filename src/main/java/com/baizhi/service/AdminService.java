package com.baizhi.service;

import com.baizhi.entity.Admin;

public interface AdminService {
    Admin findByAccountAndPassword(String account,String password);

    void updatePassword(Admin admin);
}
