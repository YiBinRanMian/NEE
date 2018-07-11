package scdx.group17.dao;

import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;
import scdx.group17.entity.Exam;

import java.util.List;

@Repository
public interface ExamMapper  {
    public List<Exam> getAllExamById(@Param("id")Integer id);

    public int getDoneCountById(@Param("id")Integer id);

    public int getUnDoneCountById(@Param("id")Integer id);

    public void delByStuId(@Param("id")Integer id);
}
