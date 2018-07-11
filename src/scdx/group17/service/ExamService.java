package scdx.group17.service;

import scdx.group17.entity.Exam;

import java.util.List;

public interface ExamService {
    public List<Exam> getAllExamById(Integer id);

    public int getDoneCountById(Integer id);

    public int getUnDoneCountById(Integer id);
    public void delByStuId(Integer id);


}
