package scdx.group17.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import scdx.group17.dao.TeachMapper;
import scdx.group17.entity.Teach;

import java.util.List;

@Controller
public class TeachServiceImpl implements TeachService{
    @Autowired
    private TeachMapper teachMapper;

    @Override
    public void delByStuId(Integer id) {
        teachMapper.delByStuId(id);
    }

    @Override
    public List<Teach> selectByTeachId(Integer id) {
        return teachMapper.selectByTeachId(id);
    }

    @Override
    public void addClass(Integer stu_id, Integer id) {
        teachMapper.addClass(stu_id,id);
    }

    @Override
    public void delClass(Integer stu_id, Integer id) {
        teachMapper.delClass(stu_id, id);
    }
}
