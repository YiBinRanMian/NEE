package scdx.group17.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import scdx.group17.entity.*;
import scdx.group17.service.*;

import javax.servlet.http.HttpSession;
import java.util.ArrayList;
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
    public String getOneHomework(Model model, HttpSession session, Integer hID){
        String s = session.getAttribute("one").toString();
        int ibindex = s.indexOf("id=")+3;
        int ieindex = s.indexOf(",");
        String id = s.substring(ibindex,ieindex);
        Integer uid = Integer.parseInt(id);
        Do stuDo = doService.getByHid(hID,uid);
        List<Compose1> compose1List = compose1Service.getById(hID);
        List<Question> questions = new ArrayList<Question>();
        for (Compose1 compose1:compose1List){
            questions.add(questionService.getByQid(compose1.getqID()));
        }
        model.addAttribute("stuDo",stuDo);
        model.addAttribute("questions",questions);
        return "dohomework";
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
}
