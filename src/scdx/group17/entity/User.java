package scdx.group17.entity;

public class User {
    private Integer id;
    private String password;
    private String gender;
    private String role;
    private String name;
    private String subject;

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    public String getGender() {
        return gender;
    }

    public void setGender(String gender) {
        this.gender = gender;
    }

    public String getRole() {
        return role;
    }

    public void setRole(String role) {
        this.role = role;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getSubject() {
        return subject;
    }

    public void setSubject(String subject) {
        this.subject = subject;
    }

    public User(Integer id, String password, String gender, String role, String name, String subject) {

        this.id = id;
        this.password = password;
        this.gender = gender;
        this.role = role;
        this.name = name;
        this.subject = subject;
    }

    public User() {
    }

    @Override
    public String toString() {
        return "User{" +
                "id=" + id +
                ", password='" + password + '\''+'}';
    }
}
