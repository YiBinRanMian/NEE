package scdx.group17.dao;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringRunner;

@RunWith(SpringRunner.class)
@ContextConfiguration("classpath:spring-mybatis.xml")
public class PostMapperTest {
    @Autowired
    PostMapper postMapper;

    @Test
    public void getAllPostById() throws Exception {
    }

    @Test
    public void getPostCountById() throws Exception {
    }

    @Test
    public void addNewPost() throws Exception {

        postMapper.addNewPost(11111,"张三","",1,null);
    }

    @Test
    public void getSome() throws Exception {
    }

    @Test
    public void getPostByPid() throws Exception {
    }

}