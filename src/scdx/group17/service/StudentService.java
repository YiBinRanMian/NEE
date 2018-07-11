package scdx.group17.service;

import scdx.group17.entity.Student;

public interface StudentService {
    public Student getById(Integer id);

    public void addUser(Integer id, String password, String gender,String role,String name);
    public void updateUser(Integer id,String password, String gender, String role,String name);

}
