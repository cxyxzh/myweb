package com.xzh.web.web.admin.dao;

import com.xzh.web.commons.dto.BaseResult;
import com.xzh.web.domain.User;
import org.apache.ibatis.annotations.Select;
import org.springframework.stereotype.Repository;

import java.util.List;
import java.util.Map;

@Repository
public interface UserDao<T> {

    T selectPasswordByUsername(String username);

    List<T> selectByPage(Map<String,Object> map);

    T selectByName(String username);

    void insert(T user);

    T selectById(Long id);

    int count(T user);

    void update(T user);

    void deleteById(String[] ids);


}
