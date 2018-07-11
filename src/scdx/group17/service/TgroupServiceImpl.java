package scdx.group17.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import scdx.group17.dao.TgroupMapper;
import scdx.group17.entity.Tgroup;

@Service
public class TgroupServiceImpl implements TgroupService {
    @Autowired
    private TgroupMapper tgroupMapper;
    @Override
    public Tgroup getById(Integer id) {
        return tgroupMapper.getById(id);
    }
}
