package scdx.group17.dao;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringRunner;
import scdx.group17.entity.User;

import java.util.List;

@RunWith(SpringRunner.class)
@ContextConfiguration("classpath:spring-mybatis.xml")
public class UserMapperTest {

    @Autowired
    private UserMapper userMapper;
    @Test
    public void login() throws Exception {
    }

    @Test
    public void getAllUser() throws Exception {
    }

    @Test
    public void getById() throws Exception {
    }

    @Test
    public void addUser() throws Exception {
        userMapper.addUser(2,"123","male","useradmin","崔善朋","");
    }

    @Test
    public void getUser() throws Exception {
        List<User> userList = userMapper.getUser("10000");
        for (User temp:userList){
            System.out.println(temp.toString());
        }
    }

    @Test
    public void delUser() throws Exception {
        userMapper.delUser(2);
    }

}