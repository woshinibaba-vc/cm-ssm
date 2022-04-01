package com.kk.pojo;

import java.io.Serializable;

public class Checkin implements Serializable {
    private Integer id;

    private String name;

    private String time;

    private String phone;

    private String idcord;

    private String note;
    private static final long serialVersionUID = 1L;
    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getTime() {
        return time;
    }

    public void setTime(String time) {
        this.time = time;
    }

    public String getPhone() {
        return phone;
    }

    public void setPhone(String phone) {
        this.phone = phone;
    }

    public String getIdcord() {
        return idcord;
    }

    public void setIdcord(String idcord) {
        this.idcord = idcord;
    }

    public String getNote() {
        return note;
    }

    public void setNote(String note) {
        this.note = note;
    }
}