package com.xzh.web.web.admin.dao;

import com.xzh.web.commons.vo.PageVO;
import com.xzh.web.domain.Item;
import org.springframework.stereotype.Repository;

import java.util.List;
@Repository
public interface ItemDao<T> {
    List<T> selectByPage(PageVO<T> pageVO);
    Integer count(PageVO<T> pageVO);
    void update(T item);
    T selectById(Long id);
}
