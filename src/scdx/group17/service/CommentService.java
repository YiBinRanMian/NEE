package scdx.group17.service;

import scdx.group17.entity.Comment;

import java.sql.Timestamp;
import java.util.List;

public interface CommentService {
    public List<Comment> getAllCommentsByPid(Integer pID);

    public List<Comment> getAllCommentsByPosId(Integer id);

    public int getCommentCountByPosId(Integer id);

    public void addNewComment(Integer id, Integer pos_id, Integer pID, String content, Timestamp time,Integer isread);


}
