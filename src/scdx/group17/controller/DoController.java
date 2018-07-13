package scdx.group17.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import scdx.group17.common.util.DateTimeUtils;
import scdx.group17.entity.*;
import scdx.group17.service.*;

import javax.servlet.http.HttpSession;
import java.sql.Timestamp;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Controller
@RequestMapping("/homeworks")
public class DoController {
    @Autowired
    private DoService doService;
    @Autowired
    private TeacherService teacherService;
    @Autowired
    private Compose1Service compose1Service;
    @Autowired
    private QuestionService questionService;
    @Autowired
    private StudentService studentService;
    @Autowired
    private TeachService teachService;
    @Autowired
    private UserService userService;


    @RequestMapping("/gethomeworks.do")
    public String getHomeworks(Model model,String query,Integer id){
        /*未完成作业*/
        List<Do> unDones = doService.getsomeUnDone(query,id);
        Map<String,Teacher>  unTeacherMap = new HashMap<String, Teacher>();
        for (Do temp:unDones){
            unTeacherMap.put(temp.getHom_id().toString(),teacherService.getById(temp.getHom_id()));
        }
        /*已完成作业*/
        List<Do> Dones = doService.getsomeDone(query,id);
        Map<String,Teacher>  teacherMap = new HashMap<String, Teacher>();
        for (Do temp:Dones){
            teacherMap.put(temp.getHom_id().toString(),teacherService.getById(temp.getHom_id()));
        }
        model.addAttribute("unDones",unDones);
        model.addAttribute("Dones",Dones);
        model.addAttribute("unTeacherMap",unTeacherMap);
        model.addAttribute("teacherMap",teacherMap);
        return "homeworks";
    }
    @RequestMapping("/dohomework.do")
    public String getOneHomework(Model model, HttpSession session, Integer hID,String step,String qID,String answer,String[] answer1,String size){
        Integer step1 = Integer.parseInt(step);
        Student student = (Student) session.getAttribute("one");
        if (step.equals("0")){
            doService.updateScore(student.getId(),hID,1);
        }
        else if (!step.equals("0")){
            Question question = questionService.getByQid(Integer.parseInt(qID));
            if(question.getType().equals("单选题") || question.getType().equals("判断题")){
                if(answer!=null && answer.equals(question.getAnswer())) doService.updateScore(student.getId(),hID,question.getScore());
            }
            else{
                if(answer1!=null){
                    StringBuffer sb = new StringBuffer();
                    for(int i = 0; i < answer1.length; i++){
                        sb. append(answer1[i]);
                    }
                    String s = sb.toString();
                    System.out.println("回答是"+s);
                    if(s.equals(question.getAnswer())) doService.updateScore(student.getId(),hID,question.getScore());
                }

            }
        }
        if (step.equals(size)){
            return "redirect:/user/login.do";
        }
        else {
            Do stuDo = doService.getByHid(hID,student.getId());
            List<Compose1> compose1List = compose1Service.getById(hID);
            int c = compose1List.size();
            Question question1 = questionService.getByQid(compose1List.get(step1).getqID());
            step1 = step1 +1;
            model.addAttribute("qID",question1.getqID());
            model.addAttribute("size",c);
            model.addAttribute("hID",hID);
            model.addAttribute("step",step1);
            model.addAttribute("stuDo",stuDo);
            model.addAttribute("question",question1);
            return "dohomework";
        }
    }
    @RequestMapping("/homeCompleteInfo.do")
    public String getHomeCompleteInfo(Model model,String query,Integer hom_id){
        /*未完成作业学生*/
        List<Do> unDones = doService.getsomeUnDoneByTechId(query,hom_id);
        Map<String,Student> unStudentMap = new HashMap<String, Student>();
        for (Do temp:unDones){
            unStudentMap.put(temp.getId().toString(),studentService.getById(temp.getId()));
        }
        model.addAttribute("unDones",unDones);
        model.addAttribute("unStudentMap",unStudentMap);
        /*已完成作业学生*/
        List<Do> Dones = doService.getsomeDoneByTechId(query,hom_id);
        Map<String,Student> studentMap = new HashMap<String, Student>();
        for (Do temp:Dones){
            studentMap.put(temp.getId().toString(),studentService.getById(temp.getId()));
        }
        model.addAttribute("Dones",Dones);
        model.addAttribute("studentMap",studentMap);
        return "homecompleteinfo";
    }

    @RequestMapping("/list.do")
    public String ListAll(Model model){
        List<Question> questions = questionService.questionList();
        /*Map<String,Student> stringStudentMap = new HashMap<String, Student>();
        for (Teach teach:teaches){
            stringStudentMap.put(teach.getStu_id().toString(),studentService.getById(teach.getStu_id()));
        }*/
        Map<String,User> stringUserMap = new HashMap<String, User>();
        for (Question temp:questions){
            stringUserMap.put(temp.getId().toString(),userService.getById(temp.getId()));
        }
        Integer maxh = doService.getMax();
        model.addAttribute("max",maxh);
        model.addAttribute("questions",questions);
        model.addAttribute("stringUserMap",stringUserMap);
        return "sethomework";
    }
    @RequestMapping("/set.do")
    public String setHom(Model model,String[] boxes,String id,String hID,String deadline,String title){
        Integer tea_id = Integer.parseInt(id);
        Integer hid = Integer.parseInt(hID);
        Integer maxid = doService.getMax();
        if(hid<=maxid){
            model.addAttribute("info","作业号不正确！");
            model.addAttribute("no","1");
            return "error";
        }
        if (!DateTimeUtils.isDateTime(deadline)){
            model.addAttribute("info","时间格式不正确！");
            return "error";
        }
        Timestamp deadline1 = java.sql.Timestamp.valueOf(deadline);
        List<Teach> teaches = teachService.selectByTeachId(tea_id);
        if(boxes!=null){
            for (String temp:boxes){
                Integer qID = Integer.parseInt(temp);
                compose1Service.addCompose(tea_id,hid,qID);
            }
            for (Teach teach:teaches){
                doService.addNewHom(tea_id,hid,teach.getStu_id(),deadline1,title);
            }
        }
        return "redirect:/user/login.do";
    }


}
