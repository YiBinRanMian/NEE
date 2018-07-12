package scdx.group17.service;


import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import scdx.group17.dao.NewsMapper;
import scdx.group17.entity.News;

import java.sql.Timestamp;
import java.util.List;

@Service
public class NewsServiceImpl implements NewsService{
    @Autowired
    private NewsMapper newsMapper;
    @Override
    public List<News> getAllNews() {

/*        for (News temp:news){
            DateFormat dFormat = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
            System.out.print(temp.getRtime());
            temp.setCtime(dFormat.format(temp.getRtime()));
        }*/
        return newsMapper.getAllNews();
    }

    @Override
    public List<News> getSome(String query) {
/*        for (News temp:news){
            DateFormat dFormat = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
            System.out.print(temp.getRtime());
            temp.setCtime(dFormat.format(temp.getRtime()));
        }*/
        return newsMapper.getsome(query);
    }

    @Override
    public News getOneNews(Integer nID) {
        return newsMapper.getOneNews(nID);
    }

    @Override
    public void addNews(Integer id, String title, String content, Timestamp etime) {
        newsMapper.addNews(id, title, content, etime);
    }

    @Override
    public void reviewNews(Integer nID,Integer rev_id, Integer isreleased, Timestamp rtime) {
        newsMapper.reviewNews(nID,rev_id, isreleased, rtime);
    }

    @Override
    public void delNews(Integer nID) {
        newsMapper.delNews(nID);
    }

    @Override
    public List<News> getNewsByEditorId(Integer id) {
        return newsMapper.getNewsByEditorId(id);
    }

    @Override
    public void updateNews(Integer id, String title, String content, Timestamp etime) {
        newsMapper.updateNews(id, title, content, etime);
    }

    @Override
    public List<News> getReviewNews() {
        return newsMapper.getReviewNews();
    }


}
