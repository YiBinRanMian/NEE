package scdx.group17.service;

import scdx.group17.entity.Compose1;

import java.util.List;

public interface Compose1Service {
    public List<Compose1> getById(Integer hID);
    public void addCompose(Integer id, Integer hID, Integer qID);

}
