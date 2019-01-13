package com.xzh.web.web.admin.web.controller;


import com.xzh.web.commons.utils.CookieUtils;
import com.xzh.web.commons.utils.jsonMsg;
import com.xzh.web.domain.LoginVO;
import com.xzh.web.domain.User;
import com.xzh.web.web.admin.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.validation.BindingResult;
import org.springframework.validation.annotation.Validated;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.List;

@Controller
public class LoginController {

    @Autowired
    private UserService userService;

    @GetMapping("exit")
    public String exit(HttpServletRequest request, HttpServletResponse response){
        CookieUtils.deleteCookie(request,response,"username");
        CookieUtils.deleteCookie(request,response,"password");
        request.getSession().invalidate();
        return "redirect:/index";
    }



    @RequestMapping(value = "/login",method = RequestMethod.POST)
    @ResponseBody
    public jsonMsg login(LoginVO loginVO, HttpServletResponse response, HttpServletRequest request){
        jsonMsg<User> jsonMsg=userService.userLogin(loginVO);

        if("success".equals(jsonMsg.getMsg())){
            request.getSession().setAttribute("user",jsonMsg.getData().get(0));
            if("true".equals(loginVO.getIsRemember())) {
                CookieUtils.setCookie(request, response, "username", loginVO.getUsername(), 60 * 60 * 24 * 7);
                CookieUtils.setCookie(request, response, "password", loginVO.getPassword(), 60 * 60 * 24 * 7);
            }
        }
        return jsonMsg;

    }
}
