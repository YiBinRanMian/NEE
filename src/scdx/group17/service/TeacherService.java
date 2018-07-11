package scdx.group17.service;

import scdx.group17.entity.Teacher;

public interface TeacherService {

    public Teacher getById(Integer id);
    public void addUser(Integer id, String password, String gender,String role,String name,String subject);
    public void updateUser(Integer id,String password, String gender, String role,String name,String subject);

}
