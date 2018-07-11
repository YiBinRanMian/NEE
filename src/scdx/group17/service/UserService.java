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
}
