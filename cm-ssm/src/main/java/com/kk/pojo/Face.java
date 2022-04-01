package com.kk.pojo;

import jdk.nashorn.internal.objects.annotations.Getter;
import jdk.nashorn.internal.objects.annotations.Setter;

import java.util.Date;

/**
 * @ClassName Face.java
 * @Description : TODO
 * @Author : stop
 * @Date : 2022/3/31  12:19
 * @Version : 1.0
 **/

public class Face {
    private String face_token;
    private String uid;
    private Date time;

    public Face() {
    }

    public Face(String face_token, String uid, Date time) {
        this.face_token = face_token;
        this.uid = uid;
        this.time = time;
    }

    public String getFace_token() {
        return face_token;
    }

    public void setFace_token(String face_token) {
        this.face_token = face_token;
    }

    public String getUid() {
        return uid;
    }

    public void setUid(String uid) {
        this.uid = uid;
    }

    public Date getTime() {
        return time;
    }

    public void setTime(Date time) {
        this.time = time;
    }

    @Override
    public String toString() {
        return "Face{" +
                "face_token='" + face_token + '\'' +
                ", uid='" + uid + '\'' +
                ", time=" + time +
                '}';
    }
}
