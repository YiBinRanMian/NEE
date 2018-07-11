package scdx.group17.dao;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringRunner;

@RunWith(SpringRunner.class)
@ContextConfiguration("classpath:spring-mybatis.xml")
public class CommentMapperTest {
    @Autowired
    CommentMapper commentMapper;
    @Test
    public void addNewComment() throws Exception {
        commentMapper.addNewComment(10000,11111,1,"你好",null,0);
    }

}