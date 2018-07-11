package scdx.group17.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import scdx.group17.dao.StudentMapper;
import scdx.group17.entity.Student;

@Service
public class StudentServiceImpl implements StudentService{
    @Autowired
    private StudentMapper studentMapper;

    @Override
    public Student getById(Integer id) {
        return studentMapper.getById(id);
    }

    @Override
    public void addUser(Integer id, String password, String gender, String role, String name) {
        studentMapper.addUser(id,password,gender,role,name);
    }
    public void updateUser(Integer id,String password, String gender, String role, String name) {
        studentMapper.updateUser(id,password, gender, role, name);
    }
}
