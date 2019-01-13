package com.xzh.web.web.admin.service;


import com.xzh.web.commons.dto.BaseResult;
import com.xzh.web.commons.dto.PageInfo;
import com.xzh.web.commons.utils.jsonMsg;
import com.xzh.web.domain.LoginVO;
import com.xzh.web.domain.User;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import java.util.List;

public interface UserService {
    jsonMsg userLogin(LoginVO loginVO);

    BaseResult selectByName(String username);

    BaseResult insert(User user);

    User userLogin(User user);

    User selectById(Long id);

    PageInfo<User> page(int draw, int start, int length, User user);

    BaseResult save(User user);

    BaseResult deleteByIds(String[] split);
}
