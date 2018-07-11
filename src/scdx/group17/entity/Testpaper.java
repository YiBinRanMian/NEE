package scdx.group17.entity;

public class Testpaper {
    private Integer id;
    private Integer tID;

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

    public Testpaper(Integer id, Integer tID) {

        this.id = id;
        this.tID = tID;
    }

    public Testpaper(){

    }
}
