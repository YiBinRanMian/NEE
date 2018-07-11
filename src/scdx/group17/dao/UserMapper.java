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
}
