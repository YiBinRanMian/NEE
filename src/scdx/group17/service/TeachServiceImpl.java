package scdx.group17.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import scdx.group17.dao.TeachMapper;

@Controller
public class TeachServiceImpl implements TeachService{
    @Autowired
    private TeachMapper teachMapper;

    @Override
    public void delByStuId(Integer id) {
        teachMapper.delByStuId(id);
    }
}
