package scdx.group17.entity;

import java.sql.Date;
import java.sql.Time;

public class Exam {
    private Integer id;
    private Integer tes_id;
    private Integer tID;
    private Date deadline;
    private String cdeadline;
    private Integer grade;
    private Time time;
    private String title;

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public Integer getTes_id() {
        return tes_id;
    }

    public void setTes_id(Integer tes_id) {
        this.tes_id = tes_id;
    }

    public Integer gettID() {
        return tID;
    }

    public void settID(Integer tID) {
        this.tID = tID;
    }

    public Date getDeadline() {
        return deadline;
    }

    public void setDeadline(Date deadline) {
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

    public Time getTime() {
        return time;
    }

    public void setTime(Time time) {
        this.time = time;
    }

    public String getTitle() {
        return title;
    }

    public void setTitle(String title) {
        this.title = title;
    }

    public Exam(Integer id, Integer tes_id, Integer tID, Date deadline, String cdeadline, Integer grade, Time time, String title) {

        this.id = id;
        this.tes_id = tes_id;
        this.tID = tID;
        this.deadline = deadline;
        this.cdeadline = cdeadline;
        this.grade = grade;
        this.time = time;
        this.title = title;
    }

    public Exam(){

    }
}
