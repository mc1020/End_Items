package com.baizhi.entity;

public class Guru {
    private String id;
    private String name;
    private String picture;
    private String sex;
    private String state;

    public Guru() {
    }

    public Guru(String id, String name, String picture, String sex, String state) {
        this.id = id;
        this.name = name;
        this.picture = picture;
        this.sex = sex;
        this.state = state;
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

    public String getPicture() {
        return picture;
    }

    public void setPicture(String picture) {
        this.picture = picture;
    }

    public String getSex() {
        return sex;
    }

    public void setSex(String sex) {
        this.sex = sex;
    }

    public String getState() {
        return state;
    }

    public void setState(String state) {
        this.state = state;
    }

    @Override
    public String toString() {
        return "Guru{" +
                "id='" + id + '\'' +
                ", name='" + name + '\'' +
                ", picture='" + picture + '\'' +
                ", sex='" + sex + '\'' +
                ", state='" + state + '\'' +
                '}';
    }
}
