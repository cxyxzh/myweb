package com.xzh.web.web.admin.web.interceptor;

import com.xzh.web.commons.utils.CookieUtils;
import com.xzh.web.commons.utils.jsonMsg;
import com.xzh.web.domain.LoginVO;
import com.xzh.web.web.admin.service.UserService;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.servlet.HandlerInterceptor;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class AutoLogin implements HandlerInterceptor {
    private Logger logger= LoggerFactory.getLogger(Autowired.class);

    @Autowired
    UserService userService;
    @Override
    public boolean preHandle(HttpServletRequest httpServletRequest, HttpServletResponse httpServletResponse, Object o) throws Exception {
        Object autoLogin = httpServletRequest.getSession().getAttribute("AutoLogin");

        if(autoLogin==null||autoLogin.equals(true)){
            String username = CookieUtils.getCookieValue(httpServletRequest, "username");
            String password = CookieUtils.getCookieValue(httpServletRequest, "password");
            if (username != null && password != null) {
                LoginVO loginVO = new LoginVO();
                loginVO.setPassword(password);
                loginVO.setUsername(username);
                jsonMsg jsonMsg = userService.userLogin(loginVO);
                if ("success".equals(jsonMsg.getMsg())) {
                    httpServletRequest.getSession().setAttribute("user", jsonMsg.getData().get(0));
                    logger.info("自动登录成功！");
                }else
                    logger.info("自动登录失败");
            }
        }
        httpServletRequest.getSession().setAttribute("AutoLogin",false);
        return true;
    }

    @Override
    public void postHandle(HttpServletRequest httpServletRequest, HttpServletResponse httpServletResponse, Object o, ModelAndView modelAndView) throws Exception {

    }

    @Override
    public void afterCompletion(HttpServletRequest httpServletRequest, HttpServletResponse httpServletResponse, Object o, Exception e) throws Exception {

    }
}
