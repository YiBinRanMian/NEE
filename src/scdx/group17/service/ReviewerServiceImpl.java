package scdx.group17.service;

import org.springframework.beans.factory.annotation.Autowired;
import scdx.group17.dao.ReviewerMapper;
import scdx.group17.entity.Reviewer;

public class ReviewerServiceImpl implements ReviewerService {
    @Autowired
    private ReviewerMapper reviewerMapper;
    @Override
    public Reviewer getById(Integer id) {
        return reviewerMapper.getById(id);
    }
}
