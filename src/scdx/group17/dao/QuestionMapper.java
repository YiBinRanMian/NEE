package scdx.group17.dao;

import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;
import scdx.group17.entity.Question;

import java.util.List;


@Repository
public interface QuestionMapper {

    public Question getByQid(@Param("qID")Integer qID);

    public List<Question> questionList();

    public void addQuestion(@Param("id")Integer id,@Param("category")String category,@Param("type")String type,@Param("title")String title,@Param("answer")String answer,@Param("score")Integer score,@Param("optionA")String optionA,@Param("optionB")String optionB,@Param("optionC")String optionC,@Param("optionD")String optionD);

    public void addJudge(@Param("id")Integer id,@Param("category")String category,@Param("type")String type,@Param("title")String title,@Param("answer")String answer,@Param("score")Integer score);

    public void delByQid(@Param("qID")Integer qID);

}
