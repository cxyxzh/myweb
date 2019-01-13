package com.xzh.web.web.admin.web.controller;

import com.xzh.web.commons.dto.BaseResult;
import com.xzh.web.commons.dto.PageInfo;
import com.xzh.web.domain.User;
import com.xzh.web.web.admin.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import javax.servlet.http.HttpServletRequest;
import java.util.Date;

@Controller
@RequestMapping("admin")
public class adminController {

    @Autowired
    private UserService userService;

    @ModelAttribute
    public User getUser(Long id){
        User tbUser=new User();
        if(id!=null&&id!=0){
            tbUser=userService.selectById(id);
        }

        return  tbUser;
    }

    @GetMapping("login")
    public String login_jsp(){
        return "login";
    }
    @GetMapping("userlist")
    public String userList(Model model){
        return "user_list";
    }

    @GetMapping("page")
    @ResponseBody
    public PageInfo<User> page(HttpServletRequest request,User user){
        String strDraw = request.getParameter("draw");
        String strStart = request.getParameter("start");
        String strLength = request.getParameter("length");
        int draw = strDraw == null ? 1 : Integer.parseInt(strDraw);
        int start = strStart == null ? 0 : Integer.parseInt(strStart);
        int length = strLength == null ? 10 : Integer.parseInt(strLength);
        PageInfo<User> pageInfo=userService.page(draw,start,length,user);
        return pageInfo;
    }
    @PostMapping("login")
    public String login(HttpServletRequest request,User user,Model model){
        User u = userService.userLogin(user);
        if(u==null||!(u.getPassword().equals(user.getPassword()))){
            model.addAttribute("msg","用户名或密码错误");
            return "login";
        }else {
            request.getSession().setAttribute("user",u);
            return "index";
        }
    }

    @RequestMapping(value="save",method = RequestMethod.POST)
    public String save(User user, RedirectAttributes redirectAttributes, Model model){
        user.setUpdated(new Date());
        user.setCreated(new Date());
        BaseResult baseResult = userService.save(user);
        if(baseResult.getStatus()==BaseResult.STATUS_SUCCESS){
            //如果表单验证通过了,把封装了具体状态码和信息的baseResult对象转递到目标页面
            redirectAttributes.addFlashAttribute("baseResult",baseResult);
            return "redirect:/admin/userlist";
        }
        else{
            //如果表单验证没有通过
            //返回错误信息，并且回到新增页面
            model.addAttribute("baseResult",baseResult);
            return "user_form";
        }
    }
    @RequestMapping(value="form",method = RequestMethod.GET)
    public String form(){
        return "user_form";
    }
    @GetMapping("detail")
    public String detail(){
        return "user_detail";
    }

    @GetMapping("deletemulti")
    @ResponseBody
    public BaseResult deletemulti(String ids){
        String[] split = ids.split(",");
        return userService.deleteByIds(split);
    }

}
