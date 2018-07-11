package scdx.group17.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import scdx.group17.dao.CommentMapper;
import scdx.group17.entity.Comment;

import java.sql.Timestamp;
import java.util.List;

@Service
public class CommentServiceImpl implements CommentService {
    @Autowired
    private CommentMapper commentMapper;
    @Override
    public List<Comment> getAllCommentsByPid(Integer pID) {
        return commentMapper.getAllCommentsByPid(pID);
    }

    @Override
    public List<Comment> getAllCommentsByPosId(Integer id) {
        return commentMapper.getAllCommentsByPosId(id);
    }

    @Override
    public int getCommentCountByPosId(Integer id) {
        return commentMapper.getCommentCountByPosId(id);
    }

    @Override
    public void addNewComment(Integer id, Integer pos_id, Integer pID, String content, Timestamp time, Integer isread) {
        commentMapper.addNewComment(id,pos_id,pID,content,time,isread);
    }
}
