package scdx.group17.service;


import scdx.group17.entity.Post;

import java.sql.Timestamp;
import java.util.List;

public interface PostService {

    public List<Post> getAllPostById(Integer id);
    public int getPostCountById(Integer id);
    public void addNewPost(Integer id, String title, String content, Integer istop, Timestamp updatetime);
    public List<Post> getSome(String query);
    public Post getPostByPid(Integer pID);

}
