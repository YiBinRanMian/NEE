package scdx.group17.service;


import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import scdx.group17.dao.TeacherMapper;
import scdx.group17.entity.Teacher;

@Service
public class TeacherServiceImpl implements TeacherService {
    @Autowired
    private TeacherMapper teacherMapper;
    @Override
    public Teacher getById(Integer id) {
        return teacherMapper.getById(id);
    }
}
