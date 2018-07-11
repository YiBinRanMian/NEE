package scdx.group17.dao;

import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;
import scdx.group17.entity.Tgroup;

@Repository
public interface TgroupMapper {
    public Tgroup getById(@Param("id")Integer id);

}
