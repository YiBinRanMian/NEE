package scdx.group17.service;


import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import scdx.group17.dao.DoMapper;
import scdx.group17.entity.Do;

import java.util.List;

@Service
public class DoServiceImpl implements DoService{
    @Autowired
    private DoMapper doMapper;
    @Override
    public List<Do> getAllDoById(Integer id) {
/*        List<Do> dos = doMapper.getAllDoById(id);
        for (Do temp:dos){
            DateFormat dFormat = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
            temp.setCdeadline(dFormat.format(temp.getDeadline()));
        }*/
        return doMapper.getAllDoById(id);
    }

    @Override
    public int getDoneCountById(Integer id) { return doMapper.getDoneCountById(id); }

    @Override
    public int getUnDoneCountById(Integer id) { return doMapper.getUnDoneCountById(id); }

    @Override
    public List<Do> getsomeUnDone(String query,Integer id) {
        return doMapper.getsomeUnDoneByStuId(query,id);
    }

    @Override
    public List<Do> getsomeDone(String query,Integer id) {
        return doMapper.getsomeDoneByStuId(query,id);
    }

    @Override
    public Do getByHid(Integer hID, Integer id) {
        return doMapper.getByHid(hID,id);
    }

    @Override
    public List<Do> getsomeUnDoneByTechId(String query, Integer id) {
        return doMapper.getsomeUnDoneByTechId(query,id);
    }

    @Override
    public List<Do> getsomeDoneByTechId(String query, Integer id) {
        return doMapper.getsomeDoneByTechId(query,id);
    }

    @Override
    public List<Do> getAllDoByHomId(Integer hom_id) {
        return doMapper.getAllDoByHomId(hom_id);
    }
}
