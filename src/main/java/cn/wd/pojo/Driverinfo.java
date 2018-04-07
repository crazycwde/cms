package cn.wd.pojo;

public class Driverinfo {
    private Integer id;

    private Integer driverId;

    private String ygId;

    private String licence;

    private String state;

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public Integer getDriverId() {
        return driverId;
    }

    public void setDriverId(Integer driverId) {
        this.driverId = driverId;
    }

    public String getYgId() {
        return ygId;
    }

    public void setYgId(String ygId) {
        this.ygId = ygId == null ? null : ygId.trim();
    }

    public String getLicence() {
        return licence;
    }

    public void setLicence(String licence) {
        this.licence = licence == null ? null : licence.trim();
    }

    public String getState() {
        return state;
    }

    public void setState(String state) {
        this.state = state == null ? null : state.trim();
    }
}