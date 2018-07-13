package scdx.group17.dao;

import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;
import scdx.group17.entity.Exam;

import java.sql.Date;
import java.sql.Time;
import java.util.List;

@Repository
public interface ExamMapper  {
    public List<Exam> getAllExamById(@Param("id")Integer id);

    public int getDoneCountById(@Param("id")Integer id);

    public int getUnDoneCountById(@Param("id")Integer id);

    public void delByStuId(@Param("id")Integer id);

    public void addNewExam(@Param("id")Integer id, @Param("tes_id")Integer tes_id, @Param("tID")Integer tID, @Param("deadline")Date deadline, @Param("time")Time time,@Param("title")String title);

    public List<Exam> getsomeUnDoneByStuId(@Param("query")String query, @Param("id")Integer id);

    public List<Exam> getsomeDoneByStuId(@Param("query")String query,@Param("id")Integer id);

    public void updateScore(@Param("id")Integer id,@Param("tID")Integer tID,@Param("grade")Integer grade);

    public Exam getByTid(@Param("tID")Integer tID, @Param("id")Integer id);

    public int getMax();


}
