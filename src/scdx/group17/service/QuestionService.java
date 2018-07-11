package scdx.group17.service;

import org.springframework.stereotype.Service;
import scdx.group17.entity.Question;

public interface QuestionService {
    public Question getByQid(Integer qID);
}
