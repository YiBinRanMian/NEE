package scdx.group17.service;

import scdx.group17.entity.News;

import java.sql.Timestamp;
import java.util.List;

public interface NewsService {

    public List<News> getAllNews();
    public List<News> getSome(String query);
    public News getOneNews(Integer nID);
    /*Editor功能*/
    public void addNews(Integer id, String title, String content, Timestamp etime);
    /*Reviewer功能*/
    public void reviewNews(Integer nID,Integer rev_id,Integer isreleased,Timestamp rtime);
    /*删除新闻*/
    public void delNews(Integer nID);

    public List<News> getNewsByEditorId(Integer id);

    public void updateNews(Integer id, String title,String content,Timestamp etime);

    public List<News> getReviewNews();

}
