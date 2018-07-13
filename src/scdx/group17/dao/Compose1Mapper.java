package scdx.group17.dao;

import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;
import scdx.group17.entity.Compose1;

import java.util.List;

@Repository
public interface Compose1Mapper {
    public List<Compose1> getById(@Param("hID")Integer hID);
    public void addCompose(@Param("id")Integer id,@Param("hID")Integer hID,@Param("qID")Integer qID);
}
