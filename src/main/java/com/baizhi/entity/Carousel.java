package com.baizhi.entity;

import com.alibaba.fastjson.annotation.JSONField;

import java.util.Date;

public class Carousel {
    private String id;
    private String title;
    private String name;
    private String url;
    private String type;
    @JSONField(format = "yyyy-MM-dd HH:mm:ss")
    private Date create_timeDate;
    @JSONField(format = "yyyy-MM-dd HH:mm:ss")
    private Date modify_timeDate;
    private String state;

    public Carousel() {
    }

    public Carousel(String id, String title, String name, String url, String type, Date create_timeDate, Date modify_timeDate, String state) {
        this.id = id;
        this.title = title;
        this.name = name;
        this.url = url;
        this.type = type;
        this.create_timeDate = create_timeDate;
        this.modify_timeDate = modify_timeDate;
        this.state = state;
    }

    public String getId() {
        return id;
    }

    public void setId(String id) {
        this.id = id;
    }

    public String getTitle() {
        return title;
    }

    public void setTitle(String title) {
        this.title = title;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getUrl() {
        return url;
    }

    public void setUrl(String url) {
        this.url = url;
    }

    public String getType() {
        return type;
    }

    public void setType(String type) {
        this.type = type;
    }

    public Date getCreate_timeDate() {
        return create_timeDate;
    }

    public void setCreate_timeDate(Date create_timeDate) {
        this.create_timeDate = create_timeDate;
    }

    public Date getModify_timeDate() {
        return modify_timeDate;
    }

    public void setModify_timeDate(Date modify_timeDate) {
        this.modify_timeDate = modify_timeDate;
    }

    public String getState() {
        return state;
    }

    public void setState(String state) {
        this.state = state;
    }

    @Override
    public String toString() {
        return "Carousel{" +
                "id='" + id + '\'' +
                ", title='" + title + '\'' +
                ", name='" + name + '\'' +
                ", url='" + url + '\'' +
                ", type='" + type + '\'' +
                ", create_timeDate=" + create_timeDate +
                ", modify_timeDate=" + modify_timeDate +
                ", state='" + state + '\'' +
                '}';
    }
}
