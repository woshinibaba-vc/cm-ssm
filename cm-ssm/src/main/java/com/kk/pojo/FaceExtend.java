package com.kk.pojo;

import java.util.Date;

/**
 * @ClassName FaceExtend.java
 * @Description : TODO
 * @Author : stop
 * @Date : 2022/3/31  18:13
 * @Version : 1.0
 **/
public class FaceExtend {
    private String face_token;
    private User user;
    private Date time;

    public FaceExtend() {
    }

    public FaceExtend(String face_token, User user, Date time) {
        this.face_token = face_token;
        this.user = user;
        this.time = time;
    }

    public String getFace_token() {
        return face_token;
    }

    public void setFace_token(String face_token) {
        this.face_token = face_token;
    }

    public User getUser() {
        return user;
    }

    public void setUser(User user) {
        this.user = user;
    }

    public Date getTime() {
        return time;
    }

    public void setTime(Date time) {
        this.time = time;
    }
}
