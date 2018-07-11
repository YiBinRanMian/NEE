package scdx.group17.entity;

public class Compose2 {

    private Integer id;
    private Integer tID;
    private Integer qID;

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public Integer gettID() {
        return tID;
    }

    public void settID(Integer tID) {
        this.tID = tID;
    }

    public Integer getqID() {
        return qID;
    }

    public void setqID(Integer qID) {
        this.qID = qID;
    }

    public Compose2(Integer id, Integer tID, Integer qID) {

        this.id = id;
        this.tID = tID;
        this.qID = qID;
    }

    public Compose2(){

    }
}
