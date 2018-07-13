package scdx.group17.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import scdx.group17.dao.Compose1Mapper;
import scdx.group17.entity.Compose1;

import java.util.List;

@Service
public class Compose1ServiceImpl implements Compose1Service {
    @Autowired
    private Compose1Mapper compose1Mapper;
    @Override
    public List<Compose1> getById(Integer hID) {
        return compose1Mapper.getById(hID);
    }

    @Override
    public void addCompose(Integer id, Integer hID, Integer qID) {
        compose1Mapper.addCompose(id, hID, qID);
    }
}
