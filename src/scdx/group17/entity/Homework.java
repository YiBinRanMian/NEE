package scdx.group17.entity;

public class Homework {
    private Integer id;
    private Integer hID;

    public Homework(Integer id, Integer hID) {
        this.id = id;
        this.hID = hID;
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

    public Homework(){

    }
}

