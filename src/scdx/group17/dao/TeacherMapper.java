package scdx.group17.dao;

import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;
import scdx.group17.entity.Teacher;

@Repository
public interface TeacherMapper {

    public Teacher getById(@Param("id")Integer id);

}
