package com.xzh.web.web.admin.service;

import com.xzh.web.commons.dto.BaseResult;
import com.xzh.web.domain.ItemCat;

import java.util.List;
import java.util.Map;

public interface ItemCatService {
    List<ItemCat> selectAllParent();

    List<ItemCat> selectByParent(Long id);

    Map<String, Map<String, List<ItemCat>>> selectThree();

    ItemCat selectById(Long id);


    List<ItemCat> selectAllCategory();

    BaseResult save(ItemCat itemCat);
}
