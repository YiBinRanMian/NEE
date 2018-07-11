package scdx.group17.service;

import scdx.group17.entity.News;

import java.util.List;

public interface NewsService {

    public List<News> getAllNews();
    public List<News> getSome(String query);
    public News getOneNews(Integer nID);
}
