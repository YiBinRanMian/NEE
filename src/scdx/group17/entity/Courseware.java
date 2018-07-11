package scdx.group17.entity;

public class Courseware {

    private Integer id;
    private Integer couID;
    private String title;
    private String content;
    private String path;

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public Integer getCouID() {
        return couID;
    }

    public void setCouID(Integer couID) {
        this.couID = couID;
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

    public String getPath() {
        return path;
    }

    public void setPath(String path) {
        this.path = path;
    }

    public Courseware(Integer id, Integer couID, String title, String content, String path) {

        this.id = id;
        this.couID = couID;
        this.title = title;
        this.content = content;
        this.path = path;
    }

    public Courseware(){

    }
}
