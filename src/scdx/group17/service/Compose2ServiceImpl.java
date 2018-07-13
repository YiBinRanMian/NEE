package scdx.group17.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import scdx.group17.dao.Compose2Mapper;
import scdx.group17.entity.Compose2;

import java.util.List;

@Service
public class Compose2ServiceImpl implements Compose2Service {
    @Autowired
    private Compose2Mapper compose2Mapper;
    @Override
    public void addCompose(Integer id, Integer tID, Integer qID) {
        compose2Mapper.addCompose(id, tID, qID);
    }

    @Override
    public List<Compose2> getById(Integer tID) {
        return compose2Mapper.getById(tID);
    }
}
