package scdx.group17.dao;


import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;
import scdx.group17.entity.News;

import java.sql.Timestamp;
import java.util.List;

@Repository
public interface NewsMapper {
    /*获取所有的新闻*/
    public List<News> getAllNews();
    /*获取新闻内容*/
    public News getOneNews(@Param("nID")Integer nID);
    /*获取一些新闻*/
    public List<News> getsome(@Param("query")String query);
    /*Editor功能*/
    public void addNews(@Param("id")Integer id, @Param("title")String title,@Param("content")String content,@Param("etime")Timestamp etime);
    /*Reviewer功能*/
    public void reviewNews(@Param("nID")Integer nID,@Param("rev_id")Integer rev_id,@Param("isreleased")Integer isreleased,@Param("rtime")Timestamp rtime);
    /*删除新闻*/
    public void delNews(@Param("nID")Integer nID);

    public List<News> getNewsByEditorId(@Param("id")Integer id);

    public void updateNews(@Param("id")Integer id, @Param("title")String title,@Param("content")String content,@Param("etime")Timestamp etime);

    public List<News> getReviewNews();
}
