package scdx.group17.dao;


import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;
import scdx.group17.entity.Comment;

import java.sql.Timestamp;
import java.util.List;

@Repository
public interface CommentMapper {
    public List<Comment> getAllCommentsByPid(@Param("pID")Integer pID);
    public List<Comment> getAllCommentsByPosId(@Param("pos_id")Integer pos_id);
    public int getCommentCountByPosId(@Param("pos_id")Integer pos_id);
    public void addNewComment(@Param("id")Integer id, @Param("pos_id")Integer pos_id, @Param("pID")Integer pID, @Param("content")String content, @Param("time")Timestamp time,@Param("isread")Integer isread);

}
