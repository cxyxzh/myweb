package com.xzh.web.web.admin.service.impl;




import com.xzh.web.commons.dto.BaseResult;
import com.xzh.web.commons.dto.PageInfo;
import com.xzh.web.commons.utils.BeanValidator;
import com.xzh.web.commons.utils.jsonMsg;
import com.xzh.web.domain.LoginVO;
import com.xzh.web.domain.User;
import com.xzh.web.web.admin.dao.UserDao;
import com.xzh.web.web.admin.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import java.util.*;
import java.util.regex.Matcher;
import java.util.regex.Pattern;


@Service
public class UserServiceImpl implements UserService {
    @Autowired
    private UserDao<User> userdao;



    @Override
    public jsonMsg userLogin(LoginVO loginVO) {
        jsonMsg<User> jsonMsg=new jsonMsg<User>();
        User u=userdao.selectPasswordByUsername(loginVO.getUsername());
        if(u!=null&&u.getPassword().equals(loginVO.getPassword())){
            List<User> list=new ArrayList<User>();
            list.add(u);
            jsonMsg.setData(list);
            jsonMsg.setMsg("success");

        }else {
            jsonMsg.setMsg("fail");
        }
        return jsonMsg;
    }



    @Override
    public BaseResult selectByName(String username) {
        User u=userdao.selectByName(username);
        if(u==null){
            return BaseResult.success();
        }else {
            return BaseResult.fail("用户名已存在");
        }

    }

    @Override
    public BaseResult insert(User user) {
        BaseResult baseResult;
        if(checkUser(user)){
            user.setCreated(new Date());
            user.setUpdated(new Date());
            userdao.insert(user);
            baseResult=BaseResult.success();
        }else
            baseResult=BaseResult.fail("输入不符合要求");
        return baseResult;
    }

    @Override
    public User userLogin(User user) {
        return userdao.selectPasswordByUsername(user.getUsername());
    }

    @Override
    public User selectById(Long id) {
        return userdao.selectById(id);
    }

    @Override
    public PageInfo<User> page(int draw, int start, int length, User user) {
        PageInfo<User> pageInfo=new PageInfo<User>();
        Map<String,Object> map=new HashMap<String, Object>();
        pageInfo.setDraw(draw);
        pageInfo.setRecordsTotal(userdao.count(user));
        map.put("start",start);
        map.put("length",length);
        map.put("user",user);
        pageInfo.setData(userdao.selectByPage(map));
        pageInfo.setRecordsFiltered(pageInfo.getRecordsTotal());
        return pageInfo;
    }

    @Override
    public BaseResult save(User user) {
        String validator = BeanValidator.validator(user);
        if(validator!=null){
            return BaseResult.fail(validator);
        }else {
            if(user.getId()!=0)
                userdao.update(user);
            else
                userdao.insert(user);
            return BaseResult.success();
        }


    }

    @Override
    public BaseResult deleteByIds(String[] ids) {
        userdao.deleteById(ids);
        return BaseResult.success();
    }

    private boolean checkUser(User user){
        String userNameReg="^[a-zA-Z0-9_-]{3,20}$";
        String emailReg="^([a-z0-9A-Z]+[-|\\.]?)+[a-z0-9A-Z]@([a-z0-9A-Z]+(-[a-z0-9A-Z]+)?\\.)+[a-zA-Z]{2,}$";
        String passwordReg="^[A-Za-z0-9]{6,20}$";
        Pattern patternUserName = Pattern.compile(userNameReg);
        Pattern patternEmail = Pattern.compile(emailReg);
        Pattern patternPassword = Pattern.compile(passwordReg);
        if(patternUserName.matcher(user.getUsername()).matches()){
            if(patternEmail.matcher(user.getEmail()).matches()){
                if(patternPassword.matcher(user.getPassword()).matches()){
                    return true;
                }
            }
        }
        return false;
    }

}
