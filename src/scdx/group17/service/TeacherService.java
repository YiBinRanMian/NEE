package scdx.group17.service;

import scdx.group17.entity.Teacher;

import java.util.List;

public interface TeacherService {

    public Teacher getById(Integer id);
    public void addUser(Integer id, String password, String gender,String role,String name,String subject);
    public void updateUser(Integer id,String password, String gender, String role,String name,String subject);
    public List<Teacher> getAllTeachers();
    public void delByTeacherId(Integer id);
}
