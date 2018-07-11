package scdx.group17.entity;

import java.sql.Timestamp;

public class News {
    private Integer id;
    private Integer nID;
    private Integer rev_id;
    private String title;
    private String content;
    private Integer isreleased;
    private Timestamp etime;
    private Timestamp rtime;

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public Integer getnID() {
        return nID;
    }

    public void setnID(Integer nID) {
        this.nID = nID;
    }

    public Integer getRev_id() {
        return rev_id;
    }

    public void setRev_id(Integer rev_id) {
        this.rev_id = rev_id;
    }

    public String getTitle() {
        return title;
    }

    public void setTitle(String title) {
        this.title = title;
    }

    public String getContent() {
        return content;
    }

    public void setContent(String content) {
        this.content = content;
    }

    public Integer getIsreleased() {
        return isreleased;
    }

    public void setIsreleased(Integer isreleased) {
        this.isreleased = isreleased;
    }

    public Timestamp getEtime() {
        return etime;
    }

    public void setEtime(Timestamp etime) {
        this.etime = etime;
    }

    public Timestamp getRtime() {
        return rtime;
    }

    public void setRtime(Timestamp rtime) {
        this.rtime = rtime;
    }


    public News(Integer id, Integer nID, Integer rev_id, String title, String content, Integer isreleased, Timestamp etime, Timestamp rtime) {
        this.id = id;
        this.nID = nID;
        this.rev_id = rev_id;
        this.title = title;
        this.content = content;
        this.isreleased = isreleased;
        this.etime = etime;
        this.rtime = rtime;
    }

    public News(){

    }
}
