package com.kk.pojo;

import java.io.Serializable;
import java.util.Date;

/**
 * @ClassName Garage.java
 * @Description : TODO
 * @Author : stop
 * @Date : 2022/4/23  16:32
 * @Version : 1.0
 **/

public class Garage implements Serializable {
    private int gid; //id
    private String gcode;  //车牌号
    private Date gstartTime; //
    private int gremaining;//剩余天数

    public Garage() {
    }

    public Garage(int gid, String gcode, Date gstartTime, int gremaining) {
        this.gid = gid;
        this.gcode = gcode;
        this.gstartTime = gstartTime;
        this.gremaining = gremaining;
    }

    public int getGid() {
        return gid;
    }

    public void setGid(int gid) {
        this.gid = gid;
    }

    public String getGcode() {
        return gcode;
    }

    public void setGcode(String gcode) {
        this.gcode = gcode;
    }

    public Date getGstartTime() {
        return gstartTime;
    }

    public void setGstartTime(Date gstartTime) {
        this.gstartTime = gstartTime;
    }

    public int getGremaining() {
        return gremaining;
    }

    public void setGremaining(int gremaining) {
        this.gremaining = gremaining;
    }

    @Override
    public String toString() {
        return "Garage{" +
                "gid=" + gid +
                ", gcode='" + gcode + '\'' +
                ", gstartTime=" + gstartTime +
                ", gremaining=" + gremaining +
                '}';
    }
}
