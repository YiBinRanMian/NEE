package scdx.group17.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import scdx.group17.entity.News;
import scdx.group17.entity.User;
import scdx.group17.service.EditorService;
import scdx.group17.service.NewsService;
import scdx.group17.service.UserService;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import java.sql.Timestamp;
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
    @Autowired
    private UserService userService;
    @RequestMapping("/list.do")
    public String getAllNews(Model model, HttpSession httpSession){
        List<News> news = newsService.getAllNews();
        model.addAttribute("list",news);
        return "listNode";
    }
    @RequestMapping("/getNews.do")
    public String getNews(Model model, HttpSession httpSession, HttpServletRequest request, String query){
        List<News> news = newsService.getSome(query);
        Map<String,User> editorMap = new HashMap<String, User>();
        for (News temp:news){
            editorMap.put(temp.getId().toString(),userService.getById(temp.getId()));
        }
        model.addAttribute("list",news);
        model.addAttribute("editorMap",editorMap);
        return "news";
    }
    @RequestMapping("/getOneNews.do")
    public String getOneNews(Model model,Integer nID){
        News news = newsService.getOneNews(nID);
        User editor = userService.getById(news.getId());
/*
        Editor editor = editorService.getById();/
*/
        model.addAttribute("news",news);
        model.addAttribute("editor",editor);
        return "newsinfo";
    }

    @RequestMapping("/delete.do")
    public String deleteNews(Integer nID){
        newsService.delNews(nID);
        return "redirect:/user/login.do";
    }

    @RequestMapping("/editNews.do")
    public String editNews(Integer id, String title, String content){
        Timestamp updatetime = new Timestamp(System.currentTimeMillis());

        newsService.addNews(id,title,content,updatetime);

        return "redirect:/user/login.do";
    }

    @RequestMapping("/new.do")
    public String newnews(){
        return "newnews";
    }

    @RequestMapping("/reviewPass.do")
    public String reviewPass(String id,String nID){
        Timestamp updatetime = new Timestamp(System.currentTimeMillis());
        Integer uid = Integer.parseInt(id);
        Integer nid = Integer.parseInt(nID);
        newsService.reviewNews(nid,uid,1,updatetime);
        return "redirect:/user/login.do";
    }

    @RequestMapping("/reviewDeny")
    public String reviewDeny(String id,String nID){
        Timestamp updatetime = new Timestamp(System.currentTimeMillis());
        Integer uid = Integer.parseInt(id);
        Integer nid = Integer.parseInt(nID);
        newsService.reviewNews(nid,uid,-1,updatetime);
        return "redirect:/user/login.do";
    }
}
