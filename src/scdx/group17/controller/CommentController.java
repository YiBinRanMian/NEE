package scdx.group17.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import scdx.group17.entity.Comment;
import scdx.group17.entity.Post;
import scdx.group17.entity.User;
import scdx.group17.service.CommentService;
import scdx.group17.service.PostService;
import scdx.group17.service.UserService;

import javax.servlet.http.HttpSession;
import java.sql.Timestamp;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Controller
@RequestMapping("/comments")
public class CommentController {
    @Autowired
    private CommentService commentService;
    @Autowired
    private PostService postService;
    @Autowired
    private UserService userService;
    @RequestMapping("/getPostComments.do")
    public String getPostComments(HttpSession session,String ismodified, Model model, Integer pID,String commentText){
        Post post = postService.getPostByPid(pID);
        if(ismodified.equals("1")){
            String s = session.getAttribute("one").toString();
            int ibindex = s.indexOf("id=")+3;
            int ieindex = s.indexOf(",");
            Integer id = Integer.parseInt(s.substring(ibindex, ieindex));
            Timestamp updatetime = new Timestamp(System.currentTimeMillis());
            commentService.addNewComment(id,post.getId(),pID,commentText,updatetime,0);
        }
        List<Comment> comments = commentService.getAllCommentsByPid(pID);
        Map<String,User> commenters = new HashMap<String, User>();
        for (Comment comment:comments){
            commenters.put(comment.getId().toString(),userService.getById(comment.getId()));
        }
        User poster = userService.getById(post.getId());
        model.addAttribute("comments",comments);
        model.addAttribute("post",post);
        model.addAttribute("commenters",commenters);
        model.addAttribute("poster",poster);
        return "comments";
    }
}
