package scdx.group17.dao;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringRunner;

import java.util.Date;

@RunWith(SpringRunner.class)
@ContextConfiguration("classpath:spring-mybatis.xml")
public class ExamMapperTest {
    @Autowired
    private ExamMapper examMapper;
    @Test
    public void addNewExam() throws Exception {
        Date date = new Date();
        examMapper.addNewExam(10000,2,2,null,null,"2nd");
    }

}