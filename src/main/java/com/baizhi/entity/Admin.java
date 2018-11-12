package com.baizhi.entity;

import java.util.Date;

public class Admin{
    private String id;
    private String name;
    private String account;
    private String password;
    private Date create_date;
    private String status;

    public Admin() {
    }

    public Admin(String id, String name, String account, String password, Date create_date, String status) {
        this.id = id;
        this.name = name;
        this.account = account;
        this.password = password;
        this.create_date = create_date;
        this.status = status;
    }

    public String getId() {
        return id;
    }

    public void setId(String id) {
        this.id = id;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getAccount() {
        return account;
    }

    public void setAccount(String account) {
        this.account = account;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    public Date getCreate_date() {
        return create_date;
    }

    public void setCreate_date(Date create_date) {
        this.create_date = create_date;
    }

    public String getStatus() {
        return status;
    }

    public void setStatus(String status) {
        this.status = status;
    }

    @Override
    public String toString() {
        return "Admin{" +
                "id='" + id + '\'' +
                ", name='" + name + '\'' +
                ", account='" + account + '\'' +
                ", password='" + password + '\'' +
                ", create_date=" + create_date +
                ", status='" + status + '\'' +
                '}';
    }
}
