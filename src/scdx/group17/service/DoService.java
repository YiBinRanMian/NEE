package scdx.group17.service;

import scdx.group17.entity.Do;

import java.util.List;

public interface DoService {
    public List<Do> getAllDoById(Integer id);

    public int getDoneCountById(Integer id);

    public int getUnDoneCountById(Integer id);

    public List<Do> getsomeUnDone(String query,Integer id);

    public List<Do> getsomeDone(String query,Integer id);

    public Do getByHid(Integer hID,Integer id);

    public List<Do> getsomeUnDoneByTechId(String query,Integer id);

    public List<Do>getsomeDoneByTechId(String query,Integer id);

    public List<Do>getAllDoByHomId(Integer hom_id);
}
