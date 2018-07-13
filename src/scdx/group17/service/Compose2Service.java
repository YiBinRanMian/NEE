package scdx.group17.service;

import scdx.group17.entity.Compose2;

import java.util.List;

public interface Compose2Service {

    public void addCompose(Integer id, Integer tID, Integer qID);

    public List<Compose2> getById(Integer tID);


}
