package scdx.group17.entity;

import java.sql.Timestamp;

public class Exam {
    private Integer id;
    private Integer tes_id;
    private Integer tID;
    private Timestamp deadline;
    private String cdeadline;
    private Integer grade;

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

    public Exam(Integer id, Integer tes_id, Integer tID, Timestamp deadline, String cdeadline, Integer grade) {

        this.id = id;
        this.tes_id = tes_id;
        this.tID = tID;
        this.deadline = deadline;
        this.cdeadline = cdeadline;
        this.grade = grade;
    }

    public Exam(){

    }
}
