package scdx.group17.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import scdx.group17.entity.Editor;
import scdx.group17.entity.News;
import scdx.group17.service.EditorService;
import scdx.group17.service.NewsService;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Controller
@RequestMapping("/news")
public class NewsController {
    @Autowired
    private NewsService newsService;
    @Autowired
    private EditorService editorService;
    @RequestMapping("/list.do")
    public String getAllNews(Model model, HttpSession httpSession){
        List<News> news = newsService.getAllNews();
        model.addAttribute("list",news);
        return "listNode";
    }
    @RequestMapping("/getNews.do")
    public String getNews(Model model, HttpSession httpSession, HttpServletRequest request, String query){
        List<News> news = newsService.getSome(query);
        Map<String,Editor> editorMap = new HashMap<String, Editor>();
        for (News temp:news){
            editorMap.put(temp.getId().toString(),editorService.getById(temp.getId()));
        }
        model.addAttribute("list",news);
        model.addAttribute("editorMap",editorMap);
        return "news";
    }
    @RequestMapping("/getOneNews.do")
    public String getOneNews(Model model,Integer nID){
        News news = newsService.getOneNews(nID);
        Editor editor = editorService.getById(nID);
        model.addAttribute("news",news);
        model.addAttribute("editor",editor);
        return "newsinfo";
    }


}
