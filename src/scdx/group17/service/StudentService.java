package scdx.group17.service;

import scdx.group17.entity.Student;

import java.util.List;

public interface StudentService {
    public Student getById(Integer id);

    public void addUser(Integer id, String password, String gender,String role,String name);
    public void updateUser(Integer id,String password, String gender, String role,String name);
    public List<Student> getAllStudents();
    public void delByStuId(Integer id);

}
