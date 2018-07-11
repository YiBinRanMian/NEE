package scdx.group17.service;


import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import scdx.group17.dao.PostMapper;
import scdx.group17.entity.Post;

import java.sql.Timestamp;
import java.util.List;

@Service
public class PostServiceImpl implements PostService{
    @Autowired
    private PostMapper postMapper;

    @Override
    public List<Post> getAllPostById(Integer id) {
        return postMapper.getAllPostById(id);
    }

    @Override
    public int getPostCountById(Integer id) {
        return postMapper.getPostCountById(id);
    }

    @Override
    public void addNewPost(Integer id, String title, String content, Integer istop, Timestamp updatetime) {
        postMapper.addNewPost(id,title,content,istop,updatetime);
    }

    @Override
    public List<Post> getSome(String query) {
        return postMapper.getSome(query);
    }

    @Override
    public Post getPostByPid(Integer pID) {
        return postMapper.getPostByPid(pID);
    }
}
