package scdx.group17.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import scdx.group17.dao.EditorMapper;
import scdx.group17.entity.Editor;

@Service
public class EditorServiceImpl implements EditorService {
    @Autowired
    private EditorMapper editorMapper;
    @Override
    public Editor getById(Integer id) {
        return editorMapper.getById(id);
    }
}
