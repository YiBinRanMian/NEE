package scdx.group17.controller;


import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import scdx.group17.service.QuestionService;

@Controller
@RequestMapping("/question")
public class QuestionController {
    @Autowired
    private QuestionService questionService;
    @RequestMapping("/delete.do")
    public String deleteByQid(String qID){
        Integer id = Integer.parseInt(qID);
        questionService.delByQid(id);
        return "redirect:/user/login.do";
    }

    @RequestMapping("/add.do")
    public String addQuestion(String id,String addcategory,String addtype,String addtitle,String addanswer,String addoptiona,String addoptionb,String addoptionc,String addoptiond,String addscore){
        Integer uid = Integer.parseInt(id);
        Integer score = Integer.parseInt(addscore);
        if (addtype.equals("判断题"))
            questionService.addJudge(uid,addcategory,addtype,addtitle,addanswer,score);
        else
            questionService.addQuestion(uid,addcategory,addtype,addtitle,addanswer,score,addoptiona,addoptionb,addoptionc,addoptiond);
        return "redirect:/user/login.do";
    }

    @RequestMapping("delQuestions.do")
    public String delQuestions(String boxes[]){
        if(boxes!=null){
            for (String temp:boxes){
                Integer qID = Integer.parseInt(temp);
                questionService.delByQid(qID);
            }
        }

        return "redirect:/user/login.do";
    }
}
