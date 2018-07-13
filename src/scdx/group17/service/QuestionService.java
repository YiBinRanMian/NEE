package scdx.group17.service;

import scdx.group17.entity.PageTableForm;
import scdx.group17.entity.Question;

import java.util.List;

public interface QuestionService {
    public Question getByQid(Integer qID);

    public void addQuestion(Integer id, String category, String type, String title, String answer, Integer score, String optionA, String optionB, String optionC, String optionD);

    public void addJudge(Integer id, String category, String type, String title, String answer, Integer score);

    public List<Question> questionList();

    public void delByQid(Integer qID);

    public PageTableForm queryQuestionInfo(PageTableForm pageTableForm);
}
