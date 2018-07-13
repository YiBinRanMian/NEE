package scdx.group17.dao;

import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;
import scdx.group17.entity.Compose2;

import java.util.List;

@Repository
public interface Compose2Mapper {
    public void addCompose(@Param("id")Integer id,@Param("tID")Integer tID,@Param("qID")Integer qID);
    public List<Compose2> getById(@Param("tID")Integer tID);


}
