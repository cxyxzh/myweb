package com.xzh.web.web.admin.web.controller;

import com.xzh.web.commons.utils.MyTree;
import com.xzh.web.commons.utils.MyTreeUtils;
import com.xzh.web.commons.vo.ItemInfoVO;
import com.xzh.web.commons.vo.PageVO;
import com.xzh.web.domain.Item;
import com.xzh.web.domain.ItemCat;
import com.xzh.web.web.admin.service.ItemCatService;
import com.xzh.web.web.admin.service.ItemService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import javax.servlet.http.HttpServletRequest;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;

@Controller
@RequestMapping("item")
public class ItemController {

    private MyTreeUtils myTreeUtils=new MyTreeUtils();

    @Autowired
    ItemService itemService;

    @Autowired
    ItemCatService itemCatService;

    //通过各种条件获取满足条件的所有商品的信息
    @GetMapping("getitembycid")
    public String getItembyCid(HttpServletRequest request,Model model, PageVO<Item> pageVO){

        if(pageVO.getPage()==0)
            pageVO.setPage(1);
        ItemCat itemCat = itemCatService.selectById(pageVO.getCid());
        List<Long> ids=new ArrayList<Long>();
        myTreeUtils.getAllChildId(((Map<Long,MyTree>)request.getServletContext().getAttribute("treeMap")).get((Long) pageVO.getCid()),ids);
        pageVO.setIds(ids);

        pageVO.setBegin((pageVO.getPage()-1)*20);
        List<Item> list=itemService.selectItemByCid(pageVO);
        pageVO.setData(list);

        pageVO.setRecordsTotal(itemService.count(pageVO));
        pageVO.setMaxPage((int) Math.ceil(pageVO.getRecordsTotal()*1.0/20));
        model.addAttribute("pageVO",pageVO);
        return "item";
    }

    //获取商品信息和推荐信息
    @GetMapping("info")
    public String info(Item item,HttpServletRequest request,Model model){
        PageVO pageVO=new PageVO();
        List<Long> ids=new ArrayList<Long>();
        Map<Long,MyTree> myTreeMap=(Map<Long,MyTree>)request.getServletContext().getAttribute("treeMap");
        myTreeUtils.getAllChildId((myTreeMap).get(item.getParent().getId()),ids);
        pageVO.setIds(ids);
        pageVO.setDraw(1);
        pageVO.setPage(1);
        ItemInfoVO itemInfoVO=new ItemInfoVO();
        itemInfoVO.setRecommend(itemService.selectItemByCid(pageVO));
        itemInfoVO.setItem(itemService.selectById(item.getId()));
        model.addAttribute("ItemVO",itemInfoVO);
        return "iteminfo";
    }
}
