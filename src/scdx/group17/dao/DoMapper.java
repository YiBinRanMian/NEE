package scdx.group17.dao;

import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;
import scdx.group17.entity.Do;

import java.util.List;

@Repository
public interface DoMapper {
    public List<Do> getAllDoById(@Param("id")Integer id);

    public int getDoneCountById(@Param("id")Integer id);

    public int getUnDoneCountById(@Param("id")Integer id);

    public List<Do> getsomeUnDoneByStuId(@Param("query")String query,@Param("id")Integer id);

    public List<Do> getsomeDoneByStuId(@Param("query")String query,@Param("id")Integer id);

    public Do getByHid(@Param("hID")Integer hID,@Param("id")Integer id);

    public List<Do> getsomeUnDoneByTechId(@Param("query")String query,@Param("hom_id")Integer hom_id );
    public List<Do> getsomeDoneByTechId(@Param("query")String query,@Param("hom_id")Integer hom_id );

    public List<Do> getAllDoByHomId(@Param("hom_id")Integer hom_id);

    public void delByStuId(@Param("id")Integer id);


}
