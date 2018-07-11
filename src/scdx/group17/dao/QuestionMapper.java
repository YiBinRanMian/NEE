package scdx.group17.dao;

import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;
import scdx.group17.entity.Question;


@Repository
public interface QuestionMapper {

    public Question getByQid(@Param("qID")Integer qID);
}
