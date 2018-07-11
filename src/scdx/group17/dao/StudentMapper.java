package scdx.group17.dao;


import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;
import scdx.group17.entity.Student;

@Repository
public interface StudentMapper {

    public Student getById(@Param("id")Integer id);

}
