package scdx.group17.dao;


import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;
import scdx.group17.entity.Teach;

import java.util.List;

@Repository
public interface TeachMapper {
    public void delByStuId(@Param("stu_id")Integer stu_id);

    public List<Teach> selectByTeachId(@Param("id")Integer id);

    public void addClass(@Param("stu_id")Integer stu_id,@Param("id")Integer id);

    public void delClass(@Param("stu_id")Integer stu_id,@Param("id")Integer id);
}
