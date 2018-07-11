package scdx.group17.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import scdx.group17.dao.QuestionMapper;
import scdx.group17.entity.Question;

@Service
public class QuestionServiceImpl implements QuestionService {
    @Autowired
    private QuestionMapper questionMapper;
    @Override
    public Question getByQid(Integer qID) {

        return questionMapper.getByQid(qID);
    }
}
