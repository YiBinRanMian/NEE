package scdx.group17.dao;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringRunner;

@RunWith(SpringRunner.class)
@ContextConfiguration("classpath:spring-mybatis.xml")
public class DoMapperTest {
    @Test
    public void getMax() throws Exception {
        System.out.println(doMapper.getMax());
    }

    @Autowired
    DoMapper doMapper;
    @Test
    public void getAllDoById() throws Exception {
    }

    @Test
    public void getDoneCountById() throws Exception {
    }

    @Test
    public void getUnDoneCountById() throws Exception {
    }

    @Test
    public void getsomeUnDoneByStuId() throws Exception {
        doMapper.getsomeDoneByStuId("",11111);
    }

    @Test
    public void getsomeDoneByStuId() throws Exception {
        doMapper.getsomeDoneByStuId("",11111);
    }

    @Test
    public void getByHid() throws Exception {
    }

    @Test
    public void getsomeUnDoneByTechId() throws Exception {
        doMapper.getsomeUnDoneByTechId("",10000);
    }

    @Test
    public void getsomeDoneByTechId() throws Exception {
        doMapper.getsomeDoneByTechId("",10000);
    }



}