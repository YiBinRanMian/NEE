package scdx.group17.dao;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringRunner;


@RunWith(SpringRunner.class)
@ContextConfiguration("classpath:spring-mybatis.xml")
public class QuestionMapperTest {
    @Autowired
    private QuestionMapper questionMapper;

    @Test
    public void addQuestion() throws Exception {
        questionMapper.addQuestion(12,"test1","test2","test2","A",2,"A","B","C","D");
    }

    @Test
    public void addJudge() throws Exception {
        questionMapper.addJudge(12,"t1","2","3","4",4);
    }

}