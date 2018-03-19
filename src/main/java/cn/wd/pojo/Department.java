package cn.wd.pojo;

public class Department {
    private Integer id;

    private String dm;

    private String pdm;

    private String name;

    private String dwxz;

    private String dwjb;

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public String getDm() {
        return dm;
    }

    public void setDm(String dm) {
        this.dm = dm == null ? null : dm.trim();
    }

    public String getPdm() {
        return pdm;
    }

    public void setPdm(String pdm) {
        this.pdm = pdm == null ? null : pdm.trim();
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name == null ? null : name.trim();
    }

    public String getDwxz() {
        return dwxz;
    }

    public void setDwxz(String dwxz) {
        this.dwxz = dwxz == null ? null : dwxz.trim();
    }

    public String getDwjb() {
        return dwjb;
    }

    public void setDwjb(String dwjb) {
        this.dwjb = dwjb == null ? null : dwjb.trim();
    }
}