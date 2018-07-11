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
}
