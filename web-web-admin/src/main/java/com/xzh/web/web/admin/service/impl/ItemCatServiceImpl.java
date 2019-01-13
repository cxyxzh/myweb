package com.xzh.web.web.admin.service.impl;

import com.xzh.web.commons.dto.BaseResult;
import com.xzh.web.commons.utils.BeanValidator;
import com.xzh.web.domain.ItemCat;
import com.xzh.web.web.admin.dao.ItemCatDao;
import com.xzh.web.web.admin.service.ItemCatService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Service
public class ItemCatServiceImpl implements ItemCatService{

    @Autowired
    private ItemCatDao<ItemCat> itemCatDao;

    @Override
    public List<ItemCat> selectAllParent() {
        return itemCatDao.selectAllParent();
    }

    @Override
    public List<ItemCat> selectByParent(Long parentId) {
        return itemCatDao.selectByParent(parentId);
    }

    @Override
    public  Map<String, Map<String, List<ItemCat>>> selectThree() {
        Map<String, Map<String, List<ItemCat>>> allmap=new HashMap<String, Map<String, List<ItemCat>>>();
        //查找一级
        for(ItemCat ic_1:itemCatDao.selectAllParent()){
            //查找二级
            Map<String, List<ItemCat>> map_2=new HashMap<String, List<ItemCat>>();
            for(ItemCat ic_2:itemCatDao.selectByParent(ic_1.getId())){
              map_2.put(ic_2.getName(),itemCatDao.selectByParent(ic_2.getId()));
            }
            allmap.put((ic_1.getId()+""),map_2);
        }
        return allmap;
    }

    @Override
    public ItemCat selectById(Long id) {
        return itemCatDao.selectById(id);
    }

    @Override
    public List<ItemCat> selectAllCategory() {
        return itemCatDao.selectAllCategory();
    }

    @Override
    public BaseResult save(ItemCat itemCat) {
        String validator = BeanValidator.validator(itemCat);
        if(validator==null) {
            if(itemCat.getParentItemCat().getId()!=0){
                ItemCat parentItemCat=itemCatDao.selectById(itemCat.getParentItemCat().getId());
                if(!parentItemCat.getIsParent()){
                    parentItemCat.setIsParent(true);
                    itemCatDao.update(parentItemCat);
                }
            }
            if (itemCat.getId() == null) {
                //新建
                itemCat.setCreated(new Date());
                itemCat.setIsParent(false);
                itemCat.setStatus(1);
                itemCat.setUpdated(new Date());
                itemCatDao.insert(itemCat);
                return BaseResult.success("新建成功");
            }else {
                itemCatDao.update(itemCat);
                return BaseResult.success("编辑成功");
            }
        }
        return BaseResult.fail(validator);
    }
}
