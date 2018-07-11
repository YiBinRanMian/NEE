package scdx.group17.entity;

public class Chapter {
    private Integer chID;
    private String name;

    public Integer getChID() {
        return chID;
    }

    public void setChID(Integer chID) {
        this.chID = chID;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public Chapter(Integer chID, String name) {

        this.chID = chID;
        this.name = name;
    }

    public Chapter(){

    }
}
