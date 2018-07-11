package scdx.group17.entity;

import java.sql.Timestamp;

public class Do {
    private Integer hom_id;
    private Integer hID;
    private Integer id;
    private Timestamp deadline;
    private String cdeadline;
    private Integer grade;
    private String title;

    public String getTitle() {
        return title;
    }

    public void setTitle(String title) {
        this.title = title;
    }

    public Integer getHom_id() {
        return hom_id;
    }

    public void setHom_id(Integer hom_id) {
        this.hom_id = hom_id;
    }

    public Integer gethID() {
        return hID;
    }

    public void sethID(Integer hID) {
        this.hID = hID;
    }

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public Timestamp getDeadline() {
        return deadline;
    }

    public void setDeadline(Timestamp deadline) {
        this.deadline = deadline;
    }

    public String getCdeadline() {
        return cdeadline;
    }

    public void setCdeadline(String cdeadline) {
        this.cdeadline = cdeadline;
    }

    public Integer getGrade() {
        return grade;
    }

    public void setGrade(Integer grade) {
        this.grade = grade;
    }

    public Do(Integer hom_id, Integer hID, Integer id, Timestamp deadline, String cdeadline, Integer grade,String title) {

        this.hom_id = hom_id;
        this.hID = hID;
        this.id = id;
        this.deadline = deadline;
        this.cdeadline = cdeadline;
        this.grade = grade;
        this.title = title;
    }

    public Do(){

    }
}
