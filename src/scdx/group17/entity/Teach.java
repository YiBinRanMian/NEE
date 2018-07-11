package scdx.group17.entity;

public class Teach {
    private Integer stu_id;
    private Integer id;

    public Teach(Integer stu_id, Integer id) {
        this.stu_id = stu_id;
        this.id = id;
    }

    public Integer getStu_id() {
        return stu_id;
    }

    public void setStu_id(Integer stu_id) {
        this.stu_id = stu_id;
    }

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public Teach(){

    }
}
