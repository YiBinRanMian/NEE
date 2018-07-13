package scdx.group17.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import scdx.group17.entity.Student;
import scdx.group17.entity.Teach;
import scdx.group17.entity.Teacher;
import scdx.group17.service.StudentService;
import scdx.group17.service.TeachService;
import scdx.group17.service.TeacherService;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import static scdx.group17.common.util.subTractUtil.subtractList;

@Controller
@RequestMapping("/teach")
public class TeachController {
    @Autowired
    private TeacherService teacherService;
    @Autowired
    private StudentService studentService;
    @Autowired
    private TeachService teachService;
    @RequestMapping("/getClassInfo.do")
    public String getClassInfo(Model model){
        List<Teacher> teachers = teacherService.getAllTeachers();
        Map<String,List<Student>> stringListMap = new HashMap<String, List<Student>>();
        Map<String,List<Student>> stringListMap1 = new HashMap<String, List<Student>>();
        for (Teacher temp:teachers){
            List<Student> students = studentService.getAllStudents();
            List<Teach> teaches = teachService.selectByTeachId(temp.getId());
            List<Student> tempstu = new ArrayList<Student>();
            for (Teach temp1:teaches){
                Student student = studentService.getById(temp1.getStu_id());
                tempstu.add(student);
            }
            List<Student> stu = subtractList(students,tempstu,"id");
            stringListMap1.put(temp.getId().toString(),tempstu);
            stringListMap.put(temp.getId().toString(),stu);
        }
        model.addAttribute("stringListMap1",stringListMap1);
        model.addAttribute("stringListMap",stringListMap);
        model.addAttribute("teachers",teachers);
        return "classinfo";
    }

    @RequestMapping("/allocate.do")
    public String allocate(String[] students,String tid){
        Integer tea_id = Integer.parseInt(tid);
        if(students != null){
            for (String temp:students){
                Integer stu_id = Integer.parseInt(temp);
                teachService.addClass(stu_id,tea_id);
            }
        }
        return "redirect:/teach/getClassInfo.do";
    }

    @RequestMapping("/del.do")
    public String del(String[] students,String tid){
        Integer tea_id = Integer.parseInt(tid);
        if(students != null){
            for (String temp:students){
                Integer stu_id = Integer.parseInt(temp);
                teachService.delClass(stu_id,tea_id);
            }
        }
        return "redirect:/teach/getClassInfo.do";
    }





}
