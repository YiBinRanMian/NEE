package scdx.group17.dao;


import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;

@Repository
public interface TeachMapper {
    public void delByStuId(@Param("stu_id")Integer stu_id);
}
