package scdx.group17.dao;


import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;
import scdx.group17.entity.Post;

import java.sql.Timestamp;
import java.util.List;

@Repository
public interface PostMapper {

    public List<Post> getAllPostById(@Param("id")Integer id);
    public int getPostCountById(@Param("id")Integer id);
    public void addNewPost(@Param("id")Integer id, @Param("title")String title, @Param("content")String content, @Param("istop")Integer istop, @Param("updatetime")Timestamp updatetime);
    public List<Post> getSome(@Param("query")String query);
    public Post getPostByPid(@Param("pID")Integer pID);
}
