package com.xzh.web.web.admin.web.controller;

import com.xzh.web.commons.dto.BaseResult;
import com.xzh.web.domain.ItemCat;
import com.xzh.web.web.admin.service.ItemCatService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import java.util.ArrayList;
import java.util.List;

@Controller
@RequestMapping("admin/item")
public class adminItemController {

    @Autowired
    ItemCatService itemCatService;
    @GetMapping("itemcatlist")
    public String itemcatlist(Model model){
        List<ItemCat> itemCats = itemCatService.selectAllCategory();
        List<ItemCat> target=new ArrayList<ItemCat>();
        sort(itemCats,target,0L);
        model.addAttribute("itemcats",target);
        return "content_category_list";
    }


    @PostMapping("save")
    public String save(ItemCat itemCat, RedirectAttributes redirectAttributes,Model model){
        BaseResult baseResult=itemCatService.save(itemCat);
        if(baseResult.getStatus()==200){
            redirectAttributes.addFlashAttribute("baseResult",baseResult);
            return "redirect:/admin/item/itemcatlist";
        }else {
            model.addAttribute("baseResult",baseResult);
            model.addAttribute("itemcat",itemCat);
            return "content_category_form";
        }

    }

    @PostMapping("detail")
    @ResponseBody
    public List<ItemCat> detail(Long id){
        if(id==null){
            id=0L;
        }
        List<ItemCat> itemCats = itemCatService.selectByParent(id);
        System.out.println(itemCats);
        return itemCats;
    }

    @GetMapping("form")
    public String form(ItemCat itemCat,Model model){
        if(itemCat.getId()!=null)
        itemCat=itemCatService.selectById(itemCat.getId());
        else itemCat=new ItemCat();
        model.addAttribute("itemcat",itemCat);
        return "content_category_form";
    }
    private void sort(List<ItemCat> itemCats,List<ItemCat> target,Long parentId){

        for (int i = 0; i < itemCats.size();i++) {
            ItemCat itemCat=itemCats.get(i);
            if(itemCats.get(i).getParentItemCat().getId()==parentId){
                target.add(itemCat);
                itemCats.remove(itemCat);
                i--;
                sort(itemCats,target,itemCat.getId());
            }
        }
    }
}
