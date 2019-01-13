package com.xzh.web.web.admin.web.listener;

import com.xzh.web.commons.utils.CookieUtils;
import com.xzh.web.commons.utils.MyRequestHeader;
import com.xzh.web.commons.utils.jsonMsg;
import com.xzh.web.domain.LoginVO;
import com.xzh.web.web.admin.service.UserService;
import com.xzh.web.web.admin.service.impl.UserServiceImpl;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.context.request.RequestContextHolder;
import org.springframework.web.context.request.ServletRequestAttributes;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSessionEvent;
import javax.servlet.http.HttpSessionListener;

public class MySessionListener implements HttpSessionListener {
    private static int num=0;
    private Logger logger= LoggerFactory.getLogger(MySessionListener.class);

    @Override
    public void sessionCreated(HttpSessionEvent se) {
        System.out.println("==================================================");
        HttpServletRequest request = ((ServletRequestAttributes) RequestContextHolder.getRequestAttributes()).getRequest();
        String ipAddress = MyRequestHeader.getIpAddress(request);
        num++;
        logger.info("ip:"+ipAddress+":已连接服务器");
        logger.info("当前服务器访问人数为:"+num);
        String username = CookieUtils.getCookieValue(request, "username");
        String password = CookieUtils.getCookieValue(request, "password");
        if (username != null && password != null) {
            logger.info("ip:"+ipAddress+"用户名:"+username+":正在自动登录....");
        }else {
            logger.info("ip:"+ipAddress+":暂无登录记录");
        }

    }

    @Override
    public void sessionDestroyed(HttpSessionEvent se) {
        HttpServletRequest request = ((ServletRequestAttributes) RequestContextHolder.getRequestAttributes()).getRequest();
        String ipAddress = MyRequestHeader.getIpAddress(request);
        logger.info("ip:"+ipAddress+":已退出服务器");
        num--;
        logger.info("当前服务器访问人数为:"+num);
    }
}
