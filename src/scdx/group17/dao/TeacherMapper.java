package scdx.group17.dao;

import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;
import scdx.group17.entity.Teacher;

@Repository
public interface TeacherMapper {

    public Teacher getById(@Param("id")Integer id);
    public void addUser(@Param("id")Integer id,@Param("password")String password,@Param("gender")String gender,@Param("role")String role,@Param("name")String name,@Param("subject")String subject);
    public void updateUser(@Param("id")Integer id,@Param("password")String password,@Param("gender")String gender,@Param("role")String role,@Param("name")String name,@Param("subject")String subject);

}
