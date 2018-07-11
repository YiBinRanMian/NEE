package scdx.group17.dao;

import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;
import scdx.group17.entity.Reviewer;

@Repository
public interface ReviewerMapper {

    public Reviewer getById(@Param("id")Integer id);
}
