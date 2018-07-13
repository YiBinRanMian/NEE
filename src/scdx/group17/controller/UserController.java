package scdx.group17.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import scdx.group17.entity.*;
import scdx.group17.service.*;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Controller
@RequestMapping("/user")
public class UserController {
    @Autowired
    private UserService userService;
    @Autowired
    private StudentService studentService;
    @Autowired
    private DoService doService;
    @Autowired
    private TeacherService teacherService;
    @Autowired
    private ExamService examService;
    @Autowired
    private TgroupService tgroupService;
    @Autowired
    private NewsService newsService;
    @Autowired
    private EditorService editorService;
    @Autowired
    private PostService postService;
    @Autowired
    private CommentService commentService;
    @Autowired
    private TeachService teachService;
    @Autowired
    private QuestionService questionService;

    @RequestMapping("/login.do")
    public String login(Model model, HttpSession session, HttpServletRequest request, String id, String password){
        if(request.getParameter("idtext")!=null){
            id = request.getParameter("idtext");
            password = request.getParameter("passwordtext");
        }else {
            String s = session.getAttribute("one").toString();
            int ibindex = s.indexOf("id=")+3;
            int ieindex = s.indexOf(",");
            id = s.substring(ibindex,ieindex);
            int pbindex = s.indexOf(", password='")+12;
            int peindex = s.indexOf("}")-1;
            password = s.substring(pbindex,peindex);
        }
        String re = "";
        if(!id.matches("[0-9]+")){
            model.addAttribute("info","用户名格式不正确");
            model.addAttribute("no","0");
            return "error";
        }
        Integer uid = Integer.parseInt(id);
        String role = userService.getIfLogin(uid,password);
        if(role.equals("teacher")) {
            re = "indexteacher";

            Teacher teacher = teacherService.getById(uid);
            model.addAttribute("one",teacher);
            /*新闻信息*/
            List<News> news = newsService.getAllNews();
            Map<String,User> editorMap = new HashMap<String, User>();
            for (News temp:news){
                editorMap.put(temp.getId().toString(),userService.getById(temp.getId()));
            }
            /*发帖计数*/
            int postCount = postService.getPostCountById(uid);
            /*评论消息*/
            List<Comment> comments = commentService.getAllCommentsByPosId(uid);
            int commentCount = commentService.getCommentCountByPosId(uid);
            /*作业信息*/
            List<Do> dos = doService.getAllDoByHomId(uid);
            Map<String,Student> studentMap = new HashMap<String, Student>();
            for (Do temp:dos){
                studentMap.put(temp.getId().toString(),studentService.getById(temp.getId()));
            }
            model.addAttribute("news",news);
            model.addAttribute("editorMap",editorMap);
            model.addAttribute("postCount",postCount);
            model.addAttribute("comments",comments);
            model.addAttribute("commentCount",commentCount);
            model.addAttribute("studentMap",studentMap);
            model.addAttribute("dos",dos);
        }
        else if(role.equals("group")) {
            re = "indexgroup";
            User user = userService.getById(uid);
            List<Question> questions = questionService.questionList();

            Map<String,User> stringUserMap = new HashMap<String, User>();
            for (Question temp:questions){
                stringUserMap.put(temp.getId().toString(),userService.getById(temp.getId()));
            }
            model.addAttribute("one",user);
            model.addAttribute("questions",questions);
            model.addAttribute("stringUserMap",stringUserMap);
        }
        else if (role.equals("editor")) {
            re = "indexeditor";
            /*已编辑新闻信息*/
            List<News> news = newsService.getNewsByEditorId(uid);
            User editor = userService.getById(uid);
            Map<String,User> editorMap = new HashMap<String, User>();
            for (News temp:news){
                editorMap.put(temp.getId().toString(),userService.getById(temp.getId()));
            }
            Map<String,User> reviewerMap = new HashMap<String, User>();
            for (News temp:news){
                if(temp.getIsreleased()!=0)
                    reviewerMap.put(temp.getRev_id().toString(),userService.getById(temp.getRev_id()));
            }
            model.addAttribute("one",editor);
            model.addAttribute("news",news);
            model.addAttribute("editorMap",editorMap);
            model.addAttribute("reviewerMap",reviewerMap);
        }
        else if (role.equals("reviewer")) {
            re = "indexreviewer";
            List<News> news = newsService.getReviewNews();
            User reviewer = userService.getById(uid);
            model.addAttribute("one",reviewer);
            Map<String,User> editorMap = new HashMap<String, User>();
            for (News temp:news){
                editorMap.put(temp.getId().toString(),userService.getById(temp.getId()));
            }
            model.addAttribute("news",news);
            model.addAttribute("editorMap",editorMap);
        }
        else if (role.equals("useradmin")) {
            re = "useradmin";
            User useradmin = userService.getById(uid);
            model.addAttribute("one",useradmin);
            List<User> users = userService.getAllUser();
            model.addAttribute("list",users);
        }
        else if (role.equals("student")) {
            re = "indexstudent";

            Student student = studentService.getById(uid);
            /*作业计数*/
            int doneCount = doService.getDoneCountById(uid);
            int unDoneCount = doService.getUnDoneCountById(uid);
            /*作业信息*/
            List<Do> dos = doService.getAllDoById(uid);
            Map<String,Teacher> doTeacherMap = new HashMap<String, Teacher>();
            for (Do temp:dos){
                doTeacherMap.put(temp.getHom_id().toString(),teacherService.getById(temp.getHom_id()));
            }
            /*考试计数*/
            int examCount = examService.getDoneCountById(uid);
            int unExamCount = examService.getUnDoneCountById(uid);
            /*考试信息*/
            List<Exam> exams = examService.getAllExamById(uid);
            Map<String,User> userMap = new HashMap<String, User>();
            for (Exam temp:exams){
                userMap.put(temp.getTes_id().toString(),userService.getById(temp.getTes_id()));
            }
            /*新闻信息*/
            List<News> news = newsService.getAllNews();
            Map<String,User> editorMap = new HashMap<String, User>();
            for (News temp:news){
                editorMap.put(temp.getId().toString(),userService.getById(temp.getId()));
            }
            /*发帖计数*/
            int postCount = postService.getPostCountById(uid);
            /*评论消息*/
            List<Comment> comments = commentService.getAllCommentsByPosId(uid);
            int commentCount = commentService.getCommentCountByPosId(uid);
            /*model*/
            model.addAttribute("one",student);
            model.addAttribute("dos",dos);
            model.addAttribute("doTeacherMap",doTeacherMap);
            model.addAttribute("doneCount",doneCount);
            model.addAttribute("unDoneCount",unDoneCount);
            model.addAttribute("exams",exams);
            model.addAttribute("examTgroupMap",userMap);
            model.addAttribute("examCount",examCount);
            model.addAttribute("unExamCount",unExamCount);
            model.addAttribute("news",news);
            model.addAttribute("editorMap",editorMap);
            model.addAttribute("postCount",postCount);
            model.addAttribute("comments",comments);
            model.addAttribute("commentCount",commentCount);
        }
        else if (role.equals("userAdmin")) re = "indexuseradmin";
        else if (role.equals("postAdmin")) re = "indexpostadmin";
        else {
            re = "error";
            model.addAttribute("info","忘记密码!");
            model.addAttribute("no","0");
        }
        return re;
    }

