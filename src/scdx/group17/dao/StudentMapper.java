package scdx.group17.dao;


import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;
import scdx.group17.entity.Student;

import java.util.List;

@Repository
public interface StudentMapper {

    public Student getById(@Param("id")Integer id);
    public void addUser(@Param("id")Integer id,@Param("password")String password,@Param("gender")String gender,@Param("role")String role,@Param("name")String name);
    public void updateUser(@Param("id")Integer id,@Param("password")String password,@Param("gender")String gender,@Param("role")String role,@Param("name")String name);
    public List<Student> getAllStudents();
    public void delByStuId(@Param("id")Integer id);


}
