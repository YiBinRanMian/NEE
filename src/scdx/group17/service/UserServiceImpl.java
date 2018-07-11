package scdx.group17.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import scdx.group17.dao.UserMapper;
import scdx.group17.entity.User;

import java.util.List;

@Service
public class UserServiceImpl implements UserService{
    @Autowired
    private UserMapper userMapper;

    @Override
    public String getIfLogin(Integer id, String password) {
        String res = "";
        User user = userMapper.login(id,password);
        try{
            res = user.getPassword();
        }catch (Exception e){
            return "unregistered";
        }
        return user.getRole();
    }

    @Override
    public List<User> getAllUser() {
        return userMapper.getAllUser();
    }

    @Override
    public User getById(Integer id) { return userMapper.getById(id); }
}
