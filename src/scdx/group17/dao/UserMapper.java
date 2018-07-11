package scdx.group17.dao;

import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;
import scdx.group17.entity.User;

import java.util.List;

@Repository
public interface UserMapper {
    /*login*/
    public User login(@Param("id")Integer id, @Param("password")String password);
    /*admin*/
    /*list users*/
    public List<User> getAllUser();

    public User getById(@Param("id")Integer id);

    /*增加用户(主键id手动输入)*/
    public void addUser(@Param("id")Integer id,@Param("password")String password,@Param("gender")String gender,@Param("role")String role,@Param("name")String name,@Param("subject")String subject);
    /*查找并删除用户*/
    public List<User> getUser(@Param("query")String query);
    public void delUser(@Param("id")Integer id);
    public void updateUser(@Param("id")Integer id,@Param("password")String password,@Param("gender")String gender,@Param("role")String role,@Param("name")String name,@Param("subject")String subject);
}
