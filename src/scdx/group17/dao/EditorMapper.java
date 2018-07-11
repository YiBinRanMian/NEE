package scdx.group17.dao;

import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;
import scdx.group17.entity.Editor;

@Repository
public interface EditorMapper {

    public Editor getById(@Param("id")Integer id);

}
