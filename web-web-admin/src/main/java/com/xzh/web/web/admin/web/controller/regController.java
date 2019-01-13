package com.xzh.web.web.admin.web.controller;

import com.xzh.web.commons.dto.BaseResult;
import com.xzh.web.commons.utils.CookieUtils;
import com.xzh.web.domain.User;
import com.xzh.web.web.admin.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@Controller
public class regController {

    @Autowired
    UserService userService;

    @GetMapping("rename")
    @ResponseBody
    public BaseResult isRename(String username){

        return userService.selectByName(username);

    }

    @PostMapping("reg")
    @ResponseBody
    public BaseResult reg(HttpServletRequest request, HttpServletResponse response,User user){
        BaseResult baseResult=userService.insert(user);
        if (baseResult.getStatus()==200){
            CookieUtils.setCookie(request,response,"username",user.getUsername(),60*60*24*7);
            CookieUtils.setCookie(request,response,"password",user.getPassword(),60*60*24*7);
        }
        return baseResult;
    }
}
