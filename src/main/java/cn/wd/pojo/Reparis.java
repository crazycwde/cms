package cn.wd.pojo;


import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.Date;

import org.springframework.format.annotation.DateTimeFormat;

public class Reparis {
    private Integer id;

    private Integer carId;

    private Integer exelId;

    @DateTimeFormat(pattern="yyyy-MM-dd")
    private Date time;

    private String location;

    private Integer fee;

    private String type;

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public Integer getCarId() {
        return carId;
    }

    public void setCarId(Integer carId) {
        this.carId = carId;
    }

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

    public String getType() {
        return type;
    }

    public void setType(String type) {
        this.type = type == null ? null : type.trim();
    }

	@Override
	public String toString() {
		return "Reparis [id=" + id + ", carId=" + carId + ", exelId=" + exelId + ", time=" + time + ", location="
				+ location + ", fee=" + fee + ", type=" + type + "]";
	}
    
    
}