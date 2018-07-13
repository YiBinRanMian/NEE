package scdx.group17.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import scdx.group17.dao.QuestionMapper;
import scdx.group17.entity.PageTableForm;
import scdx.group17.entity.Question;

import java.util.List;

@Service
public class QuestionServiceImpl implements QuestionService {
    @Autowired
    private QuestionMapper questionMapper;

    private List<Question> questionList;
    @Override
    public Question getByQid(Integer qID) {

        return questionMapper.getByQid(qID);
    }

    @Override
    public void addQuestion(Integer id, String category, String type, String title, String answer, Integer score, String optionA, String optionB, String optionC, String optionD) {
        questionMapper.addQuestion(id, category, type, title, answer, score, optionA, optionB, optionC, optionD);
    }

    @Override
    public void addJudge(Integer id, String category, String type, String title, String answer, Integer score) {
        questionMapper.addJudge(id, category, type, title, answer, score);
    }

    @Override
    public List<Question> questionList() {
        return questionMapper.questionList();
    }

    @Override
    public void delByQid(Integer qID) {
        questionMapper.delByQid(qID);
    }

    @Override
    public PageTableForm queryQuestionInfo(PageTableForm pageTableForm) {
        questionList = questionMapper.questionList();
        pageTableForm.setQuestionList(questionList);
        return pageTableForm;
    }
}
