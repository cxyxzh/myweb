package com.xzh.web.web.admin.dao;

import com.xzh.web.domain.ItemCat;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public interface ItemCatDao<T>{


    List<T> selectAllParent();
    List<T> selectByParent(Long parentId);
    List<T> selectAllCategory();

    T selectById(Long id);

    void insert(T itemCat);

    void update(T itemCat);
}
