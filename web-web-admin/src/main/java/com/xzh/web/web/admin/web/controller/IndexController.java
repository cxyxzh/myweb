package com.xzh.web.web.admin.web.controller;

import com.xzh.web.domain.ItemCat;
import com.xzh.web.web.admin.service.ItemCatService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import javax.servlet.http.HttpServletRequest;
import java.util.*;

@Controller
public class IndexController {

    @Autowired
    private ItemCatService itemCatService;

    @GetMapping("item")
    public String item(){
        return "item";
    }

    @GetMapping("head")
    public String head(HttpServletRequest request){

        return "head";
    }

    @GetMapping("reg")
    public String reg(){
        return "reg";
    }
    @RequestMapping(value = "/index",method = RequestMethod.GET)
    public  String test(HttpServletRequest request){
        return "test";
    }

}
