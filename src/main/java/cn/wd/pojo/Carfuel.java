package cn.wd.pojo;

import java.util.Date;

import org.springframework.format.annotation.DateTimeFormat;

public class Carfuel {
    private Integer exelId;
    
    @DateTimeFormat(pattern="yyyy-MM-dd")
    private Date time;

    private String location;

    private Integer fee;

    private String fueltype;

    private String carname;

    public Integer getExelId() {
        return exelId;
    }

    public void setExelId(Integer exelId) {
        this.exelId = exelId;
    }

    public Date getTime() {
        return time;
    }

    public void setTime(Date time) {
        this.time = time;
    }

    public String getLocation() {
        return location;
    }

    public void setLocation(String location) {
        this.location = location == null ? null : location.trim();
    }

    public Integer getFee() {
        return fee;
    }

    public void setFee(Integer fee) {
        this.fee = fee;
    }

    public String getFueltype() {
        return fueltype;
    }

    public void setFueltype(String fueltype) {
        this.fueltype = fueltype == null ? null : fueltype.trim();
    }

    public String getCarname() {
        return carname;
    }

    public void setCarname(String carname) {
        this.carname = carname == null ? null : carname.trim();
    }
}