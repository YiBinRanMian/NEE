package scdx.group17.service;

import scdx.group17.entity.User;

import java.util.List;

public interface UserService {
    /*login*/
    public String getIfLogin(Integer id,String password);

    /*admin*/
    /*List Users*/
    public List<User> getAllUser();

    public User getById(Integer id);

    /*增加用户(主键id手动输入)*/
    public void addUser(Integer id, String password, String gender,String role,String name,String subject);
    /*查找并删除用户*/
    public List<User> getUser(String query);
    public void delUser(Integer id);
    public void updateUser(Integer id,String password, String gender, String role,String name,String subject);

}
