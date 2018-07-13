package scdx.group17.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import scdx.group17.common.util.DateTimeUtils;
import scdx.group17.entity.*;
import scdx.group17.service.*;

import javax.servlet.http.HttpSession;
import java.sql.Date;
import java.sql.Time;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
@Controller
@RequestMapping("/test")
public class TestController {
    @Autowired
    private QuestionService questionService;
    @Autowired
    private UserService userService;
    @Autowired
    private Compose2Service compose2Service;
    @Autowired
    private TeacherService teacherService;
    @Autowired
    private TeachService teachService;
    @Autowired
    private ExamService examService;

    private DateTimeUtils dateTimeUtils;
    @RequestMapping("/list.do")
    public String ListAll(Model model){

        List<Question> questions = questionService.questionList();
        List<Teacher> teachers  = teacherService.getAllTeachers();
        Map<String,User> stringUserMap = new HashMap<String, User>();
        for (Question temp:questions){
            stringUserMap.put(temp.getId().toString(),userService.getById(temp.getId()));
        }
        int maxid = examService.getMax();
        model.addAttribute("max",maxid);
        model.addAttribute("teachers",teachers);
        model.addAttribute("questions",questions);
        model.addAttribute("stringUserMap",stringUserMap);
        return "setpaper";
    }

    @RequestMapping("/set.do")
    public String setPaper(Model model,String id,String[] boxes,String[] selected,String deadline,String time,String title){
        Integer uid = Integer.parseInt(id);
        if(boxes==null){
            model.addAttribute("info","题目不能为空");
            model.addAttribute("no","1");
            return "error";
        }
        int maxid = examService.getMax();
        if (!DateTimeUtils.isDate(deadline)){
            model.addAttribute("info","时间格式不正确！");
            model.addAttribute("no","1");
            return "error";
        }

        Date deadline1 = java.sql.Date.valueOf(deadline);

        Time time1 = java.sql.Time.valueOf(time);

        List<Teach> teachArrayList = new ArrayList<Teach>();
        if(boxes!=null && selected!=null){
            for (String temp:selected){
                Integer teacherId = Integer.parseInt(temp);
                List<Teach> teaches1 = teachService.selectByTeachId(teacherId);
                teachArrayList.addAll(teaches1);
            }
            for (String temp:boxes){
                Integer qID = Integer.parseInt(temp);
                compose2Service.addCompose(uid,maxid+1,qID);
            }
            for (Teach teach:teachArrayList){
                examService.addNewExam(teach.getStu_id(),uid,maxid+1,deadline1,time1,title);
            }


        }
        return "redirect:/user/login.do";
    }

    @RequestMapping("/tests.do")
    public String getTests(Model model,String query,Integer id){
        /*未完成作业*/
        List<Exam> unDones = examService.getsomeUnDoneByStuId(query,id);
        Map<String,User>  unTeacherMap = new HashMap<String, User>();
        for (Exam temp:unDones){
            unTeacherMap.put(temp.getTes_id().toString(),userService.getById(temp.getTes_id()));
        }
        /*已完成作业*/
        List<Exam> Dones = examService.getsomeDoneByStuId(query,id);
        Map<String,Teacher>  teacherMap = new HashMap<String, Teacher>();
        for (Exam temp:Dones){
            teacherMap.put(temp.getTes_id().toString(),teacherService.getById(temp.getTes_id()));
        }
        model.addAttribute("unDones",unDones);
        model.addAttribute("Dones",Dones);
        model.addAttribute("unTeacherMap",unTeacherMap);
        model.addAttribute("teacherMap",teacherMap);
        return "tests";
    }

    @RequestMapping("/dotest.do")
    public String getOneTest(Model model, HttpSession session, Integer tID, String step, String qID, String answer, String[] answer1, String size){
        Integer step1 = Integer.parseInt(step);
        Student student = (Student) session.getAttribute("one");
        if (step.equals("0")){
            examService.updateScore(student.getId(),tID,1);
        }
        else if (!step.equals("0")){
            Question question = questionService.getByQid(Integer.parseInt(qID));
            System.out.println("题目是:" + question.getTitle());
            System.out.println("答案是:" + question.getAnswer());
            if(question.getType().equals("单选题") || question.getType().equals("判断题")){
                System.out.println("回答是:"+ answer);
                if(answer.equals(question.getAnswer())) examService.updateScore(student.getId(),tID,question.getScore());
            }
            else{
                StringBuffer sb = new StringBuffer();
                for(int i = 0; i < answer1.length; i++){
                    sb. append(answer1[i]);
                }
                String s = sb.toString();
                System.out.println("回答是"+s);
                if(s.equals(question.getAnswer())) examService.updateScore(student.getId(),tID,question.getScore());
            }
        }
        if (step.equals(size)){
            return "redirect:/user/login.do";
        }
        else {
            Exam stuDo = examService.getByTid(tID,student.getId());
            List<Compose2> compose2List = compose2Service.getById(tID);
            int c = compose2List.size();
            Question question1 = questionService.getByQid(compose2List.get(step1).getqID());
            step1 = step1 +1;
            model.addAttribute("qID",question1.getqID());
            model.addAttribute("size",c);
            model.addAttribute("tID",tID);
            model.addAttribute("step",step1);
            model.addAttribute("stuDo",stuDo);
            model.addAttribute("question",question1);
            return "dotest";
        }
    }

}
