package cn.wd.pojo;

public class User {
    private Integer id;

    private String ygId;

    private String uname;

    private String name;

    private String pw;

    private String departid;

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public String getYgId() {
        return ygId;
    }

    public void setYgId(String ygId) {
        this.ygId = ygId == null ? null : ygId.trim();
    }

    public String getUname() {
        return uname;
    }

    public void setUname(String uname) {
        this.uname = uname == null ? null : uname.trim();
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name == null ? null : name.trim();
    }

    public String getPw() {
        return pw;
    }

    public void setPw(String pw) {
        this.pw = pw == null ? null : pw.trim();
    }

    public String getDepartid() {
        return departid;
    }

    public void setDepartid(String departid) {
        this.departid = departid == null ? null : departid.trim();
    }
}