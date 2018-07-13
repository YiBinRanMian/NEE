package scdx.group17.service;

import scdx.group17.entity.Exam;

import java.sql.Date;
import java.sql.Time;
import java.util.List;

public interface ExamService {
    public List<Exam> getAllExamById(Integer id);

    public int getDoneCountById(Integer id);

    public int getUnDoneCountById(Integer id);
    public void delByStuId(Integer id);
    public void addNewExam(Integer id, Integer tes_id,Integer tID, Date deadline,Time time,String title);
    public List<Exam> getsomeUnDoneByStuId(String query,Integer id);

    public List<Exam> getsomeDoneByStuId(String query,Integer id);
    public void updateScore(Integer id, Integer tID, Integer grade);

    public Exam getByTid(Integer tID, Integer id);

    public int getMax();


}
