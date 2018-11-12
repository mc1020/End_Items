package com.baizhi.entity;

import java.util.Date;

public class Section {
    private String id;
    private String name;
    private String size;
    private Date release_date;
    private String path;
    private String duration;
    private String se_type;
    private String special_id;
    private String _parentId;

    public Section() {
    }

    public Section(String id, String name, String size, Date release_date, String duration, String se_type) {
        this.id = id;
        this.name = name;
        this.size = size;
        this.release_date = release_date;
        this.path = path;
        this.duration = duration;
        this.se_type = se_type;
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

    public String getSize() {
        return size;
    }

    public void setSize(String size) {
        this.size = size;
    }

    public Date getRelease_date() {
        return release_date;
    }

    public void setRelease_date(Date release_date) {
        this.release_date = release_date;
    }

    public String getPath() {
        return path;
    }

    public void setPath(String path) {
        this.path = path;
    }

    public String getDuration() {
        return duration;
    }

    public void setDuration(String duration) {
        this.duration = duration;
    }

    public String getSe_type() {
        return se_type;
    }

    public String getSpecial_id() {
        return special_id;
    }

    public void setSpecial_id(String special_id) {
        this.special_id = special_id;
    }

    public String get_parentId() {
        return special_id;
    }

    public void set_parentId(String _parentId) {
        this._parentId = _parentId;
    }

    public void setSe_type(String se_type) {
        this.se_type = se_type;
    }

    @Override
    public String toString() {
        return "Section{" +
                "id='" + id + '\'' +
                ", name='" + name + '\'' +
                ", size=" + size +
                ", release_date=" + release_date +
                ", path='" + path + '\'' +
                ", duration=" + duration +
                ", se_type='" + se_type + '\'' +
                '}';
    }
}

