package scdx.group17.entity;

import java.sql.Timestamp;

public class Comment {
    private Integer id;
    private Integer pos_id;
    private Integer pID;
    private Integer cID;
    private String content;
    private Timestamp time;
    private String ctime;
    private Integer isread;

    public Comment(Integer id, Integer pos_id, Integer pID, Integer cID, String content, Timestamp time, String ctime, Integer isread) {
        this.id = id;
        this.pos_id = pos_id;
        this.pID = pID;
        this.cID = cID;
        this.content = content;
        this.time = time;
        this.ctime = ctime;
        this.isread = isread;
    }

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public Integer getPos_id() {
        return pos_id;
    }

    public void setPos_id(Integer pos_id) {
        this.pos_id = pos_id;
    }

    public Integer getpID() {
        return pID;
    }

    public void setpID(Integer pID) {
        this.pID = pID;
    }

    public Integer getcID() {
        return cID;
    }

    public void setcID(Integer cID) {
        this.cID = cID;
    }

    public String getContent() {
        return content;
    }

    public void setContent(String content) {
        this.content = content;
    }

    public Timestamp getTime() {
        return time;
    }

    public void setTime(Timestamp time) {
        this.time = time;
    }

    public String getCtime() {
        return ctime;
    }

    public void setCtime(String ctime) {
        this.ctime = ctime;
    }

    public Integer getIsread() {
        return isread;
    }

    public void setIsread(Integer isread) {
        this.isread = isread;
    }

    public Comment(){

    }
}
