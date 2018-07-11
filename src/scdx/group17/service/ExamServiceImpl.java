package scdx.group17.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import scdx.group17.dao.ExamMapper;
import scdx.group17.entity.Exam;

import java.util.List;

@Service
public class ExamServiceImpl implements ExamService{
    @Autowired
    private ExamMapper examMapper;
    @Override
    public List<Exam> getAllExamById(Integer id) {
/*        List<Exam> exams = examMapper.getAllExamById(id);
        for (Exam temp:exams){
            DateFormat dFormat = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
            temp.setCdeadline(dFormat.format(temp.getDeadline()));
        }*/
        return examMapper.getAllExamById(id);
    }

    @Override
    public int getDoneCountById(Integer id) { return examMapper.getDoneCountById(id); }

    @Override
    public int getUnDoneCountById(Integer id) { return examMapper.getUnDoneCountById(id); }

    @Override
    public void delByStuId(Integer id) {
        examMapper.delByStuId(id);
    }
}
