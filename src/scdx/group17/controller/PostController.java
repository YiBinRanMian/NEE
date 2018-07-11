package scdx.group17.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import scdx.group17.entity.Post;
import scdx.group17.entity.User;
import scdx.group17.service.PostService;
import scdx.group17.service.UserService;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import java.io.UnsupportedEncodingException;
import java.sql.Timestamp;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Controller
@RequestMapping("/post")
public class PostController {
    @Autowired
    private PostService postService;
    @Autowired
    private UserService userService;
    @RequestMapping("/addNewPost.do")
    public String addNewPost(HttpSession session, HttpServletRequest request, Model model) throws UnsupportedEncodingException {
        String s = session.getAttribute("one").toString();
        int ibindex = s.indexOf("id=")+3;
        int ieindex = s.indexOf(",");
        Integer id = Integer.parseInt(s.substring(ibindex, ieindex));
        String title = request.getParameter("titleText");
        String content = request.getParameter("contentText");
        Integer istop;
        if(userService.getById(id).getRole().equals("教师")) istop =1;
        else istop =0;
        Timestamp updatetime = new Timestamp(System.currentTimeMillis());
        postService.addNewPost(id, title, content, istop,updatetime);
        model.addAttribute("title",request.getParameter("titleText"));
        return "addOk";
    }
    @RequestMapping("/addPost.do")
    public String addPost(){
        return "newPost";
    }

    @RequestMapping("/getPosts.do")
    public String getPosts(Model model, String query,HttpServletRequest request,HttpSession session){
        if(request.getParameter("ismodified").equals("1")){
            String s = session.getAttribute("one").toString();
            int ibindex = s.indexOf("id=")+3;
            int ieindex = s.indexOf(",");
            Integer id = Integer.parseInt(s.substring(ibindex, ieindex));
            String title = request.getParameter("titleText");
            String content = request.getParameter("contentText");
            Integer istop;
            if(userService.getById(id).getRole().equals("教师")) istop =1;
            else istop =0;
            Timestamp updatetime = new Timestamp(System.currentTimeMillis());
            postService.addNewPost(id, title, content, istop,updatetime);
            query="";
        }
        List<Post> posts = postService.getSome(query);
        Map<String,User> userMap = new HashMap<String, User>();
        for (Post temp:posts){
            userMap.put(temp.getId().toString(),userService.getById(temp.getId()));
        }
        model.addAttribute("posts",posts);
        model.addAttribute("userMap",userMap);
        return "posts";
    }
}
