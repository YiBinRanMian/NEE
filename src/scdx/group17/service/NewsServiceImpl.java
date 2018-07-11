package scdx.group17.service;


import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import scdx.group17.dao.NewsMapper;
import scdx.group17.entity.News;

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
}