    @RequestMapping("/list.do")
    public String getAllUser(Model model){
        List<User> users = userService.getAllUser();
        model.addAttribute("list",users);
        return "listUser";
    }

    @RequestMapping("/getById.do")
    public String getById(Model model,Integer id){
        User user = userService.getById(id);
        model.addAttribute("one",user);
        return "User";
    }
    @RequestMapping("/edit.do")
    public String editUser(HttpSession session,Model model,Integer id){
        String s = session.getAttribute("one").toString();
        int ibindex = s.indexOf("id=")+3;
        int ieindex = s.indexOf(",");
        Integer uid = Integer.parseInt(s.substring(ibindex,ieindex));
        User user = userService.getById(id);
        model.addAttribute("edited",user);
        return "edituser";
    }
    @RequestMapping("/esubmit.do")
    public String esubmit(Model model,String id,String password,String name,String optionsRadios,String role,String subject,String confirm){
        if(id==null || password == null){
            model.addAttribute("info","用户名或密码不能为空!");
            model.addAttribute("no","1");
            return "error";
        }
        Integer uid = Integer.parseInt(id);
        if (confirm.equals("agree"))
            userService.updateUser(uid,password,optionsRadios,role,name,subject);
        return "redirect:/user/login.do";
    }

    @RequestMapping("/delete.do")
    public String deleteUser(String id){
        Integer uid = Integer.parseInt(id);
        User user = userService.getById(uid);
        if (user.getRole().equals("teacher") || user.getRole().equals("tgroup")|| user.getRole().equals("editor")|| user.getRole().equals("reviewer")){

            return "alert";
        }
        else if(user.getRole().equals("student")){
            examService.delByStuId(uid);
            doService.delByStuId(uid);
            teachService.delByStuId(uid);
            studentService.delByStuId(uid);
        }
        userService.delUser(uid);
        return "redirect:/user/login.do";
    }

    @RequestMapping("/add.do")
    public String addUser(Model model,String addid,String addpassword,String addname,String addgender,String addrole,String addsubject){
        if(addid.equals("") || addpassword.equals("")){
            model.addAttribute("info","用户名或密码不能为空!");
            model.addAttribute("no","1");
            return "error";
        }
        Integer uid = Integer.parseInt(addid);
        userService.addUser(uid,addpassword,addgender,addrole,addname,addsubject);
        if(addrole.equals("student"))  studentService.addUser(uid,addpassword,addgender,addrole,addname);
        else if(addrole.equals("teacher")) teacherService.addUser(uid,addpassword,addgender,addrole,addname,addsubject);
        return "redirect:/user/login.do";
    }
    @RequestMapping("/delUsers.do")
    public String delUsers(Model model,String[] boxes){
        if(boxes!=null){
            for (String temp:boxes){
                Integer uid = Integer.parseInt(temp);
                User user = userService.getById(uid);
                if (user.getRole().equals("teacher") || user.getRole().equals("tgroup")|| user.getRole().equals("editor")|| user.getRole().equals("reviewer")){
                    model.addAttribute("info","教师、编辑、审核、教研组不能删除!");
                    model.addAttribute("no","1");
                    return "error";
                }
                if(user.getRole().equals("student")){
                    examService.delByStuId(uid);
                    doService.delByStuId(uid);
                    teachService.delByStuId(uid);
                }
                userService.delUser(uid);
            }
        }

        return "redirect:/user/login.do";
    }
}
