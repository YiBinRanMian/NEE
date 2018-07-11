package scdx.group17.entity;

public class Compose1 {
    private Integer qID;
    private Integer id;
    private Integer hID;

    public Compose1(Integer qID, Integer id, Integer hID) {
        this.qID = qID;
        this.id = id;
        this.hID = hID;
    }

    public Integer getqID() {
        return qID;
    }

    public void setqID(Integer qID) {
        this.qID = qID;
    }

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public Integer gethID() {
        return hID;
    }

    public void sethID(Integer hID) {
        this.hID = hID;
    }

    public Compose1(){

    }
}
