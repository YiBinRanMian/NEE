package scdx.group17.entity;

import java.sql.Timestamp;

public class Post {
    private Integer id;
    private Integer pID;
    private String title;
    private String content;
    private Integer istop;
    private Timestamp updatetime;

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public Integer getpID() {
        return pID;
    }

    public void setpID(Integer pID) {
        this.pID = pID;
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

    public Integer getIstop() {
        return istop;
    }

    public void setIstop(Integer istop) {
        this.istop = istop;
    }

    public Timestamp getUpdatetime() {
        return updatetime;
    }

    public void setUpdatetime(Timestamp updatetime) {
        this.updatetime = updatetime;
    }

    public Post(Integer id, Integer pID, String title, String content, Integer istop, Timestamp updatetime) {

        this.id = id;
        this.pID = pID;
        this.title = title;
        this.content = content;
        this.istop = istop;
        this.updatetime = updatetime;
    }

    public Post(){

    }
}
