package scdx.group17.service;

import scdx.group17.entity.Teach;

import java.util.List;

public interface TeachService {

    public void delByStuId(Integer id);

    public List<Teach> selectByTeachId(Integer id);

    public void addClass(Integer stu_id,Integer id);
    public void delClass(Integer stu_id,Integer id);

}
